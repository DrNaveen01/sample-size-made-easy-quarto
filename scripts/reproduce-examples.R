# Sample Size Made Easy: selected reproducible baseline calculations.
# Run from the book project directory with: Rscript scripts/reproduce-examples.R
# Illustrative approximations; verify assumptions before protocol use.

z <- qnorm(.975)
p <- .5
d <- .05
n0_prop <- z^2 * p * (1-p) / d^2
cat(sprintf("Single proportion: n0=%.5f, complete=%d\n",n0_prop,ceiling(n0_prop)))

N <- 1000
n_fpc <- n0_prop / (1 + (n0_prop - 1)/N)
cat(sprintf("Finite-population approximation: %.5f, rounded=%d\n",n_fpc,ceiling(n_fpc)))

n0_mean <- z^2 * 10^2 / 2^2
cat(sprintf("Single mean: %.5f, rounded=%d\n",n0_mean,ceiling(n0_mean)))

n_yamane <- N / (1 + N*.05^2)
cat(sprintf("Yamane: %.5f, rounded=%d\n",n_yamane,ceiling(n_yamane)))

pooled_sd <- sqrt(((50-1)*15^2+(100-1)*20^2)/(50+100-2))
cat(sprintf("Pooled SD: %.6f\n",pooled_sd))

icc <- .02; m <- 20
de <- 1+(m-1)*icc
cat(sprintf("Equal-size cluster DEFF: %.4f\n",de))

p1 <- .2; RR <- 1.5; OR <- 1.5
cat(sprintf("p2 from RR=%.5f, p2 from OR=%.5f\n", p1*RR, OR*p1/(1-p1+OR*p1)))

Se <- .85
n_disease <- ceiling(z^2*Se*(1-Se)/.05^2)
cat(sprintf("Disease-positive target (Wald): %d\n",n_disease))

# Important distinction: two documented recruitment rounding conventions.
cat(sprintf("Recruitment from rounded 385 at L=.10: %d\n",ceiling(385/.9)))
cat(sprintf("Recruitment from unrounded %.5f at L=.10: %d\n",n0_prop,ceiling(n0_prop/.9)))
