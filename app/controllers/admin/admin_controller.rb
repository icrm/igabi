class Admin::AdminController < ActionController::Base
  protect_from_forgery
  include Admin::SessionsHelper
end
