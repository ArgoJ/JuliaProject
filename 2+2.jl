# Import Packages
using Pkg  # Package to install new packages


#= Install packages 
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

# Enable printing of 1000 columns
#ENV["COLUMNS"] = 1000


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

@btime testsum(3)
