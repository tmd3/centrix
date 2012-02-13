require 'digest/sha1'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  
  # return whether username and password are authentic
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
         (user = User.find_by_name(username)) != nil \
      && user.password == Digest::SHA1.hexdigest(password)
    end
  end
end
