# PCB-ADR-Routing

## Number of ADR Signal(multiple-pin net)

A "multiple-pin net" is defined as a net that connects three or more pins.

* case1: no multiple-pin nets
* case2: 31 3-pin nets
* case3: 29 3-pin nets
* case4: 46 3-pin nets, 2 4-pin nets
* case5: 25 10-pin nets
* case6: 23 6-pin nets
* case7: no multiple-pin nets

<details> <summary>Netlist Pin Count </summary>

* case1
```
1-pin nets: 1
2-pin nets: 49
```
* case2
```
1-pin nets: 12
2-pin nets: 44
3-pin nets: 31
55-pin nets: 1
```

* case3
```
1-pin nets: 3
2-pin nets: 44
3-pin nets: 29
```

* case4
```
1-pin nets: 1
2-pin nets: 96
3-pin nets: 46
4-pin nets: 2
88-pin nets: 1
```

* case5
```
1-pin nets: 14
2-pin nets: 107
10-pin nets: 25
124-pin nets: 1
```

* case6
```
1-pin nets: 20
2-pin nets: 99
6-pin nets: 23
114-pin nets: 1
```

* case7
```
2-pin nets: 69
60-pin nets: 1
```
</details>
