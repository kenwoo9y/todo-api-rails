FROM ruby:3.2

# Install required packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Create working directory
WORKDIR /app/api

# Copy Gemfile and Gemfile.lock first (for cache efficiency)
COPY ./api/Gemfile ./Gemfile
COPY ./api/Gemfile.lock ./Gemfile.lock

# Install bundler and resolve dependencies
RUN gem install bundler && bundle install

# Copy other files
COPY ./api .

# Expose port 3000
EXPOSE 3000

# Server startup command
CMD ["rails", "server", "-b", "0.0.0.0"]
