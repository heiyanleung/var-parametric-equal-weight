MyVarParEq <- function(port=port,wei=e.weight,comp.days=1,size.days=251,
  conf=0.95){
    if(nrow(port)-size.days<comp.days)
      stop("Not enough data. Try lowering comp.days or size.days")
    val <- port %*% wei
    pvar <- c(rep(0,comp.days))
    for(i in 1:comp.days){
      a <- 1+i; b <- size.days+i
      data <- port[a:b,]
      var_cov <- cov(data)
      var <- t(wei) %*% var_cov %*% wei
      sd <- var^.5
      pvar[i] <- qnorm(conf,0,1) * sd * -1
      }
  pfail <- sum((val[0:comp.days]<0)&(val[0:comp.days]<pvar))/length(pvar)
  return(list(VaR=pvar,Fail=pfail))
  }
