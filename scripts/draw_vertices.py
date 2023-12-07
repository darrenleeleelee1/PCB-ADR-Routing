#!/usr/bin/python3
"""
draw_vertices.py

A script to visualize vertex data for a graph. This script reads JSON-formatted vertex data
from an input file and generates a graphical representation of the vertices, saving the output
as an image.

Usage:
    python3 draw_vertices.py <input_path> <output_path>

Where:
    <input_path>  - Path to the JSON file containing the vertex data.
    <output_path> - Path where the output image will be saved.

The JSON file should contain vertex data in the following format:
[
    {
        "type": "VertexProperties",
        "coordinate": {"x": <x_value>, "y": <y_value>}
        // ... other properties
    },
    // ... other vertices
]
"""

import json
import sys
import matplotlib.pyplot as plt
import networkx as nx


def read_vertex_data(input_path):
    """Reads and returns the vertex data from a JSON file."""
    with open(input_path, 'r') as file:
        return json.load(file)


def create_graph(vertices_data):
    """Creates and returns a graph from the given vertex data."""
    G = nx.Graph()

    for vertex in vertices_data:
        vertex_id = (vertex['coordinate']['x'], vertex['coordinate']['y'])
        vertex_type = vertex['type']

        # Add the node
        G.add_node(vertex_id, type=vertex_type)

        # Additional properties based on type
        if vertex_type == 'PinVertex':
            G.nodes[vertex_id]['name'] = vertex.get('name', '')
        elif vertex_type == 'TileVertex':
            G.nodes[vertex_id]['tileType'] = vertex.get('tileType', '')

    return G


def draw_graph(G, output_path):
    """Draws the graph and saves it to the specified output path."""
    # Define node colors and shapes
    default_colors = {'VertexProperties': 'lightblue', 'PinVertex': 'lightgreen', 'TileVertex': 'lightcoral'}
    shapes = {'VertexProperties': 'o', 'PinVertex': 'o', 'TileVertex': 's'}

    # Define positions
    grid_size = 5
    pos = {node: (node[0]*grid_size, node[1]*grid_size) for node in G.nodes()}

    # Create figure
    plt.figure(figsize=(20, 18))

    # Draw the nodes
    for node in G.nodes():
        node_type = G.nodes[node]['type']
        shape = shapes[node_type]
        # Check if the node is a TileVertex with type V
        if node_type == 'TileVertex' and G.nodes[node].get('tileType') == 'V':
            color = 'purple'  # Specific color for TileVertex type V
        else:
            color = default_colors[node_type]

        nx.draw_networkx_nodes(G, pos, node_shape=shape, nodelist=[node], node_color=color)

    # Draw the labels for PinVertex and TileVertex
    labels = {
        node: G.nodes[node].get('name', G.nodes[node].get('tileType', ''))
        for node in G.nodes()
        if G.nodes[node]['type'] in ['PinVertex', 'TileVertex']
    }

    nx.draw_networkx_labels(G, pos, labels, font_size=10)

    # Adjust plot
    plt.title("Graph Visualization of Vertex Data")
    plt.axis('off')

    # Save the plot
    plt.savefig(output_path, format='png')
    plt.close()


def main():
    if len(sys.argv) != 3:
        print("Usage: python3 draw_vertices.py <input_path> <output_path>")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    # Read vertex data from the input file
    vertices_data = read_vertex_data(input_path)

    # Create the graph
    G = create_graph(vertices_data)

    # Draw the graph and save it
    draw_graph(G, output_path)


if __name__ == "__main__":
    main()
