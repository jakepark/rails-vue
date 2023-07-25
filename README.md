# README

# 1. Backend Database & Server Setup (Rails):



Git clone project.

Navigate to the root folder `rails_backend_api`

( Ruby version: 3.2.2 set by .ruby-version )

Shell/Terminal commands:

```
bundle install
bundle exec rake db:setup
bundle exec rails s -p 3000
```
# 2. Frontend Server Setup (Vue)

```
cd frontend/vue-rails
npm install
npm run dev -- --port 5173
```

# Seeded User Emails:

The following user emails will serve to login

user_1@utilizecore.com
user_2@utilizecore.com
user_3@utilizecore.com

# Trips with different parameters have been seeded initially

Testing different states may require resetting the local database:

```
bundle exec rake db:reset
```