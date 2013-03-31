class ContributesController < ApplicationController

  def show
    if %w(website guides modules).include?(params[:id])
      render "contributes/show/#{params[:id]}"
    else
      render_404
    end
  end

end
