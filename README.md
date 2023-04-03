| Repo | Build | Test | Other |
|------|-------|------|-------|
| Server |![example event parameter](https://github.com/DAT2G7/grid-server/actions/workflows/build.yml/badge.svg?event=push)|![example event parameter](https://github.com/DAT2G7/grid-server/actions/workflows/jest.yml/badge.svg?event=push)||
| Project |![example event parameter](https://github.com/DAT2G7/grid-project/actions/workflows/build.yml/badge.svg?event=push)|![example event parameter](https://github.com/DAT2G7/grid-project/actions/workflows/jest.yml/badge.svg?event=push)||
| Core |![example event parameter](https://github.com/DAT2G7/grid-core/actions/workflows/build.yml/badge.svg?event=push)|![example event parameter](https://github.com/DAT2G7/grid-core/actions/workflows/jest.yml/badge.svg?event=push)||


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

## Pulling updates

To get the most recent commit of all sub-modules use

```bash
git submodule update --recursive --remote
```

## FAQ

### Why does root contain node modules?
The global nature of Jest types when writing tests has the unfortunate sideffect of types not being recognized if the type module is not installed in the root folder. As such, `@types/jest` has to be installed to make intellisense happy. It has no functional effect.

Alternatively patterns targeting test files can be removed from the sub modules' `tsconfig.json` `"exclude"` field, but this results in tests being bundled with the program on build.