chip.bin: debouncer.v servo_tester.v servo.v servo_tester.pcf
	yosys -q -p "synth_ice40 -json chip.json" debouncer.v servo_tester.v servo.v
	nextpnr-ice40 --hx8k --package tq144:4k --pcf servo_tester.pcf --json chip.json --asc chip.asc
	icepack chip.asc chip.bin

.PHONY: upload
upload:
	(stty raw -echo;cat) < /dev/ttyACM0 &
	cp chip.bin /dev/ttyACM0

.PHONY: clean
clean:
	$(RM) -f chip.json chip.txt chip.asc chip.bin
