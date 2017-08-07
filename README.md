## Paytm-Challenge

Using Ruby on Rails for this challenge, since RoR provides a easy to setup web framework. It reduces the time to setup database connections, redis cache store, etc.

* Dependencies
  - redis
  - postgresql

### Setup

```
rails db:create
rails db:migrate
rails s
```
### Run
- API docs are under http://localhost:3000/docs
- Examples (using `postman` Google extension):
  - Hello World
  ```
  GET http://localhost:3000/helloworld
  ```
  
  - Create user
  ```
  POST http://localhost:3000/users

  Body:
  {"user":{"name": "test", "email":"123456@GMail.com","password":"123","password_confirmation":"123"}}
  ```
  
  - Update user's password
  ```
  PUT http://localhost:3000/users/1

  Body:
  {"user":{"password":"123","password_confirmation":"123"}}
  
  Headers:
  Content-Type:application/json
  Authorization:eyJ0eXCJhbGciOiJIUzI1NiJ9eyJ1c2VyXAiOjE1MDIyMDk2NTh9fngwKMY4WDQWdA9faMWl2LP185NslJO4
  ```
  
  - Login user
  ```
  POST http://localhost:3000/login

  Body:
  {"email":"12345@gmail.com","password":"123"}
  ```
  
  - Search twitter
  ```
  GET http://localhost:3000/search?keyword=test&size=3
  
  Headers:
  Content-Type:application/json
  Authorization:eyJ0eXCJhbGciOiJIUzI1NiJ9eyJ1c2VyXAiOjE1MDIyMDk2NTh9fngwKMY4WDQWdA9faMWl2LP185NslJO4
  ```
  
  - Search histories
  ```
  GET http://localhost:3000/histories
  
  Headers:
  Content-Type:application/json
  Authorization:eyJ0eXCJhbGciOiJIUzI1NiJ9eyJ1c2VyXAiOjE1MDIyMDk2NTh9fngwKMY4WDQWdA9faMWl2LP185NslJO4
  ```

### Test

```
rspec
```
