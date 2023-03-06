# Setup
You can setup this repository by following this manual

You will also need to clone the frontend repository

    git clone git@github.com:Iank-code/Task-Manager.git
    cd Task-Manager
    npm install

## Clone the repository
    git clone git@github.com:Iank-code/phase-3-sinatra-react-project.git
Ensure the ruby gems are setup in your machine

    bundle install
Perform any pending database migrations

    rake db:migrate
## Run the application
rake start
Open the application from your browser
http://localhost:9292
Application
This application is a simple web API that allows users to:

  - Register a new account.

  - Log in to existing account.

  - Create TODO items.

  - Update individual TODO items.

  - View all TODO items.

  - Filter TODO items by status.

  - Delete a TODO item.



Sinatra backend API, where a user can:

- **Create** a new todo
- **Read** a list of all todos
- **Update** an individual todo
- **Delete** a todo

A `Todo` can be tagged with a `Category`, so that each todo _belongs to_ a
category and each category _has many_ todos.

## Getting Started

### Backend Setup

This repository has all the starter code needed to get a Sinatra backend up and
running. [**Fork and clone**][fork link] this repository to get started. Then, run
`bundle install` to install the gems.

**Important**: Be sure you fork a copy of the repo into your GitHub account
before cloning it. You can do this by using the link above or by clicking the
"Octocat" button at the top of this page, then clicking "Fork" in the upper
right corner of the repo page.

[fork link]: https://github.com/learn-co-curriculum/phase-3-sinatra-react-project/fork

The `app/controllers/application_controller.rb` file has an example GET route
handler. Replace this route with routes for your project.

You can start your server with:

```console
$ bundle exec rake server
```

This will run your server on port
[http://localhost:9292](http://localhost:9292).
ROUTES

1. / - Presents a simple welcome message.

2. /register - Create a new user account.

## REQUEST BODY
    {
    "name": "John Doe",
    "email": "mail@mail.com",
    "password": "12345678",
    "confirm password": "12345678",
    "phone_number": "0712345678"
    }

3. /credentials - Log in a user using email and password.

## REQUEST BODY
    {
    "email": "mail@mail.com",
    "password": "12345678"
    }

4. /post - Add a new TODO item.

## REQUEST BODY
  {
  "name": "Make Breakfast",
  "description": "Prepare milk and cereal",
  "category": "meak"
  }

5. /all - List all TODO items.

## RESPONSE SAMPLE
    {
      [
        {id: 2, name: 'last', description: 'esgdh', category_id: 2, created_at: '2023-03-05T19:49:48.112Z', …},

        {id: 1, name: 'first', description: 'sgdgf', category_id: 1, created_at: '2023-03-05T19:49:19.600Z', …}
      ],
    "message": "SUCCESS"
    }
6. /patch/:id - Update an existing TODO.

7. /delete/:id - Delete a TODO item.
