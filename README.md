# RAMVerification

SystemVerilog verification testbench for a synchronous 8-bit x 64K RAM.

## Design
- Synchronous read/write on positive clock edge
- Even parity calculated on write, stored in 9th bit
- 10MHz clock

## Structure
```
project/
├── design/
│   └── my_mem.sv          # DUT - RAM module
└── verif/
    ├── mem_if.sv           # Interface with clocking block and checker
    ├── transaction_pkg.sv  # OOP Transaction class
    ├── test.sv             # Program block - stimulus and checker
    └── top.sv              # Top level - clock, DUT, interface, program
```

## Features
- Interface with modports for DUT and testbench
- Clocking block for race-free signal driving/sampling
- Checker to prevent simultaneous read and write
- OOP Transaction class with deep copy, static error counter
- 4 tasks + 2 queues (generate → drive → monitor → check)

## How to run
```bash
vcs -sverilog -f flist.f -l compile.log
./simv -l sim.log
```

## Results
10/10 transactions PASS, 0 errors
