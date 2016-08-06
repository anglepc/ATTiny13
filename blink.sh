#!/bin/bash
./gavrasm/gavrasm blink.asm
sudo ~/arduino-1.6.6/hardware/tools/avr/bin/avrdude -p attiny13 -C ~/arduino-1.6.6/hardware/tools/avr/etc/avrdude.conf -c usbtiny -U flash:w:blink.hex:i
