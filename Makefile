PROJECT=ArduinoTemplate
CC=arduino-cli

PORT=$(shell arduino-cli board list | grep mega | cut --delimiter=" " --fields 1) # gets port that mega processor is running on
FQBN=arduino:avr:mega

BFOLDER=$(PWD)/dist
FLAGS=-v -b $(FQBN)
BFLAGS=$(FLAGS) --warnings all --build-path $(BFOLDER)
UFLAGS=$(FLAGS) -p $(PORT) -i $(BFOLDER)/$(PROJECT).arduino.avr.mega.hex

default:
	@$(CC) compile $(BFLAGS)
	@mv $(PWD)/$(PROJECT).arduino.avr.* $(BFOLDER)

upload:
	@$(CC) upload $(UFLAGS)
