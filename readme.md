# Build hello world program for Zyxel WSR30 MultyU AC2100

To run the hello world program, you have to open the device and connect a
serial adapter; i.e. you need to solder to jumper J18.

## Install packages
Run the following script to install packages required for building and testing
on ubnutu or debian:
```./install-packages.sh```

## Build
Run the following command to build a hello world application:
```make```

## Serial Interface
The serial interface of the device is defined as follows:

|Pin  |Description|
|-----|-----------|
|Pin 1|3.3V       |
|Pin 2|UART TX    |
|Pin 3|UART RX    |
|Pin 4|0V ???     |
|Pin 5|GND        |

Table: Jumper J18

A serial to USB converter with 3.3V can be used.

## Run
Connect Zyxel WSR30 MultyU AC2100 via serial line.
Connect power line to a power socket 1 which is controlled by sispmctl.
Otherwise you have to manually switch on when asked.
Run the following script:
```./run.sh /dev/ttyUSB0 1```
First parameter is serial device.
Second parameter is power socket number.
Press CTRL + C to terminate and power off.
