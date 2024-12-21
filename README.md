# Simple Blog API

## Overview
The **Simple Blog API** is a RESTful API that provides basic functionalities for a blogging platform. It supports user authentication, CRUD operations for posts, likes management, pagination, and search functionality.

## Features

- **User Authentication**:
  - Users can sign up and log in to access protected features.
  - Token-based authentication using JSON Web Tokens (JWT).
- **CRUD Operations for Posts**:
  - Create, read, update, and delete blog posts.
  - Only authenticated users can create, update, or delete posts.
  - Unauthenticated users can view posts.
- **Likes Management**:
  - Authenticated users can like and unlike posts.
- **Pagination**:
  - Supports pagination to limit the number of posts returned in a single request.
- **Search Functionality**:
  - Users can search for posts by title or content.

## Prerequisites

Ensure you have the following installed on your system:

- Ruby 3.x
- Rails 7.x
- PostgreSQL
- Bundler

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/Harris-Jo/simple_blog_api.git
   cd simple_blog_api
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Configure the database:
   - Update the `config/database.yml` file with your PostgreSQL credentials.
   - Run the following commands:
     ```bash
     rails db:create
     rails db:migrate
     ```

4. Start the server:
   ```bash
   rails server
   ```

5. Access the API at `http://localhost:3000`.

## API Endpoints

### User Endpoints

- **Signup**: `POST /signup`
  - Request Body:
    ```json
    {
      "user": {
        "name": "Harris Joshua",
        "email": "harrisjo1810@gmail.com",
        "password": "abc@123",
        "password_confirmation": "abc@123"
      }
    }
    ```

- **Login**: `POST /login`
  - Request Body:
    ```json
    {
      "email": "harrisjo1810@gmail.com",
      "password": "abc@123"
    }
    ```

### Post Endpoints

- **Create Post**: `POST /posts`
  - Requires authentication.
  - Request Body:
    ```json
    {
      "post": {
        "title": "My First Post",
        "content": "This is the content of my first post."
      }
    }
    ```

- **View Posts**: `GET /posts`
  - Optional Query Parameters: `page` (for pagination), `query` (for search).

- **View Post by ID**: `GET /posts/:id`

- **Update Post**: `PATCH /posts/:id`
  - Requires authentication and ownership of the post.

- **Delete Post**: `DELETE /posts/:id`
  - Requires authentication and ownership of the post.

### Like Endpoints

- **Like Post**: `POST /posts/:post_id/likes`
  - Requires authentication.

- **Unlike Post**: `DELETE /posts/:post_id/likes`
  - Requires authentication.

## Middleware

- Rate limiting for login attempts to prevent brute-force attacks.

## Future Improvements

- Implement more comprehensive tests for the application.
- Add role-based access control (e.g., admin users).
- Enhance error handling and logging mechanisms.
- Add support for image uploads to posts.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

