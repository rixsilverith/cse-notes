<h1 align="center">Lecture notes on Computer Science</h1>
<p align="center"><img src="https://img.shields.io/github/license/rixsilverith/uni-notes?style=flat-square"/></p>

> In this repo you'll find a collection of all my lecture notes on computer science and math. Each course I have taken has its corresponding source files in its own folder inside the **notes** directory. You can download this lecture notes in PDF [here]().

## Compiling the notes
In order to compile the corresponding LaTeX files for each course you can make use of the `compile.sh` script available in the **scripts** folder. By default, it'll compile the lecture notes from all courses. However, you can specify to compile the lecture notes from a specific course by passing the short for that course as an argument, as well as the output directory (default: **lecture-notes/out**). Example:
```bash
./compile.sh -c=CALC2 -o=~/Uni/lecture-notes/notes/
```
A list of all courses and their shorts is available by running the `list_courses.py` script.
> Note: You should have at least Python 3.6 installed in your system in order to run `.py` scripts.

It's also recommended to use `latexmk` to continuously compile the lecture notes while editing them.
```bash
latexmk -shell-escape -synctex=1 -pdf -silent -interaction=nonstopmode -pvc <file.tex>
```
About the arguments: `-shell-escape` let us create LaTeX subprocesses to compile auxiliary files; `-synctex=1` generates a `synctex.gz` file that let certain PDF viewers (Skim in macOS, Okular in Linux and Sumatra in Windows) to relate a position in the PDF with its corresponding part in the `.tex` file; `-silent` reduces the output of the compiler; `-interaction=nonstopmode` prevents the compiler from stopping when it spots an error; finally, `-pvc` enables continuous compilation when saving the `.tex` file.
> If you're running Linux, specially Arch Linux with bspwm, you might find helpful my [university setup](https://github.com/rixsilverith/university-setup), which is just a set of scripts and third-party programs intented to improve the workflow of taking lecture notes using LaTeX.

## License
This lecture notes are licensed under [Creative Commons - No Commercial - Share Alike](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode). They can be freely used and distributed as long as the original author is credited, they aren't used for commercial purposes and derived work is shared under this same license.
