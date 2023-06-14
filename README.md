# SEIR Model

[![CI](https://github.com/cormas/seir-model/actions/workflows/test.yml/badge.svg)](https://github.com/cormas/seir-model/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/cormas/seir-model/badge.svg?branch=master)](https://coveralls.io/github/cormas/seir-model?branch=master)
[![Pharo version](https://img.shields.io/badge/Pharo-v9.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-v10.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-v11.0-%23aac9ff.svg)](https://pharo.org/download)
[![Cormas version](https://img.shields.io/badge/Cormas-v0.5-green?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAMAAAAMCGV4AAABSlBMVEUAAAAOp0PDL3IGo0EDo0Int1XABWwAokAao0YVo0bNA3EFokIAoT8Lo0QOpEXALXAJqkYVo0c6tFsQpkYIqUiFHVhIs2AVoUhR8nkpmEQnj0LIAG9BeUeYRF27HWoDkUEPnkGJSFoFo0Ijo0gRmUIEokIdm0EHokFGckbDIW/FK3EMmEMApEJ+TFhqYFAWo0UAo0ExgkMNokO4GWsDo0ErpEwQpkLMDHQxdkUgikIopErKAHEIo0ICoUIAp0SrLGYCkUJlW04ra0MLo0U/p1ieLV7DPHUAq1QEgFC6AG0oWEBeAEwuuVHMAGYCuUoOsUjZI3rNDnPHA28Pv04MuUsBr0UBqUPaHnrZGHnPGXW6SXDIIXDAL2+0QGu4NGuhTWR2ZlZ4XlVjdlJocFJoaVAaukxHjUwXs0oFs0kbrEg6jEgUqUcYnUYUpEI1naPBAAAATnRSTlMABFZwUwf85dfFtY2HcmZcPDAuKCMiIB4J+vbx7evn49/d3dvY1tTTx8PAvr68ubm0sK+snpSSkZGOhoOAgHxzbWJfWVFPSEZAPyAbFgqRz/lQAAAAxUlEQVQI1zXOw5IDYQBF4fM3Ynts27bVHc9MbOf9t6l0Kl/VXZzdxaA4HLKfscCKpncTh6ijVBdbl6GI7xsEw8naCTyeXygCw3Y7EJzJFEuNecXotcngbOxsyrTT0Z0Aq9NHf27cv1fvEykPgq1afJMfNrK8NfeB+2pcAqToC0tmnHtiPW+TXiVb7gGLGXvCx24h+h8zlT9D+jHhtBW+Pu4WKgcRS9oP15r12XM711vmSXMB2FPJZL1/qiK8GLzyjSs8es8AWmUcev/cGYQAAAAASUVORK5CYII=)](https://github.com/cormas/cormas)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/cormas/seir-model/master/LICENSE)


A simple epidemiological model in which individuals are transitioning between the four states: susceptible (S) -> exposed (E) -> infectious (I) -> recovered (R).

## How to install it?

To install the image, you must first get a latest version of Cormas platform by following the instructions at [Cormas GitHub](https://github.com/cormas/cormas/blob/master/README.md) (in this experiment, we used the version [8735b99](https://github.com/cormas/cormas/tree/8735b9931b98a06913b4ecf2f6214e89bbe43a27) but more recent versions should also work).
Then open the Playground (Ctrl+OW) in your image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'REDModel';
  repository: 'github://olekscode/REDEpidemiologicalModel/src';
  load.
```

To check if installation is correct, go to the `RED-Model-Tests` package and run all the tests.

## How to use it?

There are two ways to run the simulation: using Cormas user interface (UI) and programmatically.
In this section, we describe both ways.

### Running the simulation using Cormas UI

- **Step 1.** Open Cormas by clicking on the `CORMAS` button in the top-left corner of your image.
- **Step 2.** In the top-left corner of the Cormas window, click on `File`, then `Open` to get the project-opener tool.
- **Step 3.** In the top-left corner of that tool, you will see the drop-down with `Demos` written in it. Click on the drop-down and select the `In-image` option. Then, from the `Projects` list below, select the `REDModel` and press `OK` in the bottom-right corner. This will open the project window for the selected model.
- **Step 4.** Press the `Initialize` button in the left part of the project window.
- **Step 5.** Select the `init` method of initialization. Make sure that the `step:` control method is selected. We also want to record the probes (number of exposed, number of infectious, number of recovered, and number of susceptibl). Make sure that all four probes are selected (you can select all of them by pressing `Ctrl+A` on your keyboard, or `Cmd+A` if you are using Mac). In the `Final step` field (bottom-left corner), enter the number of days during which the simulation must run. By default it's 100 but in our experiment, we run the simulation for 730 day. After entering the days, press `Ctrl+S` on your keyboard (`Cmd+S` if you are using Mac) to save the change. Then press the `Apply` button in the bottom-right corner.
- **Step 6.** In the top menu of the project window, click on the `Visualization` and then `Space`. This will open the space view. For now, it is empty, because we did not select any _"points of view"_ (PoV) yet.
- **Step 7.** In the top-left corner of the space view window, click on the `PoV` dropdown. You will see two items corresponding to the entities in our model: `REDIndividual` and `REDCell`. Hover over each item and select the `pov` option from the side menu that appears next to it. To apply your selection, close the space view window and repeat steps 4-5.
