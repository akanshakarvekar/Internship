library(bootstrap)
data = cars
matrix_1 = as.matrix(data)
matrix_1

n = 50
samp_corr = cor(matrix_1[1:n,1],matrix_1[1:n,2])
samp_corr




corr = function(yz,matrix_1){
  cor(matrix_1[yz,1],matrix_1[yz,2])
}



jack_cars = jackknife(1:n,corr,matrix_1)


jack_estimate = n*samp_corr-49*mean(jack_cars$jack.values)
jack_estimate

jack_cars


