from typing import Dict, Any
from columnar import columnar
from termcolor import colored
import logging as log
import sys

def CLI(description, usage, name = sys.argv[0]):
    # Entry point for the CLI.
    return _CLI(name, description, usage)

class ParsedArguments:
    # Simple object for storing the parsed arguments from the CLI.
    def __init__(self, subcommand, subcommand_args, arguments):
        self.subcommand = subcommand
        argument_index = 0
        for args in subcommand_args:
            setattr(self, args, arguments[argument_index])
            argument_index += 1

    def __contains__(self, key):
        return key in self.__dict__

class _CLI:
    def __init__(self, name, description, usage):
        self.name = name
        self.description = description
        self.usage = usage
        self.subcommands = {}

    def parse_args(self):
        args = sys.argv[1:]
        if len(args) < 1 or args[0] == '-h' or args[0] == '--help':
            self.print_help()

        for subcommand in self.subcommands.values():
            if subcommand.name == args[0]:
                return ParsedArguments(subcommand.name, subcommand.arguments, sys.argv[2:])

        self.print_help()

    def command(self, command):
        # Add a new subcommand to the CLI. Here, command is an instance
        # of the Command class.
        self.subcommands[command.name] = command

    def print_help(self):
        log.bold(f'\n{self.description}')
        log.color_print('\nUsage:', log.Color.Bold, f'{self.name} {self.usage}')

        rows = []
        for subcommand in self.subcommands.values():
            rows.append([colored(subcommand.usage, attrs=['bold']), subcommand.description])

        print(columnar(rows, headers=None , no_borders=True))
        log.color_print('Tip: Use', log.Color.Bold, 'cse-notes <script> (-h | --help)',
            log.Color.Regular, 'to get specific help for a script.\n')
        exit(1)

class Command:
    requires_args = False

    def __init__(self, name, arguments, usage, description, long_description):
        self.name = name
        self.arguments = arguments
        self.usage = usage
        self.description = description
        self.long_description = long_description

    def execute(self, actions: Dict[str, Any]):
        errors = 0
        for method, args in actions.items():
            call = getattr(self, method)
            try:
                if args is None:
                    call()
                else:
                    call(args)
            except Exception as e:
                log.err(e)
                errors += 1

        if errors > 0:
            raise Exception(f'\n{errors} error(s) found')

    def print_help(self):
        log.bold(f'\n{self.name}')
        print(f'\n  {self.long_description}')

        log.color_print('\nUsage:', log.Color.Bold, f'cse-notes {self.usage}\n')
        exit(1)
