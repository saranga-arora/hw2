# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model

# ran 'rails generate model Movie' 
# updated new migrate file
# ran 'rails db:migrate' 

# ran 'rails generate model Person' 
# updated new migrate file
# ran 'rails db:migrate'

# ran 'rails generate model Role' 
# updated new migrate file
# ran 'rails db:migrate'

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.

#Add people data
actor = Person.new 
actor.name = "Christian Bale"
actor.save

actor = Person.new 
actor.name = "Michael Caine"
actor.save

actor = Person.new 
actor.name = "Liam Neeson"
actor.save

actor = Person.new 
actor.name = "Katie Holmes"
actor.save

actor = Person.new 
actor.name = "Gary Oldman"
actor.save

actor = Person.new 
actor.name = "Heath Ledger"
actor.save

actor = Person.new 
actor.name = "Aaron Eckhart"
actor.save

actor = Person.new 
actor.name = "Maggie Gyllenhaal"
actor.save

actor = Person.new 
actor.name = "Tom Hardy"
actor.save

actor = Person.new 
actor.name = "Joseph Gordon-Levitt"
actor.save

actor = Person.new 
actor.name = "Anne Hathaway"
actor.save

actor = Person.new 
actor.name = "Christopher Nolan"
actor.save

#Add movie data
christopher = Person.where({name: "Christopher Nolan"})[0]

movie = Movie.new 
movie.title = "Batman Begins"
movie.year_released = 2005
movie.rated = "PG-13"
movie.director_id = christopher.id
movie.save 

movie = Movie.new 
movie.title = "The Dark Knight"
movie.year_released = 2008
movie.rated = "PG-13"
movie.director_id = christopher.id
movie.save 

movie = Movie.new 
movie.title = "The Dark Knight Rises"
movie.year_released = 2012
movie.rated = "PG-13"
movie.director_id = christopher.id
movie.save 

#Add role data
batmanbegins = Movie.where({title: "Batman Begins"})[0]
darkknight = Movie.where({title: "The Dark Knight"})[0]
darkknightrises = Movie.where({title: "The Dark Knight Rises"})[0]

christian = Person.where({name: "Christian Bale"})[0]
michael = Person.where({name: "Michael Caine"})[0]
liam = Person.where({name: "Liam Neeson"})[0]
katie = Person.where({name: "Katie Holmes"})[0]
gary = Person.where({name: "Gary Oldman"})[0]
heath = Person.where({name: "Heath Ledger"})[0]
aaron = Person.where({name: "Aaron Eckhart"})[0]
michael = Person.where({name: "Michael Caine"})[0]
maggie = Person.where({name: "Maggie Gyllenhaal"})[0]
tom = Person.where({name: "Tom Hardy"})[0]
joseph = Person.where({name: "Joseph Gordon-Levitt"})[0]
anne = Person.where({name: "Anne Hathaway"})[0]

role = Role.new 
role.movie_id = batmanbegins.id 
role.actor_id = christian.id 
role.character_name = "Bruce Wayne"
role.save 

role = Role.new 
role.movie_id = batmanbegins.id 
role.actor_id = michael.id 
role.character_name = "Alfred"
role.save 

role = Role.new 
role.movie_id = batmanbegins.id 
role.actor_id = liam.id 
role.character_name = "Ra's Al Ghul"
role.save 

role = Role.new 
role.movie_id = batmanbegins.id 
role.actor_id = katie.id 
role.character_name = "Rachel Dawes"
role.save 

role = Role.new 
role.movie_id = batmanbegins.id 
role.actor_id = gary.id 
role.character_name = "Commissioner Gordon"
role.save

role = Role.new 
role.movie_id = darkknight.id 
role.actor_id = christian.id 
role.character_name = "Bruce Wayne"
role.save

role = Role.new 
role.movie_id = darkknight.id 
role.actor_id = heath.id 
role.character_name = "Joker"
role.save 

role = Role.new 
role.movie_id = darkknight.id 
role.actor_id = aaron.id 
role.character_name = "Harvey Dent"
role.save

role = Role.new 
role.movie_id = darkknight.id 
role.actor_id = michael.id 
role.character_name = "Alfred"
role.save

role = Role.new 
role.movie_id = darkknight.id 
role.actor_id = maggie.id 
role.character_name = "Rachel Dawes"
role.save

role = Role.new 
role.movie_id = darkknightrises.id 
role.actor_id = christian.id 
role.character_name = "Bruce Wayne"
role.save

role = Role.new 
role.movie_id = darkknightrises.id 
role.actor_id = gary.id 
role.character_name = "Commissioner Gordon"
role.save

role = Role.new 
role.movie_id = darkknightrises.id 
role.actor_id = tom.id 
role.character_name = "Bane"
role.save

role = Role.new 
role.movie_id = darkknightrises.id 
role.actor_id = joseph.id 
role.character_name = "John Blake"
role.save

role = Role.new 
role.movie_id = darkknightrises.id 
role.actor_id = anne.id 
role.character_name = "Selina Kyle"
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
for movie in Movie.all 
    director = Person.where({id: movie.director_id})[0]
    puts " %-27s %-10s %-10s %-15s" % [movie.title, movie.year_released, movie.rated, director.name]
end 

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through results to display the cast output for each movie
for movie in Movie.all 
    for role in movie.roles
        actor = Person.where({id: role.actor_id})[0]
        puts "%-25s %-25s %-25s" % [movie.title, actor.name, role.character_name]
    end 
end