# dts()
This is a simple function that adds a date/time stamp to a script or file

## Use
Use this and customize it with your changes. I use this as a date/time stamp to a file since my old man brain cannot remember the date/time formats.

## OS
Used / created for macOS bash but can be modified for other OS.

## Help menu
When you execute dts -? you will get the following:
![Help menu](https://github.com/al-jimenez/dts/blob/master/dts.png)

## Usage Examples

    dts -?  -  to get the help menu

    dts <date string> - i.e.: dts "%I:%M %p, %D" returns >> 10:15 AM, 07/17/20

    Script usage: <variable name>=$(echo "$(dts fs)")

    Script usage: echo "$(dts dd/mm/yy)"
