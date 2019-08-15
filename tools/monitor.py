from serial import Serial
from subprocess import run, PIPE
from sys import argv

tool_dir = __file__.replace("monitor.py", "")
PORT = run(["sh", tool_dir + "get_port.sh"], stdout=PIPE).stdout.decode("utf-8").replace("\n", "")

if PORT == "":
    print("Arduino not connected")
    exit()

serial_port = 9600
if len(argv) == 2:
    serial_port = int(argv[1])

ser: Serial = Serial(PORT, serial_port)

while 1:
    try:
        line = ser.readline()
        print(line)
    except KeyboardInterrupt:
        break

ser.close()
