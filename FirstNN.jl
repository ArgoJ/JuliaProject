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

#######################################################################
## Data
dataLengt = 10000
x_data = rand(Float32, (dataLengt, 1))*10

# function f(x) 
f(x::Matrix{Float32}) = 5 .* x.^4 #- 42 .* (1 ./ x.^2)
y_data = f(x_data)

# train percentage
trPct = 0.8
tePct = 0.2
trLength = Int64(dataLengt*trPct)
teLength = Int64(dataLengt*tePct)

# train data
x_train = x_data[1:trainLength, :]
x_train = reshape(x_train, (1, trainLength))
y_train = y_data[1:trainLength, :]
y_train = reshape(y_train, (1, trainLength))

# test data
x_test = x_data[(trLength+1):end, :]
x_test = reshape(x_test, (1, teLength))
y_test = y_data[(trLength+1):end, :]
y_test = reshape(y_test, (1, teLength))

#########################################################################
# set random seed for reproduction
Random.seed!(1)  

# Neural network model
model = Chain(
  Dense(1 => 10, σ),
  Dense(10 => 171, relu),
  Dense(171 => 1))

# loss function
loss(x, y) = mse(model(x), y)
ps = Flux.params(model) 
opt= ADAM(1e-3)

##########################################################################
# train model
loss_history = []

epochs = 20000

for epoch in 1:epochs
  train!(loss, ps, [(x_train, y_train)], opt)
  train_loss = loss(x_train, y_train)
  push!(loss_history, train_loss)
  println("Epoch = $epoch : Training Loss = $train_loss")
end

#########################################################################
# test trained model
y_predict = model(x_test)
error = mean(y_predict .== y_test)
println(y_predict)
println(y_test)