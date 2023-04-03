# grid-all
Wrapper of the underlying server, project and core repositories with a shared code-workspace. All configuration is handled as sub-module level to keep them self-contained.

Guides for using each sub-module are also self-contained. Check the respective modules `README.md` for more info

## Getting started

Clone repository with sub-modules

```bash
git clone https://github.com/DAT2G7/grid-all --recurse-submodules
```

### Unix

For linux users, a bash script for setting up submodules has been supplied

```bash
chmod +x ./setup.sh && ./setup.sh
```

### Windows

Windows users with bash enabled can use the unix setup script with the bash command

```bash
bash ./setup.sh
```

Alternatively it is required to cd into each sub-module and install node modules manually.