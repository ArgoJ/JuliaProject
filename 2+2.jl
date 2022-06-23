# Import Packages
using Pkg  # Package to install new packages


#=Install packages 
Pkg.add("DataFrames")
Pkg.add("CSV")
Pkg.add("Plots")
Pkg.add("Lathe")
Pkg.add("GLM")
Pkg.add("StatsPlots")
Pkg.add("MLBase")
Pkg.add("Flux")
Pkg.add("BenchmarkTools")
=#


#= Load the installed packages
using DataFrames
using CSV
using Plots
using Lathe
using GLM
using Statistics
using StatsPlots
using MLBase
=#
using Flux
using BenchmarkTools
using LinearAlgebra
using Base.MathConstants

# Enable printing of 1000 columns
ENV["COLUMNS"] = 1000

function testsum(n)
    x = Float64[2 5 8]
    y = Float64[5 2 6]

    if n <= 3 && n >= 1
        k = 0
        for i in 1:n
            k = sum(x .- y)
            x[i] = k
            y[i] = -k
        end
    end
    
    return x, y
end

# Testing time of testsum
@btime testsum(3)




# testing strings
str = "Peter"
str1 = str[1:2]
str2 = str[3:end]
occursin(r"^[a-z]", str)                    # tiny letter at the start?
occursin(r"[a-z]$", str)                   # tiny letter at the end?


# Tuple
tup1 = (0.2, 1.5, 15.5, 64.2)
tup2 = (2.1, 74.5, 57.3, 5.2)
typeof(tup1)

tup1[2]


# Arrays
a1 = Array{Any}(nothing, 5, 5)
a2 = Vector(undef, 4)
a3 = Vector(undef, 4)
a23 = vcat(a2, a3)
a23 = reshape(a23, 2, 4)
fill!(a1, 5)

A = [5 2 6; 2 6 7; 1 5 0]
invA = inv(A)

zeros(Int64, 5, 5)
imat = Matrix{Int8}(I, (2,2))

A1 = [sqrt(i) for i in [64, 25, 90]]


# Dictionaries
D0 = Dict{String, String}()

get(D0, "Penis", "unknown")
get!(D0, "Penis", "Hey")
haskey(D0, "Penis")

D0["Damn"] = "shit"
get(D0, "Damn", "unknown")

DKey = collect(keys(D0))


# Controll Flow
b1 = begin 
    c = 2
    b = 5
    c * b
end
println(b1)

k = 2
if k == 0
    "great!"
elseif k <= 2
    "not great!"
else
    "fail!"
end

println(
    k == 0 ? "great!" :
    k <= 2 ? "not great!" :
    "fail!")

# Loops
odd = [1,3,5]
even = [2,4,6]
for i in odd, j in even
    i*j
end

for i in 1:10
    if i % 2 == 0
        continue
    end
    sq = i^2
    println("i: $i --- sq: $sq")
    if sq >= 25
        break
    end
end


# functions
function f1!(x)
    x[1] = 9999
    return(x)
end

ia = Int64[0,1,2]
println("Array ia: ", ia)

f1!(ia)
println("Argument passing by reference: ", ia)

a1 = [2,3,1,6,2,8]
sort!(a1)                                   # ! pushes function output in input
a1

Penis