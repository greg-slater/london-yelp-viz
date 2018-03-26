# london_yelp_viz
Visualisation of yelp business hours data across London


### Overview

This is a basic proof of concept of visualising data grabbed from the [Yelp API](https://www.yelp.com/developers/documentation/v3) using some python code.

The Search endpoint was used to find all music venues in the London area, and then those venues used to query the Business Lookup endpoint to grab opening hours for each.

Data was then re-formatted into a useable JSON file (see [/data folder](https://github.com/greg-slater/london_yelp_viz/tree/master/data)) for Processing.

The Processing sketch simply runs through days of the week and hours of the day, lighting up venues on a map background when the venue is open.

The aim is to show the 'pulse' like pattern of activity, and to that end a dynamic line chart at the bottom tracks the total number of venues open in heart-rate monitor style.


### Demo

The London.mov file demonstrates one cycle. Possible further development will be adding in different business categories and possibly turning into a grid-like comparison of patterns across different global cities.

London.png is just a screengrab.
