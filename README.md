# var-parametric-equal-weight
Value at Risk: parametric equally weighted

For our value-at-risk and the corresponding back testing functions, there are
more input criteria. We need a merged data frame or matrix of
returns (daily in the example of this paper) to carry out the computations. For
example, we type the following to get 1-day parametric VaR’s (equally weighted
moving average):

MyVarParEq(port=port,wei=e.weight,comp.days=1,size.days=251,conf=0.95)

where port is the data frame or matrix of daily returns of all the stocks in our
portfolio, e.weight is the vector of stock allocation of our portfolio, comp.days
is the number of next day VaR we want to compute (if we put 1, it give us the
VaR of the day after our last day in our data set), size.days is the window
length, meaning the number of days we use to compute the variance-covariance
information for each VaR, and conf is the confidence level.
