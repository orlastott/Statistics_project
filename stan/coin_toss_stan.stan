
// The input data.
data {
  int<lower=0> n_samples;
  array [n_samples] int y;
 real<lower= 0> aprior;
 real<lower= 0> bprior;

}

// The parameters accepted by the model.
parameters {
    real<lower=0, upper =1> theta;
}

// The model to be estimated. 
model {
  theta ~ beta(aprior,bprior);
  y ~ bernoulli(theta);
}

