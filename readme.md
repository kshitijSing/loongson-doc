# Purpose
=======

This project is an effort to create a complete set of community-based
documentations for the series of Loongson MIPS chips. See MIPS run, and see
Loongson run!

The priority of the project for now is to create a relative complete document
(two volumes) for the Loongson 3B1500 processor in Hindi first, then in
English.

# Download
========

Below is a list of documents prepared by the loongson-doc project.

  - [龙芯3B1500 用户手册（上）](https://db.tt/PKhgXelz)
  - [龙芯3B1500 用户手册（下）](https://db.tt/Y5DblTOK)

# Tools
=====

The pandoc markdown is picked as the main tool due to its simplicity and
flexibility, while LaTeX is still employed to handle hard cases: mostly complex
tables. In the end, pandoc would convert the whole document to the pdf format.

# Required packages
=================

Packages required to compile the loongson-doc project are (under Debian)

  * [pandoc](https://github.com/jgm/pandoc/releases/latest)
  * texlive-lang-cjk
  * texlive-fonts-recommended
  * texlive-science

The current document uses Adobe fonts for typesetting Chinese: these fonts can
be downloaded from the adobe acroread website. If you would prefer a complete
open-source solution (such as Wenquanyi fonts), please check out the template
file and comment/uncomment a few lines in the font setting section. Hopefully
they are straightforward.

