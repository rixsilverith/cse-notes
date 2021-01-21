from columnar import columnar
from termcolor import colored
import logging as log
import sys

def CLI(description, usage, name = sys.argv[0]):
    """Entry point for the CLI."""
    return _CLI(name, description, usage)

class ParsedArguments:
    """Simple object for storing the parsed arguments from the CLI."""
    def __init__(self, subcommand, arguments):
        self.script = subcommand
        self.arguments = arguments

class _CLI:
    def __init__(self, name, description, usage):
        self.name = name
        self.description = description
        self.usage = usage
        self.scripts = {}

    def parse_args(self):
        """Parse the supplied arguments to the CLI.

        The argument parser will automatically print the help message when either
        the -h or --help options are passed, or the supplied command doesn't
        match any of the registered scripts.
        """
        args = sys.argv[1:]
        if len(args) < 1 or args[0] == '-h' or args[0] == '--help':
            self.print_help()

        for script in self.scripts.values():
            if script.name == args[0]:
                return ParsedArguments(script.name, args[1:])

        self.print_help()

    def add_script(self, script):
        """Add a new script to the CLI."""
        self.scripts[script.name] = script

    def print_help(self):
        log.bold(f'\n{self.description}')
        log.color_print('\nUsage:', log.Color.Bold, f'{self.name} {self.usage}')

        rows = []
        for subcommand in self.scripts.values():
            rows.append([colored(subcommand.usage, attrs=['bold']), subcommand.description])

        print(columnar(rows, headers=None , no_borders=True))
        log.color_print('Tip: Use', log.Color.Bold, 'cse-notes <script> (-h | --help)',
            log.Color.Regular, 'to get specific help for a script.\n')
        exit(1)

class Script:
    """Abstract object representing a script of the CLI."""
    requires_args = False

    def run(self, arguments):
        """Runs the script with the provided arguments.

        run() will execute the `action` method of the corresponding script.
        """
        self.parse_arguments(arguments)
        action = getattr(self, 'action')
        try:
            action(arguments)
        except Exception as e:
            log.err(e)
            exit(1)

    def parse_arguments(self, args):
        """Parse script arguments.

        The corresponding help message for the script will be printed when
        either -h or --help are found, or the supplied arguments are not
        correct.
        """
        for arg in args:
            if arg == '-h' or arg == '--help':
                self.print_help()

    def print_help(self):
        """Prints a help message including information and examples about
        how to use the script.
        """
        log.bold(f'\n{self.name}')
        print(f'{self.__doc__}')

        log.color_print('Usage:', log.Color.Bold, f'cse-notes {self.usage}\n')
        exit(1)
