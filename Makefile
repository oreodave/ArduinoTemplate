PORT=$(shell arduino-cli board list | grep mega | cut --delimiter=" " --fields 1) # gets port that mega processor is running on
FQBN="arduino:avr:mega"
CC="arduino-cli"

