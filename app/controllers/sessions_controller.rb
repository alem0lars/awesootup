class SessionsController < ApplicationController

  def destroy
    logout!
    redirect_to root_url
  end

end
