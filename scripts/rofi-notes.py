#!/usr/bin/python3
from courses import courses
from rofi import rofi
import subprocess

courses = courses()
courses = sorted(courses, key=lambda l: l.info['title'])

course_list = [f'{course.info["title"]}' for course in courses]

code, index, selected = rofi('Courses', course_list, [
    '-no-custom',
    '-markup-rows',
    '-lines', 8
])

if index >= 0:
    notes = courses[index].dir / 'master.pdf'
    subprocess.run(['zathura', notes])
