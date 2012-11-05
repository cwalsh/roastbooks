class HomeController < ApplicationController
  def index
    if user_signed_in?
      @libraries = current_user.libraries
    end
  end
end
