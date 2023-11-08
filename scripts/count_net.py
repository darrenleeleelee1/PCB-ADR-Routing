#!/usr/bin/python3
"""
Script: count_net.py
Description: Parses a netlist file, categorizes nets by pin count, and prints information based on verbosity level.
Usage: ./count_net.py <case.netlist> [verbose={0, 1, 2}]
       - <case.netlist>: Path to the netlist file.
       - verbose: Verbosity level (default=0).
           0: Prints only net counts.
           1: Prints net counts and pin occurrences in nets.
           2: Prints net counts, pin occurrences, and full netlist categorized by pin count.
Example: ./count_net.py ../2/2.netlist 1
"""
import sys
import os
from collections import defaultdict


def parse_netlist(file_path, verbose=0):
    if not os.path.exists(file_path):
        print(f"File {file_path} does not exist.")
        return

    net_name = None
    parsing_pin = False
    net_categories = defaultdict(int)
    pin_occurrences_per_net_category = defaultdict(lambda: defaultdict(int))
    nets_info = defaultdict(list)  # Changed from list to defaultdict of lists

    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()

        for line in lines:
            stripped_line = line.strip()
            
            if stripped_line.startswith('#'):
                continue
            
            if stripped_line.startswith('NetName'):
                net_name = stripped_line.split()[1]
                pin_data = []
                continue

            if "PIN START" in stripped_line:
                parsing_pin = True
                u_pin_count = 0
                pin_names = []
                continue
            elif "PIN END" in stripped_line:
                parsing_pin = False
                if u_pin_count > 0:
                    net_categories[u_pin_count] += 1
                    nets_info[u_pin_count].append((net_name, pin_data))  # Store nets info based on pin count
                    if verbose >= 1:
                        for pin_name in pin_names:
                            pin_occurrences_per_net_category[u_pin_count][pin_name] += 1
                continue

            if parsing_pin and (stripped_line.startswith('U') or stripped_line.startswith('IC')):
                components = stripped_line.split()
                pin_name = components[0].split('.')[0]
                pin_data.append(f"{components[0]} {components[1]}")
                pin_names.append(pin_name)
                u_pin_count += 1

        # Print the nets information based on the pin count categories
        for pin_count in sorted(nets_info.keys()):
            if verbose >= 2:
                for net_info in nets_info[pin_count]:
                    net, pins = net_info
                    print(f"NetName: {net}")
                    print(f"PIN START")
                    for pin in pins:
                        print(f"    {pin}")
                    print(f"PIN END")
            print(f"{pin_count}-pin nets: {net_categories[pin_count]}")
            if verbose >= 1:
                print("Occurrences of each pin:")
                for pin, occurrence in pin_occurrences_per_net_category[pin_count].items():
                    print(f"{pin} : {occurrence}")
                print()  # Add a newline for better readability

    except Exception as e:
        print(f"An error occurred: {str(e)}")


def main():
    if len(sys.argv) == 2:
        print(f"Input netlist: {sys.argv[1]}")
        parse_netlist(sys.argv[1], 0)
    elif len(sys.argv) > 2:
        print(f"Input netlist: {sys.argv[1]}")
        parse_netlist(sys.argv[1], int(sys.argv[2]))
    else:
        print("Not enough command-line arguments provided.")


if __name__ == "__main__":
    main()
