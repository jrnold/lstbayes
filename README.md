# Listings language drivers for BUGS, JAGS, and Stan

Adds support for the following languages to the LaTeX
[listings](http://www.ctan.org/tex-archive/macros/latex/contrib/listings/)
package which pretty-prints source code.

- [BUGS](http://www.openbugs.info/w/)
- [JAGS](http://mcmc-jags.sourceforge.net/)
- [Stan](http://code.google.com/p/stan/) 

# Usage

Place lstBUGS.sty in the same directory as your .tex file or somewhere LaTeX will find it.
See these [instructions](http://en.wikibooks.org/wiki/LaTeX/Packages/Installing_Extra_Packages) for how to install extra packages.

Add the following line to the header of your .tex file

```latex
\usepackage{lstbayes}
```

Then use `BUGS`, `JAGS` or `Stan` as a language in one of the listings environments or commands. For example,
```latex
\begin{lstlisting}[language=Stan]
data {
  int<lower=0> J; // number of schools 
  real y[J]; // estimated treatment effects
  real<lower=0> sigma[J]; // s.e. of effect estimates 
}
parameters {
  real mu; 
  real<lower=0> tau;
  real eta[J];
}
transformed parameters {
  real theta[J];
  for (j in 1:J)
    theta[j] <- mu + tau * eta[j];
}
model {
  eta ~ normal(0, 1);
  y ~ normal(theta, sigma);
}
\end{lstlisting}
```

See the `listings` [documentation](https://www.ctan.org/tex-archive/macros/latex/contrib/listings/?la) for more on how to use the `listings` package.

