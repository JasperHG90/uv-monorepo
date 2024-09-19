# Monorepo setup with uv

This repository contains an example of a monorepo setup using uv.

A lot of the information used in this repository comes from [this github issue in the uv repository](https://github.com/astral-sh/uv/issues/6935).

## Motivation

There are times when it's a lot easier to have a single repository with multiple python packages rather than having a single repository for each. Existing tools (poetry, pants etc.) all have their own up,- and downsides. [uv](https://github.com/astral-sh/uv) has the concept of workspaces, which can be used to configure a monorepo setup. It's not as comprehensive as e.g. [pantsbuild](https://www.pantsbuild.org/), but in many cases it will do without adding the complexity that tools like pants add.

## The example

In this example, there is a package called 'utils' that is stored in the 'shared' folder. The main package is called 'core' and can be found under 'src'. We also have a script in the 'scripts' folder. The 'core' package depends on 'shared'.

This repository further contains some additional setup (e.g. pre-commit, unit tests using pytest), and further contains a dockerfile that can be used to build packages in 'core'. I strongly suggest that you use the [devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) found under '.devcontainer'. Do check out the dockerfile there, since it configures the caching directories for a number of tools, and pins the uv version. The repository with source code for the devcontainer can be found [here](https://github.com/JasperHG90/devcontainers).

[justfile](https://github.com/casey/just) recipes are available for setting up, testing, building and running pre-commit in the repository.

## Setting up

Once in the devcontainer, execute `just s` to set up the project. uv is cached in the '.cache' directory.

## Not implemented

One of the challenges of a monorepo is setting up CI/CD with clever filters / caching. This is not implemented here.

## Comparison with other tools

I've tried out this setup with a couple of tools, and have summarized my experience with them in the table below.

|                  | Poetry              | UV           | Pants           |
| ---------------- | ------------------- | ------------ | --------------- |
| Simplicity       | 😃                  | 😃           | 😭              |
| Single lock file | 😭                  | 😍           | 🚀              |
| CI/CD            | 🤨                  | 🤨           | 🙂              |
| Docker builds    | 🤔                  | 😀           | 😭➡️🙂          |
| Speed            | 🤮                  | 🥰           | 😌              |
| **Verdict**      | Woefully inadequate | Happy medium | Too complicated |
