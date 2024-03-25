from pulp import *
import math
# 定義問題
prob = LpProblem("Minimize_Max_Min_Difference", LpMinimize)

# 定義變數
num = 9
layer = 2
x = LpVariable.dicts("x", (range(layer), range(num)), lowBound=0)  # Creates x0, x1, x2, and x3
s = LpVariable.dicts("s", (range(layer), range(num)), lowBound=0)
# z = LpVariable.dicts("z", range(num), lowBound=0, cat='Binary')
d_max = LpVariable("d_max")
d_min = LpVariable("d_min")

# 常量
e = [[518.76, 581.164, 600.9, 676.302, 549.706, 613.296, 707.774, 833.138, 738.646]
     , [707.731, 707.746, 612.607, 549.72, 739.288, 833.762, 675.63, 644.115, 928.228]]
ho = [[578.77, 745.105, 719.515, 732.31, 770.695, 706.72, 681.13, 693.925, 642.745]
      , [629.95, 834.67, 796.285, 821.875, 655.54, 809.08, 668.335, 617.155, 604.36]]
hd = [[38.395, 69.885, 101.375, 132.865, 164.355, 195.845, 227.335, 258.825, 290.315]
      , [38.395, 69.885, 101.375, 132.865, 164.355, 195.845, 227.335, 258.825, 290.315]]
c = [[0 for _ in sublist] for sublist in e]

for k in range(0, layer):
    for i in range(num):
        c[k][i] = e[k][i] + ho[k][i] + math.sqrt(2) * hd[k][i]
# show the size of e, ho, hd, c
print(len(e), len(e[0]))
print(len(ho), len(ho[0]))
print(len(hd), len(hd[0]))
print(len(c), len(c[0])) # 9, 2
# show the size of x, s
print(len(x), len(x[0]))
print(len(s), len(s[0])) # 9, 2

L = 150
P = 9
l_dia = 5
MW = 5
h_sna = 15
M = 100000
# 目標函數
# prob += d_max - d_min
prob += x[0][8] + x[1][8]

# 約束條件
for k in range(0, layer):
    for i in range(1, num):
        prob += x[k][i] - x[k][i-1] >= P + ( (2/math.sqrt(2)) * l_dia) # f"Min_distance_between_x{i-1}_and_x{i}"
for k in range(0, layer):
    for i in range(0, num):
        prob += s[k][i] <= (ho[k][i] + math.sqrt(2) * hd[k][i]) / (4 / math.sqrt(2) * l_dia + 2 * MW)
        prob += d_max >= c[k][i] + 2 * x[k][i] + s[k][i] * (4 * (1 - (1 / math.sqrt(2))) * l_dia + 2 * h_sna)
        prob += d_min <= c[k][i] + 2 * x[k][i] + s[k][i] * (4 * (1 - (1 / math.sqrt(2))) * l_dia + 2 * h_sna)

prob += d_max - d_min <= L

# 求解
status = prob.solve()

# Modify result dictionary to store results in a more structured way
results = {
    "Status": LpStatus[status],
    "d_max": value(d_max),
    "d_min": value(d_min),
    "Objective": value(prob.objective),
    "x_values": {k: {i: value(x[k][i]) for i in range(num)} for k in range(layer)},
    "s_values": {k: {i: value(s[k][i]) for i in range(num)} for k in range(layer)},
    "sum_values": {k: {i: value(c[k][i] + 2 * x[k][i] + s[k][i] * (4 * (1 - (1 / math.sqrt(2))) * l_dia + 2 * h_sna)) for i in range(num)} for k in range(layer)},
    "e_values": e,
    "ho_values": ho,
    "hd_values": hd,
    "c_values": c
}

# Printing results including e, ho, hd, and c in a readable format
print("Optimization Status:", results["Status"])
print("d_max:", results["d_max"])
print("d_min:", results["d_min"])
print("Objective Function Value:", results["Objective"])

for k in range(layer):
    print(f"\nLayer {k+1}:")
    for i in range(num):
        print(f"  x[{k}][{i}]: {results['x_values'][k][i]}, s[{k}][{i}]: {results['s_values'][k][i]}, sum[{k}][{i}]: {results['sum_values'][k][i]}")
        print(f"  \te[{k}][{i}]: {results['e_values'][k][i]}, ho[{k}][{i}]: {results['ho_values'][k][i]}, hd[{k}][{i}]: {results['hd_values'][k][i]}, c[{k}][{i}]: {results['c_values'][k][i]}")
        
with open('../outputs/x_values.csv', 'w') as file:
    for k in range(layer):
        x_values = [str(value(x[k][i])) for i in range(num)]
        file.write(','.join(x_values) + '\n')
        
with open('../outputs/s_values.csv', 'w') as file:
    for k in range(layer):
        x_values = [str(value(s[k][i])) for i in range(num)]
        file.write(','.join(x_values) + '\n')