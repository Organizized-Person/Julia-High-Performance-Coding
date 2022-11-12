


using Plots
include("Mandelbrot.jl")
"""
1. we initialize the plot by setting boundaries and creating a 2-D array of zeros based how much resolution we want.
2. mandelfig is the 2-D array. The higher the value of n, the higher the resolution.
3. xvals and yvals are how we prepare the values of the complex numbers that we will plot. xvals are the real part while yvals are the     imaginary part. These objects are arrays.
4. here we start a for loop that goes through each element of the 2-D matrix or each cell.
5. here is where we put color into each cell. the value of color comes from the function mandelbrot.
6. each element of the 2-D array receives a color.

"""
function plotMandelbrot(xrange::Tuple{Float64,Float64}, yrange::Tuple{Float64,Float64}; n::Int64 = 2_000)
    # we initialize the plot by setting boundaries and creating a 2-D array of zeros based how much resolution we want. 
    min_x, max_x = xrange
    min_y, max_y = yrange
    # mandelfig is the 2-D array. The higher the value of n, the higher the resolution. 
    mandelfig = zeros(n,n)
    # xvals and yvals are how we prepare the values of the complex numbers that we will plot. xvals are the real part
    # while yvals are the imaginary part. These objects are arrays.
    xvals = range(min_x,max_x,n)
    yvals = range(min_y,max_y,n)
    # here we start a for loop that goes through each element of the 2-D matrix or each cell.
    for x in 1:n
        for y in 1:n
            real, imag = xvals[x], yvals[y]
            # here is where we put color into each cell. the value of color comes from the function mandelbrot. 
            heatcolor = mandelbrot(real+imag*(0+1im))
            # each element of the 2-D array receives a color.
            mandelfig[y,x] = heatcolor
        end
    end
    return heatmap(mandelfig, color=:ice, axis=nothing)
end

function plotMandelbrot(xyrange::Tuple{Float64,Float64}; n::Int64=2_000)
    min_, max_ = xyrange
    mandelfig = zeros(n, n)
    xvals = range(min_,max_,n)
    yvals = range(min_,max_,n)
    for x in 1:n
        for y in 1:n
            real, imag = xvals[x], yvals[y]
            mandelcolor = mandelbrot(real + imag*(0+1im))
            mandelfig[y,x] = mandelcolor
        end
    end
    return heatmap(mandelfig, color=:ice, axis=nothing, aspect_ratio=:equal)
end