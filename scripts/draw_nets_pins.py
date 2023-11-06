#!/usr/bin/python3
import matplotlib.pyplot as plt
import random

# 用於獲取隨機顏色的函數
def get_random_color():
    return "#"+''.join([random.choice('0123456789ABCDEF') for j in range(11)])

# 解析文件的函數
def parse_adr(file_path):
    nets = {}
    with open(file_path, 'r') as file:
        lines = file.readlines()
        current_net = ""
        for line in lines:
            if line.startswith('NetName:'):
                current_net = line.strip().split(' ')[1]
                nets[current_net] = []
            elif line.strip() and current_net:
                # 確保行包含逗號，這表明這應該是坐標數據
                if ',' in line:
                    parts = line.strip().split()
                    component_pin = parts[0]
                    try:
                        x, y = map(float, parts[1].split(','))
                        nets[current_net].append((component_pin, (x, y)))
                    except ValueError as e:
                        # 如果轉換失敗，跳過這行
                        print(f"Warning: Could not parse line: {line.strip()}. Error: {e}")
    return nets

# 繪製 nets 的函數
def plot_nets(nets, output_path):
    fig, ax = plt.subplots()

    # 为每个component分配颜色
    colors = {}
    for net in nets:
        for comp_pin, coords in nets[net]:
            component = comp_pin.split('.')[0]
            if component not in colors:
                colors[component] = get_random_color()

    # 绘制每个pin
    for net in nets:
        for comp_pin, (x, y) in nets[net]:
            component = comp_pin.split('.')[0]
            ax.scatter(x, y, edgecolor=colors[component], facecolors='none', s=1, label=component)

    # 调整点的大小以避免重叠，可以尝试减小尺寸或者对坐标进行微调

    # 为了不重复标签，设置legend
    handles, labels = plt.gca().get_legend_handles_labels()
    unique = [(h, l) for i, (h, l) in enumerate(zip(handles, labels)) if l not in labels[:i]]
    ax.legend(*zip(*unique))

    plt.xlabel('X Coordinate')
    plt.ylabel('Y Coordinate')
    plt.title('Net Plot')
    plt.grid(True)
    plt.axis('equal')

    # 计算最大最小坐标以便调整
    max_x = max([coord[0] for net in nets for _, coord in nets[net]])
    min_x = min([coord[0] for net in nets for _, coord in nets[net]])
    max_y = max([coord[1] for net in nets for _, coord in nets[net]])
    min_y = min([coord[1] for net in nets for _, coord in nets[net]])

    # 扩大框框，调整到合适的坐标轴范围
    ax.set_xlim([min_x - 1, max_x + 1])
    ax.set_ylim([min_y - 1, max_y + 1])
    
    # 保存图像
    plt.savefig(output_path)
    plt.close()

# 主函數
def main():
    # file_path = input("Enter the path of your .adr file: ")
    # output_path = input("Enter the path where you want to save the image: ")
    file_path = '/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.adr'
    output_path = '/DATA/darren/PCB/PCB-ADR-Routing/outputs/output.png'
    # 解析文件並繪製圖像
    nets = parse_adr(file_path)
    plot_nets(nets, output_path)

    print(f"Plot has been saved to {output_path}")

# 執行主函數
if __name__ == "__main__":
    main()

