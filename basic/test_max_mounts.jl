#!/usr/bin/env julia

function cycle(i, mount_point)
    println(i, " ", mount_point)
    run(`squashfuse test.sqfs $mount_point`)
    run(`mountpoint $mount_point`)
end

mount_points = [mktempdir() for _ in 1:1001]

for (i, mount_point) in enumerate(mount_points)
    try
        cycle(i, mount_point)
    catch e
    end
end

for mount_point in mount_points
    try
        run(`fusermount -u $mount_point`)
    catch
    end
    rm(mount_point; force=true)
end
