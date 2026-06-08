#!/usr/bin/env bash

# environment
module purge
module load julia

# TODO: refactor as Julia script
# TODO: add output details

# setup
mkdir -p /tmp/tollande/squashfs_fuse
squashfuse_ll nocomp.sqfs /tmp/tollande/squashfs_fuse

unsquashfs -dest /tmp/tollande/squashfs_tmp nocomp.sqfs > /dev/null
unsquashfs -dest /scratch/project_2001659/squashfs_lustre nocomp.sqfs > /dev/null

# benchmark
julia read_files.jl 10000

# cleanup
fusermount -u /tmp/tollande/squashfs_fuse
rmdir /tmp/tollande/squashfs_fuse
rm -rf /tmp/tollande/squashfs_tmp
rm -rf /scratch/project_2001659/squashfs_lustre
