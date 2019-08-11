from serial import Serial
import time
from subprocess import run, PIPE, call

tool_dir = __file__.replace("monitor.py", "")
PORT = run(["sh", tool_dir + "get_port.sh"], stdout=PIPE).stdout.decode("utf-8").replace("\n", "")

if PORT == "":
    print("Arduino not connected")
    exit()
ser: Serial = Serial(PORT, 9600)

while 1:
    try:
        line = ser.readline()
        print(line)
    except KeyboardInterrupt:
        break

ser.close()
