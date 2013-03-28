class HomepagesController < ApplicationController

  def show
    homepage_name = params[:name] or 'full'
    render "homepages/show/#{homepage_name}"
  end

end
