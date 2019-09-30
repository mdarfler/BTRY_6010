p1 <- dbinom(1,10,0.6)*(1-pbinom(1,10,0.4))

p <- 0
for(i in 1:10){
  p_i <-  dbinom(i,10,0.6)*(1-pbinom(i,10,0.6))
  p <- p + p_i
}

p