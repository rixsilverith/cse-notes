from sys import stdout, stderr
from enum import Enum

class Color(Enum):
    Red     = '\033[0;31m'
    Green   = '\033[0;32m'
    Yellow  = '\033[0;33m'
    Blue    = '\033[0;34m'
    Purple  = '\033[0;35m'
    Cyan    = '\033[0;36m'

    Regular = '\033[0m'
    Bold    = '\033[1m'
    Italic  = '\033[3m'

    def __str__(self):
        return self.value

def color_print(
    *messages,
    default_color = Color.Regular,
    sep = ' ',
    end = '\n',
    file = stdout,
    flush = False
):
    # Wrapper around print with color options. It works only on ttys
    # Taken from https://github.com/antoniosarosi/pycritty/blob/ecf0cec7dd97119d812b40d8799b46928407c8f3/pycritty/io/log.py
    # Usage: color_print(Color.Bold, 'Hey!', Color.Green, 'Say something')
    string = []
    print_colors = file.isatty()
    if print_colors:
        string.append(str(default_color))

    messages_iter = iter(messages)

    # Print first message and deal with 'sep' later
    first = next(messages_iter)
    is_color = isinstance(first, Color)
    if is_color and print_colors or not is_color:
        string.append(str(first))

    # Print sep only when message is a string
    for msg in messages_iter:
        is_color = isinstance(msg, Color)
        if is_color and print_colors:
            string.append(str(msg))
        elif not is_color:
            string.append(f'{sep}{msg}')

    # Reset styles
    if print_colors:
        string.append(str(Color.Regular))

    print(''.join(string), end=end, flush=flush, file=file)

def ok(*messages):
    color_print(*messages, default_color=Color.Green)

def warn(*messages):
    color_print(*messages, default_color=Color.Yellow, file=stderr)

def err(*messages):
    color_print(*messages, default_color=Color.Red, file=stderr)

def bold(*messages):
    color_print(*messages, default_color=Color.Bold)
