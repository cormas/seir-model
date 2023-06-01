# REDEpidemiologicalModel

[![CI](https://github.com/olekscode/REDEpidemiologicalModel/actions/workflows/test.yml/badge.svg)](https://github.com/olekscode/REDEpidemiologicalModel/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/REDEpidemiologicalModel/badge.svg?branch=master)](https://coveralls.io/github/olekscode/REDEpidemiologicalModel?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/REDEpidemiologicalModel/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)

An agent-based model implemented in Cormas for RED reproducibility study

## How to install it?

To install the project, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'REDModel';
  repository: 'github://olekscode/REDEpidemiologicalModel/src';
  load.
```

## How to depend on it?

If you want to add a dependency on this project to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'REDModel'
  with: [ spec repository: 'github://olekscode/REDEpidemiologicalModel/src' ].
```

If you are new to baselines and Metacello, check out this wonderful [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.
