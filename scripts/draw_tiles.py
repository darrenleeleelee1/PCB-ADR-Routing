#!/usr/bin/python3
"""
PCB Tile and Pin Visualizer

This script is designed to parse and visualize the layout of tiles and pins on
a Printed Circuit Board (PCB) from a specific file format. It reads a file
containing information about PCB components, their respective pins, and their
placement in terms of tiles, and generates a visual representation of this
layout. The visualization is saved as an image file at the specified output
path.

Usage:
    python draw_tiles.py <input file path> <output path>

Arguments:
    <input file path>    Path to the input file containing PCB layout information.
    <output path>        Path where the output image will be saved (in .png format).

The script requires Python 3 and the following packages: sys, re, matplotlib.

Details:
- The input file should contain information about multiple PCB components, each with its pins and tiles.
- The script extracts tile sizes and pin locations from the input file, then visualizes them on a combined plot.
- Each component's pins are represented as blue dots with labels for identification.
- Tiles are visualized as red rectangles.
- Tile dimensions (width and height) are dynamically extracted from the file content.
- The visualization aids in PCB design and debugging by providing a clear spatial representation of component layouts.
- The resulting image is saved at the specified output path, allowing for easy sharing and analysis.

Example File Format:
    Component Name: U61
    Pins:
    Pin Name: P2 (30.000000 25.000000 0)
    Pin Name: R3 (25.000000 25.000000 0)
    ...
    Tiles:
    Layer 0:
    Tile [0][0] Bottom Left: (20.000000 20.000000 0)
    ...
"""
import sys
import re
import matplotlib.pyplot as plt
import matplotlib.patches as patches


def parse_data_multi_component(file_contents):
    """
    Parses the file contents to extract information about multiple components.
    Each component's pins and tiles are extracted and stored.

    :param file_contents: String content of the file to be parsed.
    :return: A list of tuples, each containing pins and tiles for a component.
    """
    components_data = file_contents.split("Component Name:")[1:]
    all_components = []
    for component_data in components_data:
        pin_pattern = r"Pin Name: (\w+) \(([\d.]+) ([\d.]+) ([\d.]+)\)"
        tile_pattern = r"Tile \[\d+\]\[\d+\] Bottom Left: \(([\d.]+) ([\d.]+) ([\d.]+)\)"
        pins = re.findall(pin_pattern, component_data)
        pins = [{'name': p[0], 'x': float(p[1]), 'y': float(p[2]), 'z': float(p[3])} for p in pins]
        tiles = re.findall(tile_pattern, component_data)
        tiles = [{'x': float(t[0]), 'y': float(t[1]), 'z': float(t[2])} for t in tiles]
        all_components.append((pins, tiles))
    return all_components


def extract_tile_offsets(file_contents):
    """
    Extracts the tile offsets from the file contents.

    :param file_contents: String content of the file to be parsed.
    :return: A tuple containing tile_x_offset and tile_y_offset.
    """
    tile_x_pattern = r"Minimum Non-Zero X Offset\(Tile Width\): (\d+)"
    tile_y_pattern = r"Minimum Non-Zero Y Offset\(Tile Height\): (\d+)"
    tile_x_offset = int(re.search(tile_x_pattern, file_contents).group(1))
    tile_y_offset = int(re.search(tile_y_pattern, file_contents).group(1))
    return tile_x_offset, tile_y_offset


def visualize_data_combined(all_components, tile_x_offset, tile_y_offset, output_file_path):
    """
    Visualizes all components combined in one plot.

    :param all_components: List of tuples containing pins and tiles for each component.
    :param tile_x_offset: Tile width.
    :param tile_y_offset: Tile height.
    """
    fig, ax = plt.subplots(figsize=(10, 10))
    for pins, tiles in all_components:
        for tile in tiles:
            rect = patches.Rectangle(
                (tile['x'], tile['y']),
                tile_x_offset,
                tile_y_offset,
                linewidth=1,
                edgecolor='r',
                facecolor='none'
            )
            ax.add_patch(rect)
        for pin in pins:
            ax.plot(pin['x'], pin['y'], 'bo')
            ax.text(pin['x'], pin['y'], pin['name'], fontsize=8, ha='right')
    all_tiles = [tile for _, tiles in all_components for tile in tiles]
    if all_tiles:
        ax.set_xlim(0, max(tile['x'] for tile in all_tiles) + tile_x_offset)
        ax.set_ylim(0, max(tile['y'] for tile in all_tiles) + tile_y_offset)
    else:
        ax.set_xlim(0, 10)
        ax.set_ylim(0, 10)
    ax.set_xlabel('X Coordinate')
    ax.set_ylabel('Y Coordinate')
    plt.title('Combined Tile and Pin Visualization')

    # plt.show()
    # Save the figure with a tight layout
    plt.tight_layout()
    plt.savefig(output_file_path, dpi=300, facecolor=ax.get_facecolor())
    plt.close()


# Main execution
if __name__ == "__main__":
    # Reading file from the first argument
    file_path = sys.argv[1]
    output_image_path = sys.argv[2]
    with open(file_path, 'r') as file:
        file_contents = file.read()

    # Parse components and extract tile offsets
    all_components = parse_data_multi_component(file_contents)
    tile_x_offset, tile_y_offset = extract_tile_offsets(file_contents)

    # Visualize the data
    visualize_data_combined(all_components, tile_x_offset, tile_y_offset, output_image_path)
