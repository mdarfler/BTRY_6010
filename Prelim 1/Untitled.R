p <- 0
n <- 10
for(i in 1:n-1){
  p_i <-  dbinom(i,n,0.6)*(1-pbinom(i+1,n,0.6))
  p <- p + p_i
}

p