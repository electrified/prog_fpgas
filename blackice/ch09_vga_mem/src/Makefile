chip.bin: vga.v vga_mem.v vga_mem.pcf
	yosys -q -p "synth_ice40 -json chip.json" vga_mem.v vga.v
	nextpnr-ice40 --hx8k --package tq144:4k --pcf vga_mem.pcf --json chip.json --asc chip.asc
	icepack chip.asc chip.bin

.PHONY: upload
upload:
	(stty raw -echo;cat) < /dev/ttyACM0 &
	cp chip.bin /dev/ttyACM0

.PHONY: clean
clean:
	$(RM) -f chip.json chip.txt chip.asc chip.bin
