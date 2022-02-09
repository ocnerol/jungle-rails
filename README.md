# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

# Screenshots
#### Homepage
!["A view of the homepage, where all products are shown to the user."](https://github.com/ocnerol/jungle-rails/blob/main/docs/Home_page.png?raw=true)
#### Single Product View
!["A view of a page for a single product."](https://github.com/ocnerol/jungle-rails/blob/main/docs/Single_Product.png?raw=true)
#### Visitor's Cart
!["A view of a cart with three distinct products added."](https://github.com/ocnerol/jungle-rails/blob/main/docs/Cart.png?raw=true)
#### Visitor's Order Confirmation
!["A view of an order confirmation."](https://github.com/ocnerol/jungle-rails/blob/main/docs/Order.png?raw=true)


## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars (found on your Stripe account info)
8. Starting the server: If you are running the server from a virtual machine, run `bin/rails s -b 0.0.0.0`. Otherwise, run `bin/rails s`.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt 3.1.7
* Bootstrap-sass 3.3.6
* Byebug
* Capybara
* Carrierwave
* Database_cleaner
* Dotenv-rails
* Faker
* Font-awesome-rails
* jbuilder (~> 2.0)
* jQuery-rails
* Money-rails
* Newrelic_rpm
* Poltergeist
* Puma
* Quiet_assets
* Rails_12factor
* rmagick
* rSpec-rails (~> 3.5)
* SASS-rails (~> 5.0)
* sdoc (~> 0.4.0)
* Spring
* turbolinks
* Uglifier (>= 1.3.0)
* Web-console (~> 2.0)