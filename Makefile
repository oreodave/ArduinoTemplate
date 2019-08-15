PROJECT=ArduinoTemplate
CC=arduino-cli
PDIR=$(shell pwd)

PORT=$(shell sh $(PDIR)/tools/get_port.sh) # gets port that mega processor is running on
FQBN=arduino:avr:mega

BFOLDER=$(PDIR)/dist
FLAGS=-v -b $(FQBN)
BFLAGS=$(FLAGS) --warnings all --build-path $(BFOLDER)
UFLAGS=$(FLAGS) -p $(PORT) -i $(BFOLDER)/$(PROJECT).arduino.avr.mega.hex

default:
	@$(MAKE) compile

compile:
	@cd $(PDIR)
	@$(CC) compile $(BFLAGS)
	@mv $(PDIR)/$(PROJECT).arduino.avr.* $(BFOLDER)

upload:
	@$(MAKE) compile
	@cd $(PDIR)
	@$(CC) upload $(UFLAGS)
