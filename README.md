# Bookmark Manager #

Welcome! This is a bookmark manager web app coded with Ruby, Sinatra, HTML & CSS, and PostgreSQL. It was built Test-First, using RSpec and Capybara.

# Plans (User Stories + Domain Models) #

```
As a user,
So that I can see pages that I have saved,
I would like to have a list of bookmarks displayed to me.
```
![First User Story - Domain Model](https://github.com/jai-jk/bookmark-manager/blob/main/domain-model-1.svg)

# How To Use #

To work with the database for the bookmarks, the superuser needs to set it up from scratch. Here's how:
1. Connect to ```psql```
2. Create the database with said ```psql``` commmand:
  ```CREATE DATABASE bookmark_manager;```
3. Connect to the database using the ```psql``` command:
  ```\c bookmark_manager;```
4. Run the query listed in the ```01_create_bookmarks_table.sql``` file.

You can then run the web app with this command:
```rackup -p 4567```

You can view bookmarks by visiting 'localhost:4567/bookmarks'.
