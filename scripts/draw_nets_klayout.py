#!/usr/bin/python3
import sys
import re
import math
from datetime import datetime


class Pin:
    def __init__(self, name, component, net_name, net_identifier, x, y):
        self.name = name
        self.component = component
        self.net_name = net_name
        self.net_identifier = net_identifier
        self.x = x
        self.y = y

    def print(self):
        print(self.name, self.component, self.net_name, self.x, self.y)


class Net:
    def __init__(self, name, net_identifier):
        self.name = name
        self.net_identifier = net_identifier
        self.pins = []

    def add_pin(self, pin):
        self.pins.append(pin)


def generate_circle_points(center_x, center_y, radius, num_points=32):
    points = []
    center_x = float(center_x)
    center_y = float(center_y)
    radius = float(radius)

    for i in range(num_points):
        angle = (2 * math.pi * i) / num_points
        x = center_x + radius * math.cos(angle)
        y = center_y + radius * math.sin(angle)
        points.extend([round(x, 4), round(y, 4)])

    result_string = " ".join(map(str, points))
    return result_string


def writeGDT(file_name, netlist):
    with open(file_name, 'w') as file:
        now = datetime.now()
        formatted_time = now.strftime("%Y-%m-%d %H:%M:%S")
        file.write("gds2{5\n")
        file.write(f"m={formatted_time} a={formatted_time}\nlib '{file_name}' 0.001 1e-09\n")
        file.write(f"cell{{c={formatted_time} m={formatted_time} 'pins'\n")

        for count, nets in netlist.items():
            for net in nets:
                for pin in net.pins:
                    file.write(f"b{{0 xy({generate_circle_points(pin.x, pin.y, 5)})}}\n")
                    file.write(f"t{{255 tt{pin.net_name} mc m2 xy({pin.x}, {pin.y}) '{pin.net_name}'}}\n")
        file.write("}\n}\n")


# Main execution part
if __name__ == '__main__':
    # Check if two arguments are passed
    if len(sys.argv) != 3:
        print("Usage: ./draw_nets_klayout <input path> <gdt> && gdt2gds <gdt> <gds>")
        sys.exit(1)  # Exit if not the correct number of arguments

    adr_file_path = sys.argv[1]  # First argument is the input path
    output_file_path = sys.argv[2]  # Second argument is the output path

    # Read the .adr file content
    with open(adr_file_path, 'r') as file:
        content = file.readlines()

    pin_nets_pattern = re.compile(r'(?P<Number>\d+)-pin nets: (?P<Count>\d+)')
    nets_pattern = re.compile(r'NetName: (?P<NetIdentifier>[^\n]+)')
    pin_pattern = re.compile(r'(?P<Component>\w+).(?P<PinName>\w+)\s+(?P<X_Coordinate>\d+(\.\d+)?)\s*,\s*(?P<Y_Coordinate>\d+(\.\d+)?)') # noqa

    start_nets = False

    net_id_counter = 0  # Counter for assigning numerical identifiers to nets
    net_name_to_id = {}  # Dictionary to map net names to numerical identifiers
    netlist = {}
    count = None
    net_object = None
    net_identifier = None

    for line in content:
        line = line.strip()

        if line == "PIN START":
            start_nets = True
            continue

        if line == "PIN END":
            start_nets = False
            netlist[count].append(net_object)
            continue

        if start_nets:
            pin_match = pin_pattern.match(line)
            if pin_match:
                component = pin_match.group('Component')
                pin_name = pin_match.group('PinName')
                x = pin_match.group('X_Coordinate')
                y = pin_match.group('Y_Coordinate')
                net_object.add_pin(Pin(component, pin_name, net_name_to_id[net_identifier], net_identifier, x, y))
                continue

        pin_nets_match = pin_nets_pattern.match(line)
        if pin_nets_match:
            number = pin_nets_match.group('Number')
            count = pin_nets_match.group('Count')
            netlist[count] = []
            continue

        nets_match = nets_pattern.match(line)
        if nets_match:
            net_identifier = nets_match.group('NetIdentifier')
            # Check if this net name has already been assigned an ID
            if net_identifier not in net_name_to_id:
                net_name_to_id[net_identifier] = net_id_counter
                net_id_counter += 1
            net_object = Net(net_name_to_id[net_identifier], net_identifier)
            continue

    writeGDT(output_file_path, netlist)
