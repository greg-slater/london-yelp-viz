# London Yelp Visualisation
Visualisation of nightlife business opening hours data across London


### Overview

See a working version [here](https://greg-slater.github.io/yelp/).

The aim of this project is to visualise the spatial and temporal patterns of nightlife-related business opening hours in London. It was built as my contribution to a group university visualisation project with the theme 'The Pulse of the City'.

Data was collected from the Yelp API, analysed and formatted using Python. The visualisation itself was created using [P5](https://github.com/processing/p5.js), with the libraries [Mappa](https://github.com/cvalenzuela/Mappa) and [P5.gui](https://github.com/bitcraftlab/p5.gui).


### Visualisation

Through combining interactive mapping and animation the aim is to effectively show, and allow the user to explore, the different patterns in the data. A counter running through hours of the day and days of the week controls the display of a business on the map (if it is open at the current day and time it is displayed), with colours indicating the different business categories.

Users can control the speed of the time cycle, pause and play the animation, select or de-select particular business categories, and display a dynamic stacked bar chart which shows the number of businesses open over the week.

A story mode can take the user through a simple narrative which zooms to different points in London while controlling various elements in order to dempnstrate some of the clearest patterns and introduce the different functionality.
