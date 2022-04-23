library(bootstrap)
library(dplyr)
data = law


sample_1 = replicate(1000,sample_n(data,15,replace = TRUE))



LSAT = c()
for (i in 1:1000){
  LSAT[i] = sample_1["LSAT",i]
}


matrix_LSAT = matrix(,nrow = 15,ncol=1000)
for (i in 1:1000){
  matrix_LSAT[,i] = as.matrix(unlist(LSAT[i]))
}



GPA = c()
for (i in 1:1000){
  GPA[i] = sample_1["GPA",i]
}

matrix_GPA = matrix(,nrow = 15,ncol=1000)
for (i in 1:1000){
  matrix_GPA[,i] = as.matrix(unlist(GPA[i]))
}



corr_coef = c()

for (i in 1:1000){
  corr_coef[i] = cor(matrix_LSAT[,i],matrix_GPA[,i])
}


hist(corr_coef)

cor(data$LSAT,data$GPA)-mean(corr_coef)


mean(corr_coef)



vector_corr = as.vector(corr_coef)

vector_corr[1]

se = c()
for (i in 1:1000){
  se[i] = (vector_corr[i]-mean(corr_coef))^2
}

se[1]
se[2]
s_error = sqrt(sum(se)/999)
s_error
