# Optional reproducible figure generation with base R; run from book root.
dir.create("assets", showWarnings=FALSE)
precision <- seq(.025,.10,by=.0025)
n <- ceiling(qnorm(.975)^2*.25 / precision^2)
png("assets/precision-sensitivity.png", width=1350,height=800,res=160)
par(mar=c(5,5,3,2),family="serif")
plot(precision*100,n,type="l",lwd=2,col="#683434",
     xlab="Absolute precision (percentage points)",ylab="Complete observations",
     main="Single-proportion precision sensitivity")
abline(v=5,lty=3,col="gray50")
points(5,385,pch=19,col="#683434")
text(5,385," 385",adj=c(0,1),cex=.85)
grid(col="gray90")
dev.off()
