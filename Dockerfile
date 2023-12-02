FROM ruby:3.1.2

RUN apt-get update -qq \
 && apt-get install -y nodejs postgresql-client npm vim \
 && rm -rf /var/lib/apt/lists/* \
 && npm install --global yarn

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Create and set the working directory
RUN mkdir /myapp
WORKDIR /myapp

# Copy Gemfiles and install dependencies
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Copy the rest of the application code
COPY . /myapp
