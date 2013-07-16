class HomepagesController < ApplicationController

  def show
    entries = Dir.entries Rails.root.join('app', 'views', 'homepages', 'show')
    homepage_name = entries.include?(params[:name]) ? params[:name] : 'full'
    render "homepages/show/#{homepage_name}"
  end

end
