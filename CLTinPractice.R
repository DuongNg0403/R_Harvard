X_hat <- .48
se <- sqrt(X_hat*(1-X_hat)/25)
pnorm(.01/se)-pnorm(-.01/se)