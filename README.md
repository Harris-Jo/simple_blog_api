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
- SQLite
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
   - Update the `config/database.yml` file.
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


## Signup Proof
<img width="632" alt="signup-proof" src="https://github.com/user-attachments/assets/80eee3c2-42b6-424a-9f19-f9852d34eacf" />

## Login Proof
<img width="642" alt="login_proof" src="https://github.com/user-attachments/assets/236b961f-c50b-4eca-817c-8bc43c07c688" />

## Error Handling Proof
<img width="641" alt="error_handling_proof" src="https://github.com/user-attachments/assets/8fd86cca-0644-4605-a63d-3213bccfc385" />

## Create Post Proof
<img width="643" alt="create_post_proof" src="https://github.com/user-attachments/assets/2322193c-8a31-4be1-99d3-19c0cc35c30b" />

## Update Post Proof
<img width="633" alt="update_post_proof" src="https://github.com/user-attachments/assets/48fda993-3ee3-414c-a1b9-14594625bba2" />

## Cannot Delete Other User's Post Proof
<img width="650" alt="cannot_delete_other_user's_post_proof" src="https://github.com/user-attachments/assets/d62d3313-d3bb-4bc3-a4a9-d3b3b0da58ef" />

## Delete Post Proof
<img width="661" alt="delete_post_proof" src="https://github.com/user-attachments/assets/8f59e726-77d9-47e9-99b7-3ea022814ed3" />

## Read Post Proof
<img width="651" alt="read_posts_proof" src="https://github.com/user-attachments/assets/451d294c-4e72-4634-a201-5cf67e836001" />

## Like Post Proof
<img width="647" alt="like_post_proof" src="https://github.com/user-attachments/assets/85f664c5-ce1f-4b31-a8e9-0d09aff651ab" />

## Search Post Proof
<img width="639" alt="search_post_proof" src="https://github.com/user-attachments/assets/5ecb322b-81d9-483a-833f-257bba0f2e4a" />








