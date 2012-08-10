# Description 

Adds support for the following languages to the LaTeX
[listings](http://www.ctan.org/tex-archive/macros/latex/contrib/listings/)
package which pretty-prints source code.

- [BUGS](http://www.openbugs.info/w/)
- [JAGS](http://mcmc-jags.sourceforge.net/)
- [Stan](http://code.google.com/p/stan/) 

# Usage

Place lstBUGS.sty in the same directory as your .tex file or somewhere
LaTeX will find it. See these
[instructions](http://en.wikibooks.org/wiki/LaTeX/Packages/Installing_Extra_Packages).

Add the following line to the header of your .tex file

```
\usepackage{lstBUGS}
```

Set the language keyword to `BUGS`, `JAGS` or `Stan` in the
`lstlistings` environment.  For example,

```
\begin{lstlisting}[language=BUGS]
model {
	...
}
\end{lstlisting}
```

See the `listings` documentation for more on how to use the `listings` package.

