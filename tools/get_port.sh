echo $(arduino-cli board list | grep mega | cut --delimiter=" " --fields 1)
