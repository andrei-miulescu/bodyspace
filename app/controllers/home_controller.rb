class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def ember

  end
end
