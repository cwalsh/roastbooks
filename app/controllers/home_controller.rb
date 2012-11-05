class HomeController < ApplicationController
  def index
    @libraries = current_user.libraries
  end
end
