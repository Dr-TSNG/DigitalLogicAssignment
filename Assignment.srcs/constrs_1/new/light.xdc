## пе╨е
set_property PACKAGE_PIN P17 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## LED
set_property PACKAGE_PIN K1 [get_ports {ledtemp[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledtemp[0]}]
set_property PACKAGE_PIN H6 [get_ports {ledtemp[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledtemp[1]}]
set_property PACKAGE_PIN H5 [get_ports {ledtemp[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledtemp[2]}]
set_property PACKAGE_PIN J5 [get_ports {ledtemp[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledtemp[3]}]
set_property PACKAGE_PIN K6 [get_ports {ledtemp[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledtemp[4]}]
set_property PACKAGE_PIN L1 [get_ports {ledtemp[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledtemp[5]}]
set_property PACKAGE_PIN M1 [get_ports {ledtemp[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledtemp[6]}]
set_property PACKAGE_PIN K3 [get_ports {ledtemp[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledtemp[7]}]


create_clock -period 8.000 -name clk_pin -waveform {0.000 4.000} [get_ports clk]
set_output_delay -clock [get_clocks *] 0.000 [get_ports -filter { NAME =~  "*" && DIRECTION == "OUT" }]

