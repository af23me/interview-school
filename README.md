# Test task for school lessons managment

## Intro

Note: *This repo was created as test task and do not used in production.*

Test task requirements was:

This application is meant to represent a school. There are teachers, subjects that they teach, and the relation between them. We want to add classrooms, students, and another model called sections. A section represents a teacher teaching a subject in a specific classroom at a specfic time with students who attend the class. Think of it like the join model between all the other entities, and with specific times. Some sections are taught only on Monday, Wednesday, and Friday, others are only taught on Tuesdays and Thursdays, and some are every day. Sections typically are 50 minutes long, but they can also be 80 minutes. The earliest sections start at 7:30am and the latest ones end at 10pm.

Goals:

* Students should be able to add/remove sections to their schedule
* A student cannot be in two sections that overlap. For instance, if I add General Chemistry to my schedule, and it's on MWF from 8:00 to 8:50am, I cannot enroll in any other sections between 8:00 and 8:50am on Mondays, Wednesdays, or Fridays.
* Students should be able to download a PDF of their schedule.
* For each section include subject, start time, end time, teacher name, and classroom name

Time constraints:

Do not spend more than 4 hours implementing the goals above. It's not mandatory that the goals above are 100% working, due to the time constraint, we're most interested in seeing your best work. Write this code as if you're contributing to a larger project with multiple developers who will critique your work. If you're running out of time and something isn't funcional yet, that's okay, make sure that whatever is functional is both complete and polished.

## Setup

Create network: `$ docker network create school_test_task`

* Before start run pg14 container `docker compose up school_test_task_database_pg15 -d`
* Create Database: `docker compose run app /bin/sh`
* Seed development database: `$ bin/rails db:create`
* Seed development database: `$ RAILS_ENV=test bin/rails db:create`
* Seed development database: `$ bin/rails db:migrate`
* Seed development database: `$ bin/rails db:seed`
* Seed development database: `$ exit`
* Run service `docker compose up`
* Open application on port `3000`

## What to improve

* Separate docker layers for fast build
* Add possibility to destroy related records without affecting UI interfaces (intorduce deleted_at and indexes on this field)
* Add pagination
* Validation Section start and end dates to be valid to each other
* Validate inclusion of weekdays
* Use decorator insted of helpers
* Fix PDF generator
* Finish Active Admin setup
* Improve test coverage