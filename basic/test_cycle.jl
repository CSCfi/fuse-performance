#!/usr/bin/env julia

function cycle(i)
    mount_point = mktempdir()
    println(i, " ", mount_point)
    run(`squashfuse test.sqfs $mount_point`)
    run(`mountpoint $mount_point`)
    run(`fusermount -u $mount_point`)
    run(ignorestatus(`mountpoint $mount_point`))
end

for i in 1:1000
    cycle(i)
end
