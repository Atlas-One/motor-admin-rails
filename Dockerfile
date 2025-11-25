# Use Ruby 3.3.1 as base image
FROM ruby:3.3.1-slim

# Install system dependencies in a single layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libsqlite3-dev \
    libmariadb-dev-compat \
    curl \
    git \
    openssh-client \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure Git to use HTTPS instead of SSH for GitHub
RUN git config --global url."https://github.com/".insteadOf "ssh://git@github.com/"

# Set working directory
WORKDIR /app

# Copy and install Ruby dependencies first (for better caching)
COPY Gemfile* ./
COPY motor-admin.gemspec ./
COPY lib/motor/version.rb ./lib/motor/
RUN bundle config set --local deployment 'false' \
    && bundle config set --local path 'vendor/bundle' \
    && bundle install --jobs $(nproc) --retry 3

# Copy and install Node.js dependencies
COPY ui/package.json ui/yarn.lock* ./ui/
RUN cd ui && yarn install --frozen-lockfile --production=false

# Copy the rest of the application
COPY . .

# Expose port 3000
EXPOSE 3000

# Default command (can be overridden by docker-compose)
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
