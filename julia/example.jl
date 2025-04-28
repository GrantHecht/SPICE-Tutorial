
# Make sure SPICE.jl is installed in the local environment
using Pkg; Pkg.activate(@__DIR__)
Pkg.add("SPICE")

# Load SPICE.jl
using SPICE

# Move to julia directory if not already there
cd(@__DIR__)

# Load the SPICE kernels
furnsh("../rosetta_kernel.tm")

et_start = str2et("2016 MAR 2 12:00:00")
et_end = str2et("2016 MAR 4 12:00:00")

ets = range(et_start, et_end; length=10)

positions = map(
    et -> spkpos("ROSETTA", et, "67P/C-G_CK", "NONE", "CHURYUMOV-GERASIMENKO")[1],
    ets,
)

println("Positions of Rosetta:")
for pos in positions
    println(" " * string(pos))
end
