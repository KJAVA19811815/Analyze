# Analyze Project

1. Analyze is a full stack web project
2. It allows you to create a simple survey with question and choices and allows
   user to answer the surveys after logging in.
3. You can later see how different users answered questions by their profile, in this project you can check by gender and age group
4. Search by 'male', 'female', 'young', 'middle', 'old' since I am using constants.
5. Register broke i am working on it login using s@s, shawna or c@c, carlos.

## Getting Started

1. Fork this repository, then clone your fork of this repository.
2. Install dependencies using the `bundle install` command.
3. Start the web server using the `rails s or bin/rails s -b 0.0.0.0(if in vagrant) ` command. The app will be served at <http://localhost:3000/>.
4. Go to <http://localhost:8080/> in your browser.

## Dependencies(other than default)

gem 'rails', '4.2.6'
gem 'bcrypt', '~> 3.1.7'

gem 'survey', '~> 0.1'

gem 'pg'

gem 'chart-js-rails'

gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'autoprefixer-rails'

gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


## Screenshots

!["Screenshot of home page"](https://github.com/KJAVA19811815/analyze/blob/master/docs/home.png)
!["Screenshot of login page"](https://github.com/KJAVA19811815/analyze/blob/master/docs/login.png)
!["Screenshot of survey creation page"](https://github.com/KJAVA19811815/analyze/blob/master/docs/survey.png)
!["Screenshot of answer"](https://github.com/KJAVA19811815/analyze/blob/master/docs/answer.png)
!["Screenshot of searchbar page"](https://github.com/KJAVA19811815/analyze/blob/master/docs/search.png)
