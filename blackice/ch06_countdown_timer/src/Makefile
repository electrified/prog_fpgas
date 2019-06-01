chip.bin: alarm.v debouncer.v decoder_7_seg.v display_7_seg.v timer.v timer.pcf
	yosys -q -p "synth_ice40 -json chip.json" timer.v alarm.v debouncer.v decoder_7_seg.v display_7_seg.v
	#arachne-pnr -d 8k -P tq144:4k -p timer.pcf chip.blif -o chip.txt
	nextpnr-ice40 --hx8k --package tq144:4k --pcf timer.pcf --json chip.json --asc chip.asc
	icepack chip.asc chip.bin

.PHONY: upload
upload:
	(stty raw -echo;cat) < /dev/ttyACM0 &
	cp chip.bin /dev/ttyACM0

.PHONY: clean
clean:
	$(RM) -f chip.blif chip.txt chip.ex chip.bin
