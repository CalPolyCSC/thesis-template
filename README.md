# Cal Poly Thesis Template
A LaTeX template for Cal Poly Master's theses which conforms to the guidelines given by the Graduate Education department.
This file was last reviewed by Graduate Education in September 2024.

This version is a major departure from previous versions of the LaTeX template.
Following the LaTeX concept of separating the format from the content, this new template is intended to make the process of writing a correctly formatted thesis easier by allowing you to focus on the content.
There are plenty of examples on how to create typical thesis content (equations, figures, tables, nomenclature, etc.) along with pointers on what other packages/resources you can look into to do more complicated things.

A word of caution about making changes to the formatting associated with this template.
There are opportunities to customize the format or look of certain aspects of your thesis, but you need to be careful that the formatting changes you make are consistent with the formatting guidelines from the Graduate Education department.

# How to Use
Overall, the project is split into three types of files: those that are intended to be modified, those that probably do not need to be modified, and those that are informational.
Making changes to the first type of files should have no impact on the overall format of your thesis, while modifying the second type of files could have an impact on the thesis format.
The informational files are there to provide additional information and do not have any impact on the resulting thesis.

## Files to be Modified
Within this project, there are a number of directories that contain files or are intended to contain files that you will modify for your thesis. These include:

- ```frontmatter``` - files associated with the part of your thesis preceding chapter 1,
- ```chapters``` - TeX files associated with the chapters of your thesis,
- ```appendices``` - TeX file associated with the appendices (if any) of your thesis,
- ```figures``` - files associated with the figures in your thesis, and
- ```bibliography``` - files associated with the bibliography or references section of your thesis.

### Front Matter Content
There several required pages and a number of other optional pages that need to be included in your thesis.
The files in the ```frontmatter``` directory are intended to simplify the creation of these pages.

The ```preamble.tex``` file should be used to put all of the LaTeX configuration (included packages, package settings that need to occur before the document is started, etc.).
The current file includes the ```lipsum``` package for the placeholder text used in the example thesis.
This package should be removed in your thesis.
This file also contains an example of the package and libraries that might be needed for using [TikZ](https://tikz.dev/).
Finally, this file also contains an example of how to perform grouping in your nomenclature (List of Symbols) using the ```nomencl``` package.
Your thesis advisor might have a preferred way of organizing your nomenclature, so this code will need to be changed to suit your needs.

The ```abstract.tex``` file should contain the text associated with your abstract.

The ```acknowledgments.tex``` file is for any acknowledgments that you would like to include in your thesis.
One example is if your thesis was funded by a research contract.
In that case this is where that acknowledgment would go along with any disclaimers that your funding agency might require.
Work with your advisor on whether this applies to your work.
Note that if you only have one acknowledgment then this page must be titled is the singular.
In that case uncomment the line redefining the ```\acknowledgename``` macro on line 2.
If you have no acknowledgments, then this file can be blank.

The ```dedication.tex``` file should contain a dedication.
If you do not have a dedication, then this file can be blank.

The ```nomenclature.tex``` file provides a convenient location for all of your symbols and terms to be declared with the ```\nomenclature``` command.
These will appear in the List of Symbols section of your thesis.
If you have a preferred way of assembling your nomenclature, then you do not have to have your nomenclature in this file.
The nomenclature command in ```listings.tex``` is what puts the list of symbols into the thesis in the correct place.
If you are not going to have a List of Symbols in your thesis, then the ```nomenclature.tex``` file can be blank.

If you plan on creating a List of Symbols, then you should look at the documentation of the ```nomencl``` package as well as examples that are on the internet.
As quick summary, the ```\nomenclature[arg1]{arg2}{arg3}``` command will create a new entry for ```arg2``` in the List of Symbols with the description of ```arg3```.
The optional ```arg1``` is used in the sorting and grouping of entries, where code in ```preamble.tex``` defines the grouping in this example.

The ```listings.tex``` file contains the commands needed to get the approved lists that might need to be in your thesis.
If any of these lists are empty in your thesis, then you need to remove the associated commands from this file.
Otherwise, there should be no need to modify this file.

The ```information.tex``` file contains other information about your thesis and your thesis committee that is needed to create content in the front matter.
The lines in this file define specific information about your thesis that you will need to provide.
The one items that is optional is the ```\keywords```.
If you do not want to have keywords placed at the end of your abstract, then remove that line from the file.

### Chapters Content
The most important file in the ```chapters``` directory is ```outline.tex```.
This file is intended to be used to include all of the individual chapters of your thesis.
For the example thesis, there are three generic chapters: ```chapter01.tex```, ```chapter02.tex```, and ```chapter03.tex```.
for your thesis, each chapter should be placed in a separate file in this directory, and then that filename (without the ```tex``` extension) can be included just as the example does.
Each chapter file can be named whatever you like, but you should avoid spaces in the file name, and you need to use the ```tex``` extension.
Note that the ```\input``` command needs to be given the filename (without the extension) relative to the root file of the document.
That is why each input starts with ```chapters/``` directory.

### Appendices Content
Just like the ```chapters``` directory, the most important file in the ```appendices``` directory is ```outline.tex```.
This file contains everything needed to properly handle appendices in your thesis.
If your thesis will have no appendices, then the ```outline.tex``` file should be blank.
There are some formatting changes that have to happen in your thesis associated with appendices, so the ```\appendix``` command is used to make those changes.
Because some of these formatting changes depend on the number of appendices, this command takes an optional argument indicating the number of appendices, for example with 3 appendices you could use ```\appendix[3]``` or ```\appendix```.
If you only have one appendix, then you **must** use the optional optional like this: ```\appendix[1]```.
The rest of this directory follows the same logic as the ```chapters``` directory discussed above.

### Figures Content
Most theses contain a large number of figures, so it is convenient to collect all of those figures into a common directory.
That is the intent of the ```figures``` directory.

### Bibliography/References Content
All works that you want to include in your thesis should be in the the ```references.bib``` file located in the ```bibliography``` directory.
The thesis template uses [biblatex](https://biblatex-biber.sourceforge.net/), with the biber backend, to handle the citation and bibliography/reference creation.
Example entries for a variety of works are provided in the example, but there might be other entry types that you will need to use.
Many publishers provide the ability to export a citation in bibtex or biblatex format.
[Cal Poly's library website](https://lib.calpoly.edu) also provides the capability of exporting citations in a compatible format.
You can also use reference management tools like [Zotero](https://www.zotero.org) and [Mandeley](https://www.mendeley.com) that can export citations.
No matter where the citation source was generated, it will probably take some fine tuning of the bib-file contents to make the cited work correctly formatted in your thesis.

You need to decide if your cited works will be in a References section (a collection of works cited in your thesis) or a Bibliography (a collection of works cited as well as any other resources you found of value related to your thesis).
The file ```bib_info.tex``` allows you to switch between the two.
If you plan on providing a Bibliography, then you should keep the ```\nocite{*}``` command and put all works that you want to be included in your bibliography into the ```references.bib```.
If you plan on providing a References section, then you should remove the ```\nocite{*}``` command and uncomment the line redefining the ```\bibname``` macro.
In this case, biblatex will only use the cited entries from the ```references.bib``` file, and you can keep unused entries in this file without them appearing in your References section.

## Think Twice About Modifying These Files
The root file for this project is ```main.tex```.
This template was setup with the goal of you not needing to edit this file.
This file contains formatting and content related settings that (hopefully) makes it easier for you to start using the template.
It also contains additional packages, formatting, and package settings that have been set to make the resulting thesis format comply with the Graduate Education guidelines.
Not all changes to this file will result in problems, but care should be taken if you decide you need to edit this file.

The lower-level formatting of the thesis is in ```cpthesis.cls```.
This file is currently based on a number of revisions to a standard LaTeX template, with the earliest edits made in the early 1990's.
If there is a need to change this file, then you have most likely found a bug, and you should report it (see below).
Changing this file can cause unexpected results that might result in a thesis format that is no longer compliant with the style guidelines.

## Informational Files
One informational file is this ```README.md``` file that is located in the root directory of the project.
Another informational file in the root directory is the ```LICENSE``` file.
This file documents the licensing terms for the project and the files contained within this project.
The current license for this project is the [MIT License](https://opensource.org/license/MIT), which is a quite permissive software license that puts few restrictions on the use or reuse of this content.

The other informational files are located in the ```guidelines``` directory.
These files are copies of guidelines published on the [Graduate Education website](https://grad.calpoly.edu/masters-thesis/masters-thesis.html).
We try to keep these files up-to-date, but the canonical versions of these files reside on the Graduate Education website.


## TL;DR
Most files have examples on how they should be used inside of them. Here is a handy checklist which outlines what you need to do to start writing (besides overcoming the overwhelming mountain of things you'd rather be doing).

- [ ] Update the ```information.tex``` file. This is where all the basics are defined, your thesis title, your name, your committee members, etc.
- [ ] Start writing chapters! Every chapter goes inside of the ```chapters``` folder and should be imported in the ```chapters/outline.tex``` file using the ```\include{chapters/your-chapter}``` syntax. This makes reordering chapters a breeze! (Trust me, you'll do it)
- [ ] Drop all of your fancy graphs into the ```figures``` folder for safe keeping
- [ ] Got some appendices? You're covered, same idea as with chapters, but using ```appendices/outline.tex``` and the ```appendices``` folder instead.
- [ ] Write your abstract in ```abstract.tex```. That's it. The template takes care of all the formatting for you.
- [ ] Don't forget to thank your family! Fill in ```acknowledgments.tex```.
- [ ] Make sure your family knows what you are talking about. Create a List of Symbols using the ```nomenclature.tex``` file. Or don't have one and let them figure it out on their own. In that case be sure to remove the nomenclature code in ```listings.tex```.
- [ ] Be sure to cite your sources in ```bibliography.bib```. If you use Google Scholar to find your sources, it will provide you with ```bibtex``` output under the "cite" option.
- [ ] Final cleanup; you're almost there. Remove unnecessary content, such as empty listings, dedication, etc., and any placeholder text.

# Overleaf
Want to take your thesis writing ***to the cloud?!?!*** Or, you know, don't want to install the ~3GB girthy monstrosity that is LaTeX on your pristine machine? Use [Overleaf](https://www.overleaf.com/). Even better, use [this template](https://www.overleaf.com/latex/templates/cal-poly-thesis-template/vvqzkxgchkvc) on Overleaf.

# Questions or Bugs?
If you have a general question about LaTeX, there are a lot of resources on the internet that can help.
Check out [the TeX Stack Exchange](http://tex.stackexchange.com/) as a great place for answers to many questions.
If you have a question specifically about this template and its use, feel free to submit an issue using the "question" tag.
If you think you've found a bug, please submit a issue on the thesis template [GitHub site](https://github.com/CalPolyCSC/thesis-template) for help getting it addressed.
