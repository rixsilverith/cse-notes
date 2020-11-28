#!/usr/bin/python3
from util import load_yaml, get_config
from os import path, environ
from pathlib import Path

root = path.join(environ.get('LECTURE_NOTES_HOME'), 'courses')

course_list = []

def courses():
    courses = [i for i in Path(root).expanduser().iterdir() if i.is_dir()]
    for course in courses:
        info_file = Path(path.join(course, 'info.yaml')).expanduser()
        if info_file.is_file():
            course_list.append(Course(course))
    return course_list

class Course():
    def __init__(self, dir):
        self.dir  = dir
        self.id   = dir.stem
        self.info = load_yaml(dir / 'info.yaml')
