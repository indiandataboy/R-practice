README
================

This assignment uses data from the UC Irvine Machine Learning
Repository, a popular repository for machine learning datasets. The data
set used is the “Individual household electric power consumption Data
Set”. Here’s a link to the dataset:
<https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip>

## Description:

Measurements of electric power consumption in one household with a
one-minute sampling rate over a period of almost 4 years. Different
electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken
from the UCI web site:

  - Date: Date in format dd/mm/yyyy
  - Time: time in format hh:mm:ss
  - Global\_active\_power: household global minute-averaged active power
    (in kilowatt)
  - Global\_reactive\_power: household global minute-averaged reactive
    power (in kilowatt)
  - Voltage: minute-averaged voltage (in volt)
  - Global\_intensity: household global minute-averaged current
    intensity (in ampere)
  - Sub\_metering\_1: energy sub-metering No. 1 (in watt-hour of active
    energy). It corresponds to the kitchen, containing mainly a
    dishwasher, an oven and a microwave (hot plates are not electric but
    gas powered).
  - Sub\_metering\_2: energy sub-metering No. 2 (in watt-hour of active
    energy). It corresponds to the laundry room, containing a
    washing-machine, a tumble-drier, a refrigerator and a light.
  - Sub\_metering\_3: energy sub-metering No. 3 (in watt-hour of active
    energy). It corresponds to an electric water-heater and an
    air-conditioner.

## Making Plots

R Scripts used to generate plots are called Plot1.R, Plot2.R, Plot3.R
and Plot4.R. The linked dataset was downloaded into working directory
before loading into R.

### Plot 1

A histogram of Global Active Time was plotted.

### Plot 2

A graph was plotted with Global Active Power against datetime.

### Plot 3

A graph was plotted with Sub\_metering\_1, Sub\_metering\_2 and
Sub\_metering\_3 against datetime.

### Plot 4

4 graphs were integrated for analysis.

  - The top left one was the same as plot 1.

  - The top right one was Voltage against datetime.

  - The bottom left one was the same as plot 3.

  - The bottom right one Global Reactive Power against datetime.
