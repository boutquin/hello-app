# Ruby On Rails 7 Tutorial Hello App

[![Ruby](https://img.shields.io/badge/Ruby-3.3.5-red.svg)](https://www.ruby-lang.org/en/)
[![Rails](https://img.shields.io/badge/Rails-7.2.1-red.svg)](https://rubyonrails.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://github.com/Boutquin/Ruby-On-Rails-7-Tutorial-Hello/actions/workflows/ci.yml/badge.svg)](https://github.com/Boutquin/Ruby-On-Rails-7-Tutorial-Hello/actions/workflows/ci.yml)
[![Docker Support](https://img.shields.io/badge/Docker-Supported-blue.svg)](https://www.docker.com/)
[![Heroku](https://img.shields.io/badge/Heroku-Deployment-blue.svg)](https://heroku.com/)
[![Discussions](https://img.shields.io/github/discussions/Boutquin/Ruby-On-Rails-7-Tutorial-Hello)](https://github.com/Boutquin/Ruby-On-Rails-7-Tutorial-Hello/discussions)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [System Requirements](#system-requirements)
- [Setup](#setup)
  - [Clone the Repository](#clone-the-repository)
  - [Install Dependencies](#install-dependencies)
  - [Database Setup](#database-setup)
  - [Run the Application](#run-the-application)
  - [Run the Tests](#run-the-tests)
  - [Deployment](#deployment)
- [CI/CD Pipeline](#cicd-pipeline)
- [Docker](#docker)
- [Tailwind CSS Integration](#tailwind-css-integration)
- [Additional Features](#additional-features)
- [Contributing](#contributing)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Overview

The **Ruby On Rails 7 Tutorial Hello App** is a simple Ruby on Rails application created by **Pierre G. Boutquin** while working through the [Ruby on Rails Tutorial](https://www.railstutorial.org) by Michael Hartl. The purpose of this project is to help developers familiarize themselves with the basics of building a Rails application and learn best practices. This "Hello App" demonstrates basic CRUD (Create, Read, Update, Delete) operations, database interactions, and the fundamental structure of a Rails project.

It serves as a foundation for further development and enhancement, making it a great starting point for both new developers learning Rails and experienced developers looking to refine their skills.

## Features

- **Ruby 3.3.5**: Built on the latest stable version of Ruby for enhanced performance and security.
- **Rails 7.2.1**: Leverages the powerful features of Rails 7, including Hotwire for real-time updates and minimal JavaScript requirements.
- **SQLite** for development and testing, with **PostgreSQL** for production.
- **Docker** support to ensure that the app can run in a consistent environment regardless of host setup.
- **GitHub Actions** for continuous integration, ensuring that tests and builds are automatically run on every push or pull request.
- **Heroku Deployment** for a quick and easy cloud deployment solution.
- **Tailwind CSS** integration for clean, modern, and responsive designs.
- **MiniTest** framework for unit testing, ensuring code correctness and robustness.
- **Yard** for automatically generating documentation from comments within your codebase.
- **GitHub Discussions**: Enabled to allow for community interaction, support, and contributions.

## System Requirements

To run this application locally or in production, ensure you have the following installed:

- **Ruby 3.3.5**: You can follow the official [Ruby installation guide](https://www.ruby-lang.org/en/documentation/installation/) to install the correct version for your system.
- **Rails 7.2.1**: [Install Rails](https://guides.rubyonrails.org/v7.0/getting_started.html#installing-rails) by running `gem install rails -v 7.2.1`.
- **Bundler**: To manage your gem dependencies, run `gem install bundler`.
- **SQLite**: Typically pre-installed on macOS and most Linux distributions. You can install it on Windows from [SQLite Downloads](https://www.sqlite.org/download.html).
- **PostgreSQL**: Ensure PostgreSQL is installed for production environments. [PostgreSQL Installation](https://www.postgresql.org/download/).
- **Heroku CLI**: [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) to interact with Heroku for deployment.
- **Docker**: [Install Docker](https://docs.docker.com/get-docker/) to use containerization for a consistent development and deployment environment.

## Setup

### Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/Boutquin/Ruby-On-Rails-7-Tutorial-Hello.git
cd Ruby-On-Rails-7-Tutorial-Hello
```

### Install Dependencies

Once inside the project directory, install the required Ruby gems using Bundler:

```bash
bundle install
```

This will install all the dependencies defined in the `Gemfile`, including Rails, the test suite, and any required database gems.

### Database Setup

For development and testing (SQLite):

```bash
rails db:create
rails db:migrate
```

For production (PostgreSQL):

Ensure your environment variables are configured for PostgreSQL in `config/database.yml`. To set up the production database on Heroku:

```bash
heroku run rails db:setup
```

### Run the Application

To start the Rails server locally, run:

```bash
rails server
```

By default, the server will run on [http://localhost:3000](http://localhost:3000). You can also specify a different port if needed, for example:

```bash
rails server -p 4000
```

### Run the Tests

This project uses MiniTest for testing. To run all tests:

```bash
rails test
```

You can also run specific test files or methods as needed, using:

```bash
rails test path/to/test_file.rb
```

Ensure all tests are passing before pushing changes or deploying to production.

### Deployment

#### Heroku Deployment

To deploy to Heroku:

1. Install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli).
2. Create a Heroku app:

   ```bash
   heroku create
   ```

3. Deploy the app by pushing to Heroku:

   ```bash
   git push heroku main
   ```

4. Set up the production database:

   ```bash
   heroku run rails db:migrate
   ```

You can now access your app via the URL provided by Heroku.

## CI/CD Pipeline

This project uses **GitHub Actions** to automate testing and ensure continuous integration. The `ci.yml` file in the `.github/workflows/` directory defines the pipeline that runs on every push and pull request.

The pipeline will:

- Install the necessary Ruby and Rails dependencies.
- Set up the database for testing.
- Run the MiniTest suite to verify the integrity of the codebase.

To view the status of the CI pipeline, refer to the build badge at the top of this `README.md` file.

## Docker

To use Docker for running the app in a containerized environment:

1. Build the Docker image:

   ```bash
   docker-compose build
   ```

2. Start the application with Docker:

   ```bash
   docker-compose up
   ```

This will run the app in a container, making it available at [http://localhost:3000](http://localhost:3000).

Docker ensures a consistent development and production environment, removing the need for complex system configurations.

## Tailwind CSS Integration

This project uses **Tailwind CSS** for front-end styling. Tailwind CSS provides a utility-first approach to styling, making it quick and easy to build responsive UIs without writing custom CSS.

If you need to add custom styles, you can modify the `app/assets/stylesheets/application.tailwind.css` file.

To compile and watch Tailwind changes in development, use:

```bash
rails tailwindcss:watch
```

## Additional Features

- **GitHub Discussions:** Engage with the project community through GitHub Discussions. [Join the discussions](https://github.com/Boutquin/Ruby-On-Rails-7-Tutorial-Hello/discussions).

## Contributing

Contributions are welcome! To contribute, please follow these steps:

1. **Fork the Repository.**
2. **Create a New Branch:**

    ```bash
    git checkout -b feature/YourFeature
    ```

3. **Commit Your Changes:**

    ```bash
    git commit -m "Add YourFeature"
    ```

4. **Push to the Branch:**

    ```bash
    git push origin feature/YourFeature
    ```

5. **Open a Pull Request.**

Please ensure your code adheres to the project's coding standards and that all tests pass before submitting a pull request.

## Acknowledgements

- **Michael Hartl:** Special thanks to Michael Hartl for his excellent [Ruby on Rails 7 Tutorial](https://www.railstutorial.org), which provided the foundation for this project.

Other resources and tools used in this project include:

- [Ruby](https://www.ruby-lang.org/en/)
- [Ruby on Rails](https://rubyonrails.org/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Docker](https://www.docker.com/)
- [Heroku](https://www.heroku.com/)
- [GitHub Actions](https://github.com/features/actions)

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

---

Developed by **Pierre G. Boutquin** while working through the [Ruby on Rails 7 Tutorial](https://www.railstutorial.org) by [Michael Hartl](https://www.michaelhartl.com/).
