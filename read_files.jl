using Random

function read_files(dir::AbstractString, order::Vector{Int})
    for i in order
        io = open(joinpath(dir, "$i"), "r")
        read(io)
        close(io)
    end
    return nothing
end

if abspath(PROGRAM_FILE) == @__FILE__
    length(ARGS) == 1 || error("usage: julia read_files.jl <N>")
    N = parse(Int, ARGS[1])
    order = shuffle!(collect(1:N))

    # precompile function
    read_files("non-existent", Int[])

    println("/tmp fresh")
    @time read_files("/tmp/tollande/squashfs_tmp", order)

    println("/tmp cached")
    @time read_files("/tmp/tollande/squashfs_tmp", order)

    println("squashfuse_ll fresh")
    @time read_files("/tmp/tollande/squashfs_fuse", order)

    println("squashfuse_ll cached")
    @time read_files("/tmp/tollande/squashfs_fuse", order)

    println("lustre scratch fresh")
    @time read_files("/scratch/project_2001659/squashfs_lustre", order)

    println("lustre scratch cached")
    @time read_files("/scratch/project_2001659/squashfs_lustre", order)
end
