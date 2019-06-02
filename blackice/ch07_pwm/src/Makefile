chip.bin: debouncer.v pwm_tester.v pwm.v pwm_tester.pcf
	yosys -q -p "synth_ice40 -json chip.json" debouncer.v pwm_tester.v pwm.v
	nextpnr-ice40 --hx8k --package tq144:4k --pcf pwm_tester.pcf --json chip.json --asc chip.asc
	icepack chip.asc chip.bin

.PHONY: upload
upload:
	(stty raw -echo;cat) < /dev/ttyACM0 &
	cp chip.bin /dev/ttyACM0

.PHONY: clean
clean:
	$(RM) -f chip.blif chip.txt chip.ex chip.bin
