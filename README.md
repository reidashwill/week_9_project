# Project Tracker



#### By Reid Ashwill

## Description

This app allows the user to create projects, and volunteers assigned to them.

## Specs

1   User can create instances of the Project class
2   User can save instances of the Project class to a pqsl database
3   User can update instances of the Project class
4   User can delete instances of the Project class
5   User can list and view instances of the Project class
6   User can list all Instances of volunteer class belonging to an instance of Project class

7   User can create instaces of Volunteer class
8   User can save instances of Volunteer class
9   User can update instances of Volunteer class
10  User can list and view instances of the Volunteer class


## User Stories

As a non-profit employee, I want to view, add, update and delete projects.

As a non-profit employee, I want to view and add volunteers.

As a non-profit employee, I want to add volunteers to a project.


## Setup/Installation Requirements

* _Navigate to https://github.com/reidashwill/week_9_project_
* _clone the respository to your local machine_
* _navigate to the cloned directory and open in your text editor of choice to view code_
* _run the command 'rspec' to run the suite of tests included_
* _run the rommand "ruby app.rb" to open the app in sinatra_
* _navigate your browser of choice to localhost:{whatever address sinatra is performing on.  usually 4567}_




## Known Bugs
Heroku deployment is not working as of right now.  I think this is due to something that i saw in the logs but do not fully understand.  Their bundler is working on port 5000, and sinstra is performing locally on a different port.  

The log also states there are routing issues due to favicon.  I ran into an issue with this using NPM during team week, but this seems differnt.


## Technologies Used

* _Ruby_
* _Rspec_
* _Capybara_
* _Sinatra_
* _HTML (erb)_
* _Bootstrap_

### License

*Licensed under the MIT license*

Copyright (c) 2020 **_Reid Ashwill_**