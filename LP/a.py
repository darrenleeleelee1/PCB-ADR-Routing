from pulp import *
import math
# 定義問題
prob = LpProblem("Minimize_Max_Min_Difference", LpMinimize)

# 定義變數
num = 9
layer = 2
x = LpVariable.dicts("x", (range(layer), range(num)), lowBound=0)  # Creates x0, x1, x2, and x3
s = LpVariable.dicts("s", (range(layer), range(num)), lowBound=0)
f = LpVariable.dicts("f", (range(layer), range(num)), lowBound=0)
# y = LpVariable.dicts("y", (range(layer), range(num)), cat='Binary')

# ho = LpVariable.dicts("ho", (range(layer), range(num)), lowBound=0)
# hd = LpVariable.dicts("hd", (range(layer), range(num)), lowBound=0)

d_max = LpVariable("d_max")
d_min = LpVariable("d_min")

# 常量
e = [[518.76, 581.164, 600.9, 676.302, 549.706, 613.296, 707.774, 833.138, 738.646]
     , [707.731, 707.746, 612.607, 549.72, 739.288, 833.762, 675.63, 644.115, 928.228]]
ho = [[537.165, 734.99, 740.89, 785.175, 855.05, 822.565, 828.465, 872.75, 853.06]
            , [588.345, 824.555, 817.66, 874.74, 739.895, 924.925, 815.67, 795.98, 814.675]]
hd = [[80, 80, 80, 80, 80, 80, 80, 80, 80]
            , [80, 80, 80, 80, 80, 80, 80, 80, 80]]

c = [[0 for _ in sublist] for sublist in e]

for k in range(0, layer):
    for i in range(num):
        c[k][i] = e[k][i] + ho[k][i] + math.sqrt(2) * hd[k][i]

L = 150
P = 15
l_dia = 5
MW = 5
h_sna = 15
M = 100000
# 目標函數
prob += d_max
# prob += x[0][8] + x[1][8]

# 約束條件
# # 對於所有x, 相同層同一個 num 至少要差 P
for k in range(0, layer):
    for i in range(1, num):
        prob += x[k][i] - x[k][i-1] >= P + ((2/math.sqrt(2)) * l_dia + h_sna)
# for i in range(0, num):
#     for k in range(1, layer):
#         prob += x[k][i] - x[k-1][i] >= P + ((2/math.sqrt(2)) * l_dia + h_sna)
# for i in range(1, num):
#     prob += x[0][i] - x[layer-1][i-1] >= P + ((2/math.sqrt(2)) * l_dia + h_sna)
        
# for k in range(0, layer):
#     for i in range(0, num):
#         # 確保 s[k][i] >= 1 時，y[k][i] = 1
#         prob += s[k][i] - 0 <= M * y[k][i]
#         # 如果 s[k][i] < 1，則防止 y[k][i] 被設置為 1
#         prob += s[k][i] >= 0 - M * (1 - y[k][i])
        
for k in range(0, layer):
    for i in range(0, num):
        prob += s[k][i] <= (ho[k][i] + math.sqrt(2) * hd[k][i]) / (4 / math.sqrt(2) * l_dia + 2 * MW)
        prob += f[k][i] <= (ho[k][i] + math.sqrt(2) * hd[k][i]) / (2 / math.sqrt(2) * l_dia + 2 * MW)
        prob += d_max >= c[k][i] + 2 * x[k][i] + s[k][i] * (4 * (1 - (1 / math.sqrt(2))) * l_dia + 2 * h_sna) + f[k][i] * (2 * (1 - (1 / math.sqrt(2))) * l_dia)
        prob += d_min <= c[k][i] + 2 * x[k][i] + s[k][i] * (4 * (1 - (1 / math.sqrt(2))) * l_dia + 2 * h_sna) + f[k][i] * (2 * (1 - (1 / math.sqrt(2))) * l_dia)

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
    "f_values": {k: {i: value(f[k][i]) for i in range(num)} for k in range(layer)},
    # "y_values": {k: {i: value(y[k][i]) for i in range(num)} for k in range(layer)},
    "sum_values": {k: {i: value(c[k][i] + 2 * x[k][i] + s[k][i] * (4 * (1 - (1 / math.sqrt(2))) * l_dia + 2 * h_sna)) for i in range(num)} for k in range(layer)},
    "ho_values": {k: {i: value(ho[k][i]) for i in range(num)} for k in range(layer)},
    "hd_values": {k: {i: value(hd[k][i]) for i in range(num)} for k in range(layer)},
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
        print(f"  x[{k}][{i}]: {results['x_values'][k][i]}, t[{k}][{i}]: {results['s_values'][k][i]}, f[{k}][{i}]: {results['f_values'][k][i]}, sum[{k}][{i}]: {results['sum_values'][k][i]}")
        # print(f"  \tho[{k}][{i}]: {results['ho_values'][k][i]}, hd[{k}][{i}]: {results['hd_values'][k][i]}, c[{k}][{i}]: {results['c_values'][k][i]}")
        
with open('../outputs/x_values.csv', 'w') as file:
    for k in range(layer):
        x_values = [str(value(x[k][i])) for i in range(num)]
        file.write(','.join(x_values) + '\n')
        
with open('../outputs/s_values.csv', 'w') as file:
    for k in range(layer):
        x_values = [str(value(s[k][i])) for i in range(num)]
        file.write(','.join(x_values) + '\n')