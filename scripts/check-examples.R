# Numeric regression checks for chapter example arithmetic only.
# Does not establish design-specific clinical validity of approximations.
z <- qnorm(.975)
n0 <- z^2*.25/.05^2
stopifnot(ceiling(n0)==385)
stopifnot(ceiling(n0/(1+(n0-1)/1000))==278)
stopifnot(ceiling(z^2*10^2/2^2)==97)
stopifnot(ceiling(1000/(1+1000*.05^2))==286)
stopifnot(abs(sqrt((49*15^2+99*20^2)/148)-18.494886)<.00001)
stopifnot(abs(1+19*.02-1.38)<1e-10)
stopifnot(abs(1.5*.2/(1-.2+1.5*.2)-.27272727)<1e-6)
stopifnot(ceiling(z^2*.85*.15/.05^2)==196)
stopifnot(ceiling(385/.9)==428, ceiling(n0/.9)==427)
cat("All baseline arithmetic checks passed.\n")
