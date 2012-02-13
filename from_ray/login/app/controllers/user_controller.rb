class UserController < ApplicationController

  def greeting
    # extract username from BasicAuth token
    username = ActionController::HttpAuthentication::Basic.user_name_and_password(request)[0]
    @user = User.find_by_name(username)
    render 'greeting'
  end

end
