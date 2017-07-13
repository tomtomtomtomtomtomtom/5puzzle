#!/bin/bash
cd ~/5puzzle
iverilog *.v
vvp ./a.out
gtkwave top_test.vcd
