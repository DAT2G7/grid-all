| Repo    | Build                                                                                                               | Test                                                                                                               |
| ------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Server  | ![example event parameter](https://github.com/DAT2G7/grid-server/actions/workflows/build.yml/badge.svg?event=push)  | ![example event parameter](https://github.com/DAT2G7/grid-server/actions/workflows/jest.yml/badge.svg?event=push)  |
| Project | ![example event parameter](https://github.com/DAT2G7/grid-project/actions/workflows/build.yml/badge.svg?event=push) | ![example event parameter](https://github.com/DAT2G7/grid-project/actions/workflows/jest.yml/badge.svg?event=push) |
| Core    | ![example event parameter](https://github.com/DAT2G7/grid-core/actions/workflows/build.yml/badge.svg?event=push)    | ![example event parameter](https://github.com/DAT2G7/grid-core/actions/workflows/jest.yml/badge.svg?event=push)    |

Extension does not have any pipelines.

# grid-all

This repository contains all the code accompanying AAU cs-23-DAT-2-07's P2 report

This is a wrapper of the underlying server, project, core and extension repositories. All configuration is handled as sub-module level to keep them self-contained.

A short setup guide is included further down in this document. Full guides for using and developing each sub-module are also self-contained within their respective repositories. Check the respective module's `README.md` for more info. The extension is only described in its own repository, as it works independently of the rest of the codebase.

A vscode workspace organising the full codebase has been provided. See `grid-all.code-workspace`.

## Prerequisites

The codebase relies on `node` and `npm` already being installed on the host machine. `npm` alternatives like `yarn` or `pnpm` should also work, but no lock file has been supplied. The setup script described below also assumes `npm` is installed.

## Getting started

Clone repository with sub-modules

```bash
git clone https://github.com/DAT2G7/grid-all --recurse-submodules
```

## Setting up submodules

After cloning with the recursive submodule command, sub-module dependencies have to be installed. A script `setup.sh` has been supplied for this purpose with commands for running it listed below:

### Unix

Add execution permission and run the script

```bash
chmod +x ./setup.sh && ./setup.sh
```

### Windows

Windows users with bash enabled can use the unix setup script with the bash command

```bash
bash ./setup.sh
```

### Manual setup

Setting up submobules manually requires entering each sub-module directory

Alternatively it is required to cd into each sub-module and install node modules manually.

## Running the codebase

Running the codebase has 3 moving parts. First the core in [./grid-core](https://github.com/DAT2G7/grid-core) has to be build and copied to the project server in [./grid-project](https://github.com/DAT2G7/grid-project). Then the grid server in [./grid-server](https://github.com/DAT2G7/grid-server) has to be started, and lastly the project server should be started. The project server then automatically registers a couple of jobs with the grid server.

When all that is done, the web page for the grid server is ready. By default it should be served on http://localhost:3000.

### Step by step:

This guide assumes sub modules have already been set up according to the [Setting up submodules](#setting-up-submodules) section of this document.

Start by building the core and copying it to `./grid-project`

```sh
cd ./grid-core
npm run build
cp ./dist/bundle.js ../grid-project/bundle.js
cd ..
```

Then build and start the grid server

```sh
cd ./grid-server
npm run build
npm run start
```

In a new terminal, build and start the project server

```sh
cd ./grid-all/grid-project
npm run build
npm run start
```

Now the page can be opened on [localhost](http://localhost:3000)

## FAQ

### Why does my localhost page not look like [grid.hauptman.tech](https://grid.hauptman.tech/client)?

If you have previously hosted pages relying on service workers on the same port, their caches may interfere with the content the grid is trying to serve. Either clear your browsers cache or simply change the servers port using `.env` configuration. Note that changing the grid servers port requires a `.env` change in the project server aswell, to allow them to communicate with each other.

### Why does root contain node modules?

The global nature of Jest types when writing tests has the unfortunate sideffect of types not being recognized if the type module is not installed in the root folder. As such, `@types/jest` has to be installed to make intellisense happy. It has no functional effect.

Alternatively patterns targeting test files can be removed from the sub modules' `tsconfig.json` `"exclude"` fields, but this results in tests being bundled with the program on build.

### What is the `thunder-tests` directory?

`thunder-tests` refers to a set of E2E tests which tests the different servers' endpoints from the outside using thunderclient. It has also been used to generate the documentation found in Appendix B.
