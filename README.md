# grid-all
Wrapper of the underlying server, project and core repositories with a shared code-workspace. All configuration is handled as sub-repository level to keep them self-contained.

## Getting started

Clone repository with sub-modules

```bash
git clone https://github.com/DAT2G7/grid-all --recurse-submodules
```

### Linux

For linux users, a bash script for setting up submodules has been supplied

```bash
chmod +x ./setup.sh && ./setup.sh
```