# FUSE performance

Install tests:

```bash
mkdir -p /scratch/project_2001659/$USER
cd /scratch/project_2001659/$USER
```

```bash
git clone https://github.com/CSCfi/fuse-performance
```

## Read Small Files

Test performance of reading lot of small files from FUSE mounted squashfs.

```bash
cd read_small_files
```

Create squashfs:

```bash
module load julia
julia build_squashfs.jl 10000
```

Run benchmark:

```bash
./run.sh
```
