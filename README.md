Create squashfs

```bash
./build_squashfs 10000 test.sqfs
```

Run benchmark:

```bash
srun -A project_2001659 --partition=interactive --time=0:05:00 --nodes=1 --ntasks-per-node=1 --cpus-per-task=1 --mem 8000 --pty ./run.sh
```
