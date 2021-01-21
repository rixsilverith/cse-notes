<h1 align="center">Computer Science lecture notes</h1>
<p align="center">

<img src="https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg?style=for-the-badge&color=green" height=30px style="margin:5px;" />

</p>

<p align="center">
  <a href="courses">Lecture notes</a>&nbsp;&nbsp;•&nbsp;
  <a href="scripts">Scripts</a>&nbsp;&nbsp;•&nbsp;
  <a href="latex-stuff">LaTeX stuff</a>
</p>

> A collection of lecture notes for different courses taken at UAM during my Computer Science and Engineering Degree together with some scripts for managing them and improve the note-taking experience using LaTeX.

## Overview
The motivation for doing this project is to have a centralised and robust note-taking system for computer science and math courses. To achieve this, we're using LaTeX along with different technologies and scripts to make our lives easier at the time of taking notes.

> Note: The notes for some courses might be incomplete and work in progress.

## Getting started
```bash
bash <curl -s https://raw.githubusercontent.com/rixsilverith/cse-notes/master/bootstrap>
```
This script will guide you through the apassionating process of installing the necessary LaTeX custom packages and classes, as well as the `cse-notes` CLI.

<!--
> Disclaimer: This setup, including scripts and third-party software, is ment to work in Arch Linux with bspwm, and has not been tested on other environments. However, it should work anyways as long as all the dependencies are installed correctly.

A compiled version of these lecture notes can be found [here]().
-->

## Managing the notes with Python scripts
In order to efficiently perform repetitive tasks, some Python scripts are included in the **scripts** folder. Furthermore, the `cse-notes` shell script is also provided in the root folder, which is nothing more than a common entry point for the rest of the scripts. The syntax is as follows.
```bash
cse-notes <script> [<args>...]
```
A complete list of scripts is available by running `cse-notes -h` or just `cse-notes`.

<!--
A table summarizing what all the scripts do is also available [here](doc/scripts.md).

<!--
> Note: The **bin** folder should have automatically added to your PATH after getting this repo, so you can run the `lnm` tool globally. If that's not the case, then add the path to the folder manually.
-->

## Technical LaTeX stuff
To improve the note-taking experience with LaTeX, in the **latex-stuff** folder there are some custom packages and document classes that are ment to make writing notes easier and to keep them nice formatted.

These include the `exmath` package for math-related macros and environments, the `exrefs` package for improved cross-references along the document and the `csenotes` and `labreport` document classes, each of them defined in their corresponding `.cls` or `.sty` files. If you are not familiar with the development of custom LaTeX packages and document classes, the [Overleaf documentation](https://es.overleaf.com/learn/latex/Understanding_packages_and_class_files) is a great place to start reading.

The documentation for all of these custom packages and classes is available [here](docs).

#### Compiling the notes
The lecture notes for the different courses need the files in the **latex-stuff** folder for them to be properly compiled. The LaTeX compiler used by default is `latexmk`, which is actually not a compiler but a Perl script that makes a call to `pdflatex`. If wanted, another compiler, such as `xelatex`, may be used at your own risk by changing the `latex.compiler` key in the `config.yaml` file. The different arguments passed to the compiler can also be modified there with the `latex.compiler_arguments` key.

These lecture notes can be compiled by running
```bash
cse-notes compile [course] [<args>...]
```
where `course` is an optional argument corresponding to the name of the folder in which the `info.yaml` and `.tex` files of the course to be compiled are located. If no `course` argument is passed all the courses will be compiled by default. The resulting `.pdf` file for each course can be found inside its corresponding folder.

<!--
Moreover, a dark version of the notes can be compiled by adding the `--dark` flag to the compilation command or setting the `theme` key in `config.yaml` to `dark` to do it by default.
-->

Finally, when editing the notes, it's highly recommended to run
```bash
cse-notes watch <course> [<args>...]
```
to automatically recompile the notes when saving changes while editing the `.tex` files. This command runs the compilation command in the shadows every time a `.tex` file is changed in the
correspoding course directory.

## Course structure
In order to properly tweak the lecture notes or write your own ones using this setup you should first get familiar with how is a course structured. Each course has its own folder with a unique name in the **courses** folder, which is organized as follows.
```
courses
├── analysis-1
├── analysis-2
│   ├── info.yaml
│   ├── master.tex
│   ├── topic_01.tex
│   ├── topic_02.tex
│   ├── ...
│   ├── bibliography.bib
│   └── figures
│       ├── divergence-theorem.svg
│       ├── divergence-theorem.pdf_tex
│       ├── divergence-theorem.pdf
│       └── ...
├── computer-structure
├── electromagnetism
├── linear-algebra
├── ...
```

`info.yaml` contains information about the course. More concisely, the title, short and group for that course. This file is automatically generated when initializing a new course by running `cse-notes init` script. The following is an example of an `info.yaml` file.
```yaml
title: Analysis II
short: AN2
group: 219
```

`master.tex` bundles up all the topics of the course into a single `.tex` file, which is compiled afterwards. It is also automatically generated and new topic are also imported by their own. To create a new topic run `cse-notes new-topic <course>`.

`bibliography.bib` contains all the bibliography entries used in the notes using the BibTeX format. By default, bibliography is not included in the notes (see [lecturenotes class options](docs/lecturenotes.md) for more info).

<!--
## Commands
Command | Description
--- | ---
`compile [course]` | Compile the `.tex` files of the specified course to `.pdf`. If no course is <br> entered all will be compiled by default. The compiler, as well as the compilation <br> options can be changed by modifying the `compiler` key in the `config.yaml` file. <br><br> A dark version of the notes can be compiled by adding the `--dark` flag to this <br> command or setting the `theme` key in `config.yaml` to `dark` to do it by default, <br> and viceversa with the `--light` flag.
`fetch [repo-url]` | Fetch the latest commits from the specified repo (which should follow a similar <br> structure to this one) to your local clone. If the `repo-url` argument is not passed <br> the command  will use the repo in the `repo_url` key in the `config.yaml` file.
`help` | Show all available commands.
`info <course>` | Get information about a specific course.
`init` | Initialize a new course.
`list` | List all courses in the **courses** folder.
`push [course]` | Upload the compiled version in `.pdf` of the notes to Google Drive. The lecture <br> notes from a single course can be individually uploaded if specified.
`watch <course>` | Watch for changes in the `.tex` files of the specified course to automatically <br> recompile the notes.

<center>
<small>Tip: Write <b>-h</b> or <b>--help</b> after each command to get some help. </small>
</center>
-->

## Configuration and customisation
The behaviour of some scripts can be changed by editing the `config.yaml` file located in the root of the project. Keys to be edited in this file are:
- `pdf_viewer` This is the name of the executable of your PDF viewer of choice, the one that will open up when running commands such as `cse-notes view linear-algebra`. Zathura is the default and the recommended option for Linux users, as it will automatically refresh the PDF view when changes are made to the `.pdf` file. Okular is another great option for Linux, as well as Skim for MacOS X and Sumatra for Windows.

- `latex` This key contains configuration for compiling the notes.
    - `latex.compiler` Compiler used to compile the notes.

    - `latex.compiler_arguments` Options passed to the compiler.

<!--
## Further configuration
Software such as Rofi and Sxkhd can also improve the experience of taking notes and looking for them.

For instance, with Sxkhd I can bind `Alt+5` to run `lnm rofi-notes`, which will open up a Rofi dialog to select a course and open it with the PDF viewer specified in the `config.yaml` file.
-->

## Contributing
If you find any mistake, have some suggestion or you want to contribute to the project in any way don't hesitate to open a pull request.

## Acknowledgements
- Most of the ideas related to the custom LaTeX packages and document classes are taken from [apuntes-uam-infomat/apuntes]().

- Some scripts, specially the ones for Rofi, as well as the course structure, are based on the ones that [Gilles Castel]() uses to manage his lecture notes.

## License
This lecture notes are licensed under [Creative Commons Attribution - No Commercial - Share Alike 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode). They can be freely used and distributed as long as the original author is credited, they aren't used for commercial purposes and derived work is shared under this same license.

<center>

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

</center>

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
