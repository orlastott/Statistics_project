
// The input data.
data {
 int<lower=0> n;
 vector [n] log_velocity;
 vector [n] log_duration;
 real<lower= 0> e_a;
 real<lower= 0> e_b;
 real<lower= 0> s_shape;
 real<lower= 0> s_rate;
 real<lower= 0> sigma_shape; 
 real<lower= 0> sigma_rate;
}

// The parameters accepted by the model. 
parameters {
  real<lower = 0, upper = 1> endurance;
  real<lower = 0> speed;
  real<lower = 0> sigma;
  }

// The model to be estimated..
model {
  endurance ~ beta(e_a, e_b); 
  speed ~ gamma(s_shape, s_rate);
  sigma ~ gamma(sigma_shape, sigma_rate);
    log_velocity ~ normal(log(speed) + (endurance - 1) * log_duration, sigma);
}




