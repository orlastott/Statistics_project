
// The input data.
data {
 int<lower=0> n; //n is number of race results
 int<lower=0> N; // N is number of runners 
 vector [n]  log_velocity;
 vector [n]  log_duration;
 real<lower= 0> e_a;
 real<lower= 0> e_b;
 real<lower= 0> s_shape;
 real<lower= 0> s_rate;
 real<lower= 0> sigma_shape; 
 real<lower= 0> sigma_rate;
}

// The parameters accepted by the model. 
parameters {
  real<lower = 0, upper = 1>  endurance; //vector of endurance parameters- one for each runner 
  real<lower = 0> speed; //one for each runner 
  real<lower = 0> sigma;
}

// The model to be estimated..
model {
  endurance ~ beta(e_a, e_b);  
  speed ~ gamma(s_shape, s_rate);
  sigma ~ gamma(sigma_shape, sigma_rate);
for (i in 1:n) {
  log_velocity[i] ~ normal(log(speed) + (endurance - 1) * log_duration[i], sigma);
  }
}
