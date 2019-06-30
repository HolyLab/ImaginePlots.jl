# ImaginePlots
[![Build Status](https://travis-ci.com/HolyLab/ImaginePlots.jl.svg?branch=master)](https://travis-ci.org/HolyLab/ImaginePlots)
[![Build status](https://ci.appveyor.com/api/projects/status/28014huexv93dr69/branch/master?svg=true)](https://ci.appveyor.com/project/Cody-G/imagineplots-jl/branch/master)
[![codecov](https://codecov.io/gh/HolyLab/ImaginePlots.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/HolyLab/ImaginePlots.jl)

Plotting of `ImagineSignal` objects from the [ImagineInterface.jl](https://github.com/HolyLab/ImagineInterface) package.

After cloning you must run `Pkg.build("ImaginePlots")` before the package will function.

Plotting is accomplished via [Plots.jl](https://github.com/JuliaPlots/Plots.jl) and results may vary depending on which Plots backend you're using.  At the moment the [PyPlot](https://github.com/JuliaPy/PyPlot.jl) and [PlotlyJS](https://github.com/sglyon/PlotlyJS.jl) backends are recommended.

After loading Plots.jl simply pass an `ImagineSignal` to the `plot` function to visualize the timeseries.  If you pass a vector of `ImagineSignal` then multiple timeseries will be shown, each in a separate subplot.
