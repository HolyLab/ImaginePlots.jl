try
Pkg.clone("https://github.com/HolyLab/ImagineInterface.git")
catch
    print("Could not clone ImagineInterface.  Is it already installed?\n")
end
try
Pkg.clone("https://github.com/ajkeller34/UnitfulPlots.jl.git")
catch
    print("Could not clone UnitfulPlots.  Is it already installed?\n")
end
