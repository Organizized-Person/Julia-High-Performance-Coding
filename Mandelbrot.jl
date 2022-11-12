"""

The mandelbrot set is defined by the set of complex numbers c for which the complex numbers of the sequence
z_(n+1) = z_n*z_n + c remain bounded. 

The sequence starts at z = 0 is bounded when z_(n) <= 2.

We have a for loop that goes up to 100 times. 
For each iteration, we propagate the sequence. If the sequence becomes unbounded, we end the loop and we return the number of iterations it took to reach unboundedness. Otherwise, we return the max iteration, 100.



In this code, we write a function that takes a complex number c and returns the number of iterations it takes for the sequence to be bounded. 

Eventually, we will plot the complex number c on the imaginary plane. This function here will assign the 'color' of that point. In our heat map, a point that reaches 100 color is a complex number that took 100 or more iterations before the sequence became unbounded. 

"""
function mandelbrot(c::Complex)
    max = 100
    z = 0 + 0im
    for iter in 1:max
        z = z*z + c
        if abs(z) >= 2
            return iter
        end
    end
    return max
end