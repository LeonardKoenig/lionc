# OCR generated TeX for John Lions' Commentary on UNIX

> This directory contains a copy of John Lion's
> “A commentary on the Sixth Edition UNIX Operating System”.
> This form of the document is the one that Warren Toomey published on the
> [USENET](http://en.wikipedia.org/wiki/USENET)
> `alt.folklore.computers` newsgroup in May 1994.
> It's available in several forms:
> * A [gzipped tarball](http://www.lemis.com/grog/Documentation/Lions/original.tar.gz)
>   of the files after I had unpacked them and formatted them to PostScript in
>   June 1994.
>   This tarball includes separate PostScript files for the odd and even pages,
>   for printing out in a double-sided format.
>   It also contains a PDF file generated in April 2004.
>   It is 1.75 MB in size.
> * The book in [gzipped PostScript](http://www.lemis.com/grog/Documentation/Lions/book.ps.gz),
>   for printing out directly. It's 300 kB in size.
> * The book in [PDF](http://www.lemis.com/grog/Documentation/Lions/book.pdf),
>   for printing out or displaying directly. It's 625 kB in size.
> * The [source form](http://www.lemis.com/grog/Documentation/Lions/book.tar.gz)
>   of the book,
>   with a *Makefile* and targets to build PostScript and PDF versions.
>   This is by far the smallest, only 170 kB.
> * The [complete source tree](http://www.lemis.com/grog/Documentation/Lions/book/)
>   is available for perusal.
> * The scans include a number of scan errors.
>   Brian Foley was kind enough to supply [errata](http://www.lemis.com/grog/Documentation/Lions/errata.php)
>   that still need to be incorporated into the document.
>
> The source code is not included, but you can get that from
> [cuzco.com](http://v6.cuzuco.com/),
> also courtesy of Warren Toomey.

From http://www.lemis.com/grog/Documentation/Lions/index.php, initially posted
by Warren Toomey on USENET alt.folklore.computers in May 1994.
It's LaTeX source code created based on a scan.

## Original Readme

See title.tex for details of this document.

To print, run the document through LaTeX twice:

    % latex lionc.tex
    % latex lionc.tex

Then use the appropriate dvi converter, e.g.,

    % dvips lionc.dvi


Please post typographical/other changes to this document
to alt.folklore.computers as context diffs (i.e., `diff -c`)
with the Subject line of "Leo's Patches blah blah".
