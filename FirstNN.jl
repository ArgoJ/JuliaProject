# Import Packages
using Pkg
using Flux
using Flux: mse, train!
using BenchmarkTools
using LinearAlgebra
using Base.MathConstants
using Random


# set random seed for reproduction
Random.seed!(1)

# function f(x) 
f(x::Vector{Float64}) = 5 .* x.^4 - 42 .* (1 ./ x.^2)

# data
rn_data = Vector{Float64}(rand(84)*10)
data = f(rn_data)


# Neural network model
model = Chain(
  Dense(84 => 42, σ),
  Dense(42 => 10),
  softmax)

# set random seed for reproduction
Random.seed!(1)

# loss function
loss(x, y) = mse(model(x), y)
ps = Flux.params(model) 
opt= ADAM(1e-3)

# train NN
Flux.train!(loss, ps, data, opt)