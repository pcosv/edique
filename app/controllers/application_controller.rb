class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authenticate_user
  protect_from_forgery with: :exception
end
