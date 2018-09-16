# Haskell Programming from First Principles

[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

**Disclaimer: this is an on-going project and is subject to frequent changes.**

This repository hosts my notes and solutions to exercises in the book
[Haskell Programming from First Principles](http://haskellbook.com/).

## Dependencies

The only dependency is [Stack](https://docs.haskellstack.org/en/stable/README/). 
Once setup, Stack takes care of any Haskell package dependencies.

## Project structure

This repository is organized as a single Stack project.
Exercise(s) solutions can be found at
```bash
src/<chapter name>/<section name>/<exercise name>.hs
```
Companion test suites (if available) can be found at
```bash
test/<chapter name>/<section name>/<exercise name>Spec.hs
```

## Run test

All test suites can be discovered by `hspec-discover`. To run tests, simply do

```bash
stack test
```
or
```bash
stack --fast test
```
if you want avoid GHC optimization (hence faster).

## Troubleshooting
