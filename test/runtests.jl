using ImaginePlots
using ImagineInterface, Unitful, Plots
using Test

pyplot()

sigs = rigtemplate("ocpi-2")
p = getpositioners(sigs)[1]
append!(p, "test", Unitful.V*rand(100))
@test_nowarn plot(p)
@test_nowarn plot([p;p])
@test_nowarn plot(sigs)
