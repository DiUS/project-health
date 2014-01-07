# project-health ![alt text](https://travis-ci.org/DiUS/project-health.png "Build Status")

## Overview
The purpose of this tool is to help generate discussions during retroscpectives. Team members can submit votes and comment on different aspects of the project such as morale, enthusiasm, management, innovation, technical debt...

### Continuous Integration
On TravisCI: https://travis-ci.org/DiUS/project-health

### Test environment
On Heroku: http://project-health-dius.herokuapp.com

### Ideas of new features
* User management
 * Authenticate using DiUS google accounts
 * Users are linked to projects they work on and can vote only once per iteration

* UI improvements
 * Have a designer to come up with a better design
 * Add icons for each indicator
 * Sliders on mobile don't work very well, we need to find a better approach
* Actions management
 * Have the possibility to add action items on the dashboard during a retro and link them to people and/or indicators
 * Display the history of actions, for how long they span (how many iterations), who is assigned to them, resolution status...
* Dashboard
 * Rework the general design
 * Display indicators trend for the last X iterations as a graph
 * Display the overall rating of the project and trend (average of all indicators)
 * Possibility to display the dashboard for previous iterations (like a < previous | next > button)
* Integration with other systems
 * Timesheet to populate projects and users assigned on projects
 * Metrics from other systems (number of commits, continuous integration status reports...)
