#!/usr/bin/python3
"""
PCB Net and Blockage Plotter

This script reads .adr and .gdt files containing information about PCB (Printed Circuit Board) nets and blockages,
parses the contents to identify components, their connections, and blockages, then generates a visual representation
of these nets and blockages. Each pin is represented by a small circle, and each component is denoted by a unique color.
Blockages are denoted by semi-transparent grey rectangles.

Usage:
    ./draw <adr input path> <gdt input path> <output path>

Arguments:
    <adr input path>    Path to the input .adr file containing the net definitions.
    <gdt input path>    Path to the input .gdt file containing the blockage definitions.
    <output path>       Path where the output image (.png format) will be saved.

The script requires Python 3 and the following packages: re, numpy, matplotlib.

Details:
    - The .adr file should contain net definitions with components and their pins.
    - The .gdt file should contain blockage information, which is parsed and visualized on the PCB layout.
    - The script normalizes the coordinates from both files to fit within a unit square for consistent scaling.
    - Blockages on layer 0 and layer 255 are ignored as per the requirements.
    - The blockage coordinates from the .gdt file are multiplied by 10 to match the scale of the .adr file coordinates.
"""

import re
import numpy as np
import matplotlib.pyplot as plt
import sys


# Function to parse the .gdt file for 'b' type blocks
def parse_pattern(text):
    # Define the regular expression pattern
    pattern = r'b\{(\d+)\s*dt(\d+)\s*xy\(([\d\s.]+)\)}'

    # Search for the pattern in the text
    match = re.search(pattern, text)

    # If a match is found, extract the groups
    if match:
        layer = match.group(1)
        data_type = match.group(2)
        coordinates = match.group(3).split()
        # Convert coordinate strings to float values
        coordinates = [float(coord) for coord in coordinates]
        return layer, data_type, coordinates
    else:
        return None


# Function to parse the .gdt file for 'b' type blocks
def parse_gdt_for_blocks(content):
    blocks = []
    for line in content:
        # Split the line into components
        pattern = parse_pattern(line)
        # Check if is 'b' type
        if pattern is not None:
            layer = pattern[0]
            data_type = pattern[1]
            coordinates = pattern[2]
            if layer == '0' or data_type == '255':
                continue
            x1, y1, x2, y2 = map(lambda i: coordinates[i] * 10, [0, 1, 4, 5])
            blocks.append(((x1, y1), (x2, y2)))
    return blocks


# Function to parse the .adr file and extract nets and pins data
def parse_adr(content):
    """
    Parses the contents of an .adr file and extracts the nets and pin information.

    Parameters:
        content (list of str): The lines of the .adr file as a list of strings.

    Returns:
        dict: A dictionary with net names as keys and lists of components and their pins as values.
    """
    nets = {}
    current_net = None
    net_pattern = re.compile(r'(\d+)-pin nets: (\d+)')

    for line in content:
        line = line.strip()
        if not line:
            continue

        net_match = net_pattern.match(line)
        if net_match:
            pin_count, net_count = map(int, net_match.groups())
            current_net = None
        elif line.startswith('NetName:'):
            current_net = line.split('NetName:')[1].strip()
            nets[current_net] = []
        else:
            if current_net:
                component_info, coordinates = line.rsplit(' ', 1)
                x, y = map(float, coordinates.split(','))
                nets[current_net].append({'component': component_info, 'x': x, 'y': y})
    return nets


# Function to normalize coordinates and include block coordinates
def normalize_coordinates_and_blocks(nets, blocks):
    # Get all x and y coordinates from nets and blocks
    x_coords = [comp['x'] for net in nets.values() for comp in net]
    y_coords = [comp['y'] for net in nets.values() for comp in net]

    # Include block coordinates in the normalization
    for block in blocks:
        (x1, y1), (x2, y2) = block
        x_coords.extend([x1, x2])
        y_coords.extend([y1, y2])

    # Calculate the min and max values
    min_x, max_x = min(x_coords), max(x_coords)
    min_y, max_y = min(y_coords), max(y_coords)

    # Normalize nets coordinates
    for net_name, net in nets.items():
        for comp in net:
            comp['x'] = (comp['x'] - min_x) / (max_x - min_x)
            comp['y'] = (comp['y'] - min_y) / (max_y - min_y)

    # Normalize blocks coordinates
    normalized_blocks = []
    for (x1, y1), (x2, y2) in blocks:
        norm_x1 = (x1 - min_x) / (max_x - min_x)
        norm_y1 = (y1 - min_y) / (max_y - min_y)
        norm_x2 = (x2 - min_x) / (max_x - min_x)
        norm_y2 = (y2 - min_y) / (max_y - min_y)
        normalized_blocks.append(((norm_x1, norm_y1), (norm_x2, norm_y2)))

    return nets, normalized_blocks


# Function to plot the nets with smaller circles and save as an image file
def plot_nets(nets, blocks, output_file_path):
    """
    Plots the nets with components represented as small circles and saves the figure to a file.

    Parameters:
        nets (dict): The dictionary of nets with component and pin information.
        output_file_path (str): The path to the output image file.
    """
    fig, ax = plt.subplots(figsize=(20, 20))  # Large plot area size
    ax.set_facecolor('black')  # Set background to black

    # Plot blocks first
    for block in blocks:
        (x1, y1), (x2, y2) = block
        # Create a rectangle patch
        rect = plt.Rectangle((x1, y1), x2 - x1, y2 - y1, color='grey', alpha=0.5)
        ax.add_patch(rect)

    # Generate a color map for components
    components = {comp['component'].split('.')[0] for net in nets.values() for comp in net}
    color_map = plt.cm.rainbow(np.linspace(0, 1, len(components)))
    comp_to_color = {comp: color for comp, color in zip(components, color_map)}

    # Plot each net
    for net in nets.values():
        for comp in net:
            component_base_id = comp['component'].split('.')[0]
            x, y = comp['x'], comp['y']
            color = comp_to_color[component_base_id]
            # Reduce the circle size further to avoid overlap
            circle = plt.Circle((x, y), 0.003, fill=False, edgecolor=color, lw=1)
            ax.add_patch(circle)

    # Set limits to include all points
    margin = 0.01
    ax.set_xlim(-margin, 1 + margin)
    ax.set_ylim(-margin, 1 + margin)

    # Set aspect of the plot to be equal
    ax.set_aspect('equal')

    # Remove axes for clarity
    ax.axis('off')

    # Save the figure with a tight layout
    plt.tight_layout()
    plt.savefig(output_file_path, dpi=300, facecolor=ax.get_facecolor())
    plt.close()


# Main execution part
if __name__ == '__main__':
    # Check if two arguments are passed
    if len(sys.argv) != 4:
        print("Usage: ./draw <adr input path> <gdt input path> <output path>")
        sys.exit(1)  # Exit if not the correct number of arguments

    # Paths are assigned based on command-line arguments
    adr_file_path = sys.argv[1]  # First argument is the adr input path
    gdt_file_path = sys.argv[2]  # Second argument is the gdt input path
    output_image_path = sys.argv[3]  # Third argument is the output path

    # Read the .adr file content
    with open(adr_file_path, 'r') as file:
        adr_content = file.readlines()

    # Read the .gdt file content
    with open(gdt_file_path, 'r') as file:
        gdt_content = file.readlines()

    # Process the .adr and .gdt file content, then normalize them
    nets_data = parse_adr(adr_content)
    block_data = parse_gdt_for_blocks(gdt_content)
    normalized_nets, normalized_blocks = normalize_coordinates_and_blocks(nets_data, block_data)

    # Plot and save the image
    plot_nets(normalized_nets, normalized_blocks, output_image_path)
