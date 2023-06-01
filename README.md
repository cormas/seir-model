# REDEpidemiologicalModel

[![CI](https://github.com/olekscode/REDEpidemiologicalModel/actions/workflows/test.yml/badge.svg)](https://github.com/olekscode/REDEpidemiologicalModel/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/REDEpidemiologicalModel/badge.svg?branch=master)](https://coveralls.io/github/olekscode/REDEpidemiologicalModel?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/REDEpidemiologicalModel/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)

An agent-based model implemented in Cormas for RED reproducibility study

## How to install it?

To install the image, you must first get a latest version of Cormas platform (in this experiment, we used the version [8735b99](https://github.com/cormas/cormas/tree/8735b9931b98a06913b4ecf2f6214e89bbe43a27) but more recent versions should also work).
To do that, follow the instructions at [Cormas GitHub](https://github.com/cormas/cormas/blob/master/README.md).
Theno open the Playground (Ctrl+OW) in your image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'REDModel';
  repository: 'github://olekscode/REDEpidemiologicalModel/src';
  load.
```

To check if installation is correct, go to the `RED-Model-Tests` package and run all the tests.

## How to depend on it?

If you want to add a dependency on this project to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'REDModel'
  with: [ spec repository: 'github://olekscode/REDEpidemiologicalModel/src' ].
```

If you are new to baselines and Metacello, check out this wonderful [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.
