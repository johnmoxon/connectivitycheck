# Use a base image with Ruby pre-installed
FROM ruby:2.7

# Set the working directory inside the container
WORKDIR /app

# Copy the Ruby script to the container
COPY connectivitycheck.rb .

# Install any dependencies required by the script (if applicable)
# For example, if you use bundler, uncomment the next two lines:
# COPY Gemfile .
# RUN bundle install

EXPOSE 80

# Specify the command to run when the container starts
CMD ["ruby", "connectivitycheck.rb"]
