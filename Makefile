PORT=$(shell arduino-cli board list | grep mega | cut --delimiter=" " --fields 1) # gets port that mega processor is running on
FQBN="arduino:avr:mega"
CC="arduino-cli"

default:
	$(CC) compile --fqbn $(FQBN)

upload:
	$(CC) upload -p $(PORT) --fqbn $(FQBN)
