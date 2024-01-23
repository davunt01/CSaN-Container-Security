# Control Groups (cgroups)

## Identify cgroup version

Get filesystem type in a human-readable format.

```bash
stat -fc %T /sys/fs/cgroup/
```

For cgroup v2, the output is `cgroup2fs`.
For cgroup v1, the output is `cgroup`.

### Cgroup V2

### Create cgroup csan

```bash
sudo mkdir /sys/fs/cgroup/system.slice/csan
```

### Set memory limit

```bash
echo "100M" | sudo tee /sys/fs/cgroup/system.slice/csan/memory.max
```

### Add current shell process to csan cgroup

```bash
echo $$ | sudo tee /sys/fs/cgroup/system.slice/csan/cgroup.procs
```

### Remove cgroup

```bash
sudo rmdir /sys/fs/cgroup/system.slice/csan
```

### Run example

```bash
make && make run
```