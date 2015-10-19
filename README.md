# CSC Thesis Template
A LaTeX template for CSC Master's theses which conforms to the guidelines given by the graduate education department.

# How to Use
Most files have examples on how they should be used inside of them. I've compiled this handy checklist below which outlines what you need to do to start writing (besides overcoming the overwhelming mountain of things you'd rather be doing).

- [ ] Update the ```frontmatter.tex``` file. This is where all the basics are defined, your thesis title, your name, your committee members, etc.
- [ ] Start writing chapters! Every chapter goes inside of the ```chapters``` folder and should be imported in the ```chapter-outline.tex``` file using the ```\include{chapters/your-chapter}``` syntax. This makes reordering chapters a breeze! (Trust me, you'll do it)
- [ ] Drop all of your fancy graphs into the ```figures``` folder for safe keeping
- [ ] Got some appendices? You're covered, same idea as with chapters, but using ```appendix-outline.tex``` and the ```appendices``` folder instead.
- [ ] Write your abstract in ```abstract.tex```. That's it. The template takes care of all the formatting for you.
- [ ] Don't forget to thank your parents! Fill in ```acknowledgements.tex```.
- [ ] Be sure to cite your sources in ```bibliography.bib```. If you use Google Scholar to find your sources, it will provide you with ```bibtex``` output under the "cite" option.

# ShareLaTeX
Want to take your thesis writing ***to the cloud?!?!*** Or, you know, don't want to install the ~3GB girthy monstrosity that is LaTeX on your pristine machine? Use [ShareLaTeX](https://www.sharelatex.com/).

> I used ShareLaTeX to write my thesis and only experienced two days of downtime! I also didn't kill myself!

> *-- Andrew Guenther, Cal Poly CSC Graduate*

# Questions?
If you have a general question about LaTeX, I would recommend you do a Google search first and check out [the TeX Stack Exchange](http://tex.stackexchange.com/). If you have a question specifically about this template and its use, feel free to submit an issue using the "question" tag.
