QuarterlyRevenue <- c(rep(0, times = 6), 400000, 400000*1.25, rep(c(400000, 400000, 400000, 400000*1.25), times = 8))
QuarterlyOpCost <- rep(125000, times = 40)
QuarterlyNet <- QuarterlyRevenue - QuarterlyOpCost

interest <- seq(from = 0.08, to = 0.14, by = 0.005) #creating a sequence of effective annual interest rates from 8% to 12% with increments of 0.05%. This will be our x plot

NetPV <- function(interest, initial, cashflow){
  -initial + sum(cashflow*((1 +interest)^{-(1:40)/4}))
}

NPVsequence <- sapply(interest,
                      NetPV,
                      initial = 5000000,
                      cashflow = QuarterlyNet) #creating a sequence of Net Present Values dependent on the varying interest rates. This will by our y plot
NPVsequence

plot(
  x = interest,
  y = NPVsequence,
  xlab = "Effective Interest Rate",
  ylab = "Net Present Value",
  col = "dark red",
  type = "l",
  lty = 1
) 
abline(h = 0, col = "black") #This creates the horizontal line for the x intercept
#This plots a line graph where the intercept with the x axis signifies when the NPV  becomes negative with increasing interest rates