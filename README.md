# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. This is a 'completed' version after completing Lighthouse Labs' activities to improve the usability and functionality of the application.

## Features

Implemented/improved features: (as compared to the [template](https://github.com/tai-de/jungle-rails#:~:text=lighthouse%2Dlabs/jungle%2Drails))

### Basic functionality

* About Us page created
* "Sold Out" badge on product cards/display page
* Empty cart banner / hide actual cart table if 0 items present
* Order details displays product info/quantity/etc
* Price info aligned with correct formatting
* User authentication implemented

### Admin functionality

* HTTP basic authentication prevents access to Admin interface (credentials set up in .env file)
* Admin Dashboard displays category/product/inventory counts
* Admins can create new categories for products

### Testing / specs integration

* RSpec model tests
* Cypress user tests

## Screenshots

!["Jungle home"](/screenshots/jungle_home.png)
!["Jungle products"](/screenshots/jungle_products.png)
!["Jungle order"](/screenshots/jungle_order.png)
!["Jungle admin dash"](/screenshots/jungle_admin.png)
!["Jungle admin products"](/screenshots/jungle_admin_products.png)
!["Jungle admin new"](/screenshots/jungle_admin_new.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
