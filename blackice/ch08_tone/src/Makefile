chip.bin: tone.v tone_tester.v tone_tester.pcf
	yosys -q -p "synth_ice40 -json chip.json" tone_tester.v tone.v
	nextpnr-ice40 --hx8k --package tq144:4k --pcf tone_tester.pcf --json chip.json --asc chip.asc
	icepack chip.asc chip.bin

.PHONY: upload
upload:
	(stty raw -echo;cat) < /dev/ttyACM0 &
	cp chip.bin /dev/ttyACM0

.PHONY: clean
clean:
	$(RM) -f chip.json chip.txt chip.asc chip.bin
