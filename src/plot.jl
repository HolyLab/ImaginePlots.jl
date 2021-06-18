get_times(v::AxisArray{T}) where {T} = axisvalues(v[Axis{:time}])[1]

#This version plots groups in separate windows
#function plot(coms::Vector{ImagineSignal}; sampmap=:world)
#    used_idxs = find(x->length(x) > 0, coms)
#    used_coms = coms[used_idxs]
#    nsamps = length(used_coms[1])
#    @assert all(map(length, used_coms).==nsamps)
#    #NOTE: submitted bug report because plotting of matrices with UnitfulPlots isn't working
#    p = []
#    for (comgroup, groupname) in zip((getpositioners(used_coms), getcameras(used_coms), getlasers(used_coms), getstimuli(used_coms)), ("Positioners","Cameras", "Lasers", "Stimuli"))  #assumes each as the same world units within-group
#        ncoms = length(comgroup)
#        if ncoms == 0
#            continue
#        end
#        times = [get_times(get_samples(comgroup[1]))...]
#        for i = 1:ncoms
#            cursamps = get_samples(comgroup[i])
#            if eltype(cursamps) == Bool #work around another plotting bug
#                cursamps = map(UInt8, cursamps)
#            end
#            if i == 1
#                p = plot(times, cursamps, lab=name(comgroup[i]), title=groupname, reuse=false, show=true)
#            else
#                plot!(p, times, cursamps, lab=name(comgroup[i]), show=true)
#            end
#        end
#    end
#end

#This plots all signals in a single plot via subplots
function plot(coms::Vector{T}; sampmap=:world) where T<:ImagineSignal
    used_idxs = findall(x->length(x) > 0, coms)
    used_coms = coms[used_idxs]
    nsamps = length(used_coms[1])
    @assert all(map(length, used_coms).==nsamps)
    plts = []
    nuc = length(used_coms)
    ct = 1
    clrs = Colors.distinguishable_colors(nuc+1, colorant"white")[2:end]
    for (comgroup, groupname) in zip((getpositioners(used_coms), getcameras(used_coms), getlasers(used_coms), getstimuli(used_coms)), ("Positioners","Cameras", "Lasers", "Stimuli"))  #assumes each as the same world units within-group
        ncoms = length(comgroup)
        if ncoms == 0
            continue
        end
        times = [get_times(get_samples(comgroup[1]))...]
        for i = 1:ncoms
            cursamps = get_samples(comgroup[i])
            if eltype(cursamps) == Bool #work around another plotting bug
                cursamps = map(UInt8, cursamps)
            end
            #push!(plts, plot(times, cursamps, lab=name(comgroup[i]), title=groupname, reuse=false, show=false))
            push!(plts, plot(times, cursamps, lab=name(comgroup[i]), color = clrs[ct], show=false))
            ct+=1
        end
    end
    xts = Array{Any}(undef, 1, nuc)
    hts = fill(0.1, nuc)
    fill!(xts, nothing)
    xts[end] = :auto
    yts = :auto
    hts[findpositioners(used_coms)] .= 0.4
    output = plot(plts..., layout = grid(nuc,1,heights=hts), link=:x, xticks=xts, yticks=yts, reuse=false, show=true)
    return output
end

function plot(com::ImagineSignal; sampmap=:world)
    samps = get_samples(com)
    times = get_times(samps)
    if eltype(samps) == Bool #work around another plotting bug
        samps = map(UInt8, samps)
    end

    plot(times, samps, show=true, reuse=false)
end
