# ABC Drive

![Ruby](https://img.shields.io/badge/Ruby-3.1.2-red) ![Rails](https://img.shields.io/badge/Rails-7.0.4-blue)

<!-- Brief description goes here -->
ABC Drive is a web application that allows users to upload and share files with their friends. It is built with Ruby on Rails and uses SQLite as the database.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)

## Installation

Follow the steps below to set up your development environment:

### 1. Install rbenv

rbenv allows you to easily switch between multiple versions of Ruby. Follow the [installation instructions](https://github.com/rbenv/rbenv?tab=readme-ov-file#installation) provided by the rbenv GitHub repository.

### 2. Install Ruby 3.1.2 Using rbenv

Open your terminal and run the following command to install Ruby version 3.1.2:

```bash
rbenv install 3.1.2
```

### 3. Navigate to the Repository Directory

Change to your project's directory:

```bash
cd path/to/your/repo
```

### 4. Set Ruby Version Locally

Configure your project to use Ruby 3.1.2 by setting the local Ruby version:

```bash
rbenv local 3.1.2
```

### 5. Install Bundler Version 2.4.8

Install the specified version of Bundler:

```bash
gem install bundler -v 2.4.8
```

### 6. Install Project Dependencies

Use Bundler to install the required gems:

```bash
bundle _2.4.8_ install
```

### 7. Run Database Migrations

Migrate your database to the latest version:

```bash
bin/bundle exec rails db:migrate
```

### 8. Start the Rails Server

Launch your Rails application:

```bash
rails s
```

## Usage

Follow the steps below to effectively use ABC Drive:

1. **Access the Application**

   Open your web browser and navigate to [http://localhost:3000/](http://localhost:3000/).

2. **Create an Account**

   Click on the "Sign Up" button and provide the necessary information to create a new account.

3. **Log In**

   After registering, log in using your credentials.

4. **Upload Files**

   Once logged in, give your file a name and description and click on the "Upload" button to select and upload files from your device.

5. **Share Files**

   After uploading, you can share your files with friends by copying the short link provided.

6. **Download Files**

   Click on the download button and the file will be downloaded to your device.

7. **Delete Files**

   Click on the delete button and the file will be deleted from the database.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/YourFeature`.
3. Commit your changes: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin feature/YourFeature`.
5. Open a pull request.
