%
% vim: ft=latex
%
% Central document class for all our Retronlab Documents.
%
% Sounds way more grand than it is - really this file is just all of the shared bits of the preamble between the docs. Upside: less duplication = everything is more likely to be in sync.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{retronlabo-manual}

% the only parameter we accept, is a language code. This plumbs any such argument into a macro of our making.
% before we try the catch-all, do explicitly check for German and English since that's two languages we have docs in.
\DeclareOption{english}{\newcommand{\OutputLanguage}{english}}
\DeclareOption{german}{\newcommand{\OutputLanguage}{german}}
\DeclareOption*{\newcommand{\OutputLanguage}{\CurrentOption}}
\ProcessOptions\relax

% base the output doc on the article class.
\LoadClass[a4paper]{article}

% --- load packages ----

% we selected A4 paper above; this selects smaller margins because LaTeX default is... a lot.
\RequirePackage[a4paper,margin=2cm,right=4cm]{geometry}

% pick encodings and load a font package.
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

% now that we have fonts, do add some language localisation to make use of them.
\usepackage[\OutputLanguage]{babel}
\usepackage[\OutputLanguage,textwidth=3cm]{todonotes}

% useful crud!
\RequirePackage{dirtytalk}
\RequirePackage{array}
\RequirePackage{ulem}
\RequirePackage{csquotes}

% extend figures and tables with a caption at the top and the ability to add additional text at the bottom.
\RequirePackage[capposition=top]{floatrow}

% Extra goodies for PDF output.
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{pdfcomment}

% Allow table cells to extend over several rows.
\RequirePackage{multirow}

% We might be ab-using those glossaries - but that is still a kind of use.
\RequirePackage[nomain,toc,section=section]{glossaries}

% Figures, labels for them and stuff to put in the centre.
\RequirePackage{graphicx}
\RequirePackage{caption}

% Yes, I would like my source code listings legible, thank you!
\RequirePackage{listings}

% Citations! We simply MUST have those!
\RequirePackage[citestyle=verbose]{biblatex}

% COLOPHONS - completely useless or totally necessary? Discuss!
\RequirePackage[titlesize=2em,parsize=1em,titlealign=r,nofullpage,clrpg]{colophon}

% Allow language-dependent blocks to be defined.
\RequirePackage{iflang}

% --- set up packages below here -----

% I'm sorry, I just can't with fonts that have serifs. It just looks WRONG.
\renewcommand{\familydefault}{\sfdefault}

% This seems to help with the todos going bonkers on their boxes.
\setlength{\marginparwidth}{3cm}

% Perform any setup the ToDo package may need - this might care about the previous command?
\setuptodonotes{}

% The glossary definitions are deliberately in their own file - and they translate themselves.
\include{fragments/file-types}

\makeglossaries

% We store all of our images in a dedicated folder, so no need to specify that every time.
\graphicspath{ {./images/} }

% Default code listing parameters.
\lstset{
  language=C++, % not... actually sure what to put for a CUE file, honestly.
  numbers=left,
  numberstyle=\tiny,
  basicstyle=\footnotesize
}

% Declare where our reference material for citations is defined.
\addbibresource{references.bib}

% I notice that the front and back of a doc should really be the same.
\newcommand{\FrontMatter}{
\tableofcontents
\listoffigures
\listoftables

% include the one and only Colophon! Gotta have one, but nobody reads 'em. It's tradition!
\include{fragments/colophon}

% neat hack to always page break between sections - thanks DuckDuckGo and David Carlisle for allowing me to find this. :)
\let\oldsection\section
\renewcommand\section{\clearpage\oldsection}
% additional note: we do this here instead of in the preamble, because we don't actually need to spread out all the different types of lists over a gazillion pages. We just want this for actual sections after the frontmatter. So since this macro is placed right there, we love it!
}

\newcommand{\BackMatter}{
\listoftodos
\printbibliography
}

\endinput
