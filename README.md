| Repo    | Build                                                                                                               | Test                                                                                                               | Other |
| ------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ----- |
| Server  | ![example event parameter](https://github.com/DAT2G7/grid-server/actions/workflows/build.yml/badge.svg?event=push)  | ![example event parameter](https://github.com/DAT2G7/grid-server/actions/workflows/jest.yml/badge.svg?event=push)  |       |
| Project | ![example event parameter](https://github.com/DAT2G7/grid-project/actions/workflows/build.yml/badge.svg?event=push) | ![example event parameter](https://github.com/DAT2G7/grid-project/actions/workflows/jest.yml/badge.svg?event=push) |       |
| Core    | ![example event parameter](https://github.com/DAT2G7/grid-core/actions/workflows/build.yml/badge.svg?event=push)    | ![example event parameter](https://github.com/DAT2G7/grid-core/actions/workflows/jest.yml/badge.svg?event=push)    |       |

# grid-all

This repository contains all the code accompanying cs-23-DAT-2-07's P2 project report

This is a wrapper of the underlying server, project, core and extension repositories. All configuration is handled as sub-module level to keep them self-contained.

Guides for using each sub-module are also self-contained. Check the respective modules `README.md` for more info

A vscode workspace organising the full project has been provided. See `grid-all.code-workspace`

## Prerequisites

The project relies on `node` and `npm` already being installed on the host machine. `npm` alternatives like `yarn` or `pnpm` should also work, but no lock file has been supplied. The setup script described below also assumes `npm` is installed.

## Getting started

Clone repository with sub-modules

```bash
git clone https://github.com/DAT2G7/grid-all --recurse-submodules
```

## Pulling updates

To get the most recent commit of all sub-modules use

```bash
git submodule update --recursive --remote
```

This does not clone new submodules, but only updates existing ones.

## Setting up submodules

After cloning with the recursive submodule command, sub-module dependencies have to be installed. A script `setup.sh` has been supplied for this purpose with commands for running it listed below:

#### Unix

Add execution permission and run the script

```bash
chmod +x ./setup.sh && ./setup.sh
```

#### Windows

Windows users with bash enabled can use the unix setup script with the bash command

```bash
bash ./setup.sh
```

#### Manual set up

Setting up submobules manually requires entering each sub-module directory

Alternatively it is required to cd into each sub-module and install node modules manually.

## FAQ

### Why does root contain node modules?

The global nature of Jest types when writing tests has the unfortunate sideffect of types not being recognized if the type module is not installed in the root folder. As such, `@types/jest` has to be installed to make intellisense happy. It has no functional effect.

Alternatively patterns targeting test files can be removed from the sub modules' `tsconfig.json` `"exclude"` fields, but this results in tests being bundled with the program on build.

### What is the `thunder-tests` directory?

`thunder-tests` refers to a set of E2E tests which tests the different servers' endpoints from the outside using thunderbird. It has also been used to generate the documentation found in Appendix B.
