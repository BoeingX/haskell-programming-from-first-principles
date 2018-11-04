# Haskell Programming from First Principles
[![Build Status](https://travis-ci.org/BoeingX/haskell-programming-from-first-principles.svg?branch=master)](https://travis-ci.org/BoeingX/haskell-programming-from-first-principles)
[![CircleCI](https://circleci.com/gh/BoeingX/haskell-programming-from-first-principles/tree/master.svg?style=svg)](https://circleci.com/gh/BoeingX/haskell-programming-from-first-principles/tree/master)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

This repository hosts my notes and solutions to exercises in the book
[Haskell Programming from First Principles](http://haskellbook.com/).

## Dependencies

The only dependency is [Stack](https://docs.haskellstack.org/en/stable/README/). 
Once setup, Stack takes care of any Haskell package dependencies.

## Project structure

This repository is organized as a single Stack project as follows
```
.
├── benchmark/
├── ChangeLog.md
├── haskell-programming-from-first-principles.cabal
├── LICENSE
├── package.yaml
├── README.md
├── Setup.hs
├── src/
├── stack.yaml
└── test/
```
where `[src](./src)` are solutions whose name follows the pattern
```
ChapterName/SectionName/ExerciseName.hs
```
[test](./test/) and [benchmark](./benchmark) are test and benchmark suites following
the same naming convention.

## Run tests

All test suites can be discovered by `hspec-discover`. To run tests, simply do

```bash
stack test
```
or
```bash
stack --fast test
```
if you want avoid GHC optimization (hence faster).

## Run benchmarks

Run

```bash
stack bench
```

> **Never** use the `--fast` flag for benchmarks otherwise you will get **wrong** results.

Reference benchmark results are included in each benchmark file as block comment.
