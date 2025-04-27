# todo-api-rails

This is a ToDo Web API implemented with Ruby on Rails, designed for simplicity and extensibility.

## Tech Stack

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![RubyGems](https://img.shields.io/badge/RubyGems-E9573F.svg?style=for-the-badge&logo=RubyGems&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![RSpec](https://img.shields.io/badge/RSpec-FF0000.svg?style=for-the-badge&logo=RSpec&logoColor=white)
![Rubocop](https://img.shields.io/badge/Rubocop-000000.svg?style=for-the-badge&logo=Rubocop&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

### Programming Languages
- [Ruby](https://www.ruby-lang.org/) v3.2 - Primary development language

### Backend
- [Ruby on Rails](https://rubyonrails.org/) v7.1 - Web application framework
- [Active Record](https://guides.rubyonrails.org/active_record_basics.html) - ORM framework

### Database
- [MySQL](https://www.mysql.com/) v8.0 - Primary relational database
- [PostgreSQL](https://www.postgresql.org/) v16 - Alternative relational database

### Development Environment
- [RubyGems](https://rubygems.org/) - Ruby package manager
- [Docker](https://www.docker.com/) with Compose v3.9 - Containerization platform for building and managing applications

### Testing & Quality Assurance
- [RSpec](https://rspec.info/) v3.12 - Testing framework
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) v0.22.0 - Code coverage tool
- [Rubocop](https://rubocop.org/) v1.60.0 - Ruby linter and formatter

### CI/CD
- GitHub Actions - Continuous Integration and Deployment

## Setup
### Initial Setup
1. Clone this repository:
    ```
    $ git clone https://github.com/kenwoo9y/todo-api-rails.git
    $ cd todo-api-rails
    ```

2. Build the required Docker images:
    ```
    $ make build-local
    ```

3. Start the containers:
    ```
    $ make up
    ```

4. Apply database migrations:
    ```
    $ make migrate
    ```

## Usage
### Container Management
- Check container status:
    ```
    $ make ps
    ```
- View container logs:
    ```
    $ make logs
    ```
- Stop containers:
    ```
    $ make down
    ```

## Development
### Running Tests
- Run tests:
    ```
    $ make test
    ```

### Code Quality Checks
- Lint check:
    ```
    $ make lint-check
    ```
- Apply lint fixes:
    ```
    $ make lint-fix
    ```

## Database
### Switching Database
1. Edit `api/.env` file:

For MySQL:
```
DB_TYPE=mysql
DB_HOST=mysql-db
DB_PORT=3306
DB_NAME=todo
DB_USER=<your_username>
DB_PASSWORD=<your_password>
```

For PostgreSQL:
```
DB_TYPE=psql
DB_HOST=postgresql-db
DB_PORT=5432
DB_NAME=todo
DB_USER=<your_username>
DB_PASSWORD=<your_password>
```

2. Rebuild and restart the application:
```
$ make build-local
$ make up
$ make migrate
```

### Database Access
- Access MySQL database:
    ```
    $ make mysql
    ```
- Access PostgreSQL database:
    ```
    $ make psql
    ```
