# SwissTournament

This project selects a winner or winners based on the Swiss system tournament.

## Dependencies:
  The project was written in python (2.7.6)
  The database used was PostgreSQL (9.3.13)
  You will also need Vagrant, so it is necessary to have virtual box and vagrant installed.
  To learn more about vagrant go to https://www.vagrantup.com/about.html

## How to run:

  - Download the repository
  - Type the command "vagrant up" to initialize
  - Type "vagrant ssh" to connect to the virtual machine
  - The project files will be found in /vagrant/tournament
  - Type "psql" in the command line to enter PostreSQL shell
  - Execute the command "\i tournament.sql" to create the database, tables and views of the project
