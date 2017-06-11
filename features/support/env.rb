require 'cucumber/rails'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
ActionController::Base.allow_rescue = false
begin
    DatabaseCleaner.strategy = :transaction
    rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
    u = User.new(first_name: "Bruno", last_name:"Barbosa", cpf:"04771475423", email:"brunobt94@gmail.com")
    u.save
end
