# Listings language drivers for BUGS, JAGS, and Stan

[![CTAN](https://img.shields.io/ctan/v/lstbayes.svg)](https://www.ctan.org/pkg/lstbayes)
[![CTAN license](https://img.shields.io/ctan/l/lstbayes.svg)](https://www.ctan.org/pkg/lstbayes)

Adds support for the following languages to the LaTeX
[listings](http://www.ctan.org/pkg/listings/)
package, which pretty-prints source code:

- [BUGS](http://www.openbugs.net)
- [JAGS](http://mcmc-jags.sourceforge.net/)
- [Stan](http://mc-stan.org/)

# Usage

To use, load the package
```latex
\usepackage{lstbayes}
```
Then use `BUGS`, `JAGS` or `Stan` as a language in one of the listings environments or commands. For example, to format the Stan [Eight schools](https://raw.githubusercontent.com/wiki/stan-dev/rstan/8schools.stan) model,
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

Also see the examples in `examples.tex` and `examples.pdf` files included in this repository.
See the `listings` [documentation](https://www.ctan.org/pkg/listings/) for more on how to use the `listings` package.

# Issues

Development occurs on github at <https://github.com/jrnold/lstbayes>. 


<!--  LocalWords:  lstbayes tex usepackage lstlisting pdf
 -->
