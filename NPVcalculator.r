#An investor is assessing the financial soundness of a business proposal. The investment horizon for this business plan is 10 years, at which point the operation will cease. For the sake of simplicity, assume that no capital is regained by selling off assets at the end of the investment period. This business plan incurs an initial set up cost and quarterly operational expenses. However, it is not expected to generate any revenue for the first 6 quarters, after which the base quarterly cash flow is as summarised as: 
###Initial set up cost = £5,000,000; Quarterly Operation cost = £125,000; Base quarterly income = £400,000.   
#This business is expected to benefit from the winter holiday period - and thus the cash inflow during every last 3 months of the year (assuming that our timeline starts counting from January of Year 1) is 25% higher than other periods.

i <- 0.025 #this is the interest rate
QuarterlyRevenue <- c(rep(0, times = 6), 400000, 400000*1.25, rep(c(400000, 400000, 400000, 400000*1.25), times = 8))
QuarterlyOpCost <- rep(125000, times = 40)
QuarterlyNet <- QuarterlyRevenue - QuarterlyOpCost
QuarterlyNet #these are the quarterly net cashflows for the 10 year period

NPV <- -5000000 +sum(QuarterlyNet*((1+ i)^{-(1:40)/4}))
NPV #This is the final NPV of the investment