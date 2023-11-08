#!/usr/bin/python3
"""
PCB Net Plotter

This script reads an .adr file containing information about PCB (Printed Circuit Board) nets,
parses the content to identify components and their connections, and generates a visual
representation of these nets. Each pin is represented by a small circle, and each component
is denoted by a unique color.

Usage:
    ./draw <input path> <output path>

Arguments:
    <input path>    Path to the input .adr file containing the net definitions.
    <output path>   Path where the output image (.png format) will be saved.

The script requires Python 3 and the following packages: re, numpy, matplotlib.
"""

import re
import numpy as np
import matplotlib.pyplot as plt
import sys


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
        elif line.startswith('#') or line.startswith('PIN'):
            continue
        elif line.startswith('NetName:'):
            current_net = line.split('NetName:')[1].strip()
            nets[current_net] = []
        else:
            if current_net:
                component_info, coordinates = line.rsplit(' ', 1)
                x, y = map(float, coordinates.split(','))
                nets[current_net].append({'component': component_info, 'x': x, 'y': y})
    return nets


# Function to normalize coordinates
def normalize_coordinates(nets):
    """
    Normalizes the coordinates of the pins to fit within a unit square, which helps
    in plotting them on a consistent scale.

    Parameters:
        nets (dict): The dictionary of nets with component and pin information.

    Returns:
        dict: The updated dictionary with normalized coordinates.
    """
    x_coords = [comp['x'] for net in nets.values() for comp in net]
    y_coords = [comp['y'] for net in nets.values() for comp in net]
    min_x, max_x = min(x_coords), max(x_coords)
    min_y, max_y = min(y_coords), max(y_coords)

    for net_name, net in nets.items():
        for comp in net:
            comp['x'] = (comp['x'] - min_x) / (max_x - min_x)
            comp['y'] = (comp['y'] - min_y) / (max_y - min_y)

    return nets


# Function to plot the nets with smaller circles and save as an image file
def plot_nets(nets, output_file_path):
    """
    Plots the nets with components represented as small circles and saves the figure to a file.

    Parameters:
        nets (dict): The dictionary of nets with component and pin information.
        output_file_path (str): The path to the output image file.
    """
    fig, ax = plt.subplots(figsize=(20, 20))  # Large plot area size
    ax.set_facecolor('black')  # Set background to black

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
    if len(sys.argv) != 3:
        print("Usage: ./draw <input path> <output path>")
        sys.exit(1)  # Exit if not the correct number of arguments

    adr_file_path = sys.argv[1]  # First argument is the input path
    output_image_path = sys.argv[2]  # Second argument is the output path

    # Read the .adr file content
    with open(adr_file_path, 'r') as file:
        adr_content = file.readlines()

    # Process the .adr file content
    nets_data = parse_adr(adr_content)
    normalized_nets = normalize_coordinates(nets_data)

    # Plot and save the image
    plot_nets(normalized_nets, output_image_path)
