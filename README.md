# Project: Private Events - Associations


This is part of the Associations Project of The Odin Project’s Ruby on Rails Curriculum, Following [here](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations).

This project uses devise gem to create the authentication in Ruby on Rails. It is recommended that you to use it because it's the easiest way to implement complete authentication, highly customizable with tons of great features.


## Built with

- Ruby on Rails
- Devise

## Linters

- Rubocop
- Stylelint

## Getting Started

Follow the steps below to get a local copy running:

### Install
- To run this project on the local computer, you need to install Ruby on Rails.
    - For Windows users, visit [Ruby Installer](https://rubyinstaller.org/)
    - For MacOS and Linux users, visit the [Ruby Official Site](https://www.ruby-lang.org/en/downloads/) for instructions.
- Then clone the project by typing `git clone https://github.com/omar-labana/private-event.git`.

### Run App
- Type `bundle install` in the root directory of the project.
- Type `rails db:create` in the root directory of the project to create the database.
- Type `rails db:migrate` in the root directory of the project to migrate the database.
- Type `rails server` in the root directory of the project.
- Open a browser, navigate to `http://localhost:3000`

### Notice

If you have an error promting: 

**"Webpacker::Manifest::MissingEntryError in ..."**

Type in the terminal `rails webpacker:install` in the root directory of the project to fix it.


