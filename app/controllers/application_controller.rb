class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :contributors, :awesootup_features, :awesootup_news

  def contributors
    @contributors = Contributor.all
  end

  def awesootup_features
    @awesootup_features = AwesootupFeature.all
  end

  def awesootup_news
    @awesootup_news = AwesootupNews.all
  end

  # Render 404 page
  def render_404
    @not_found_path = request.fullpath

    respond_to do |format|

      format.html do
        render 'errors/not_found', :status => 404
      end

      format.all { render :nothing => true, :status => 404 }
    end
  end

  # Render 500 page
  def render_500(exception)
    logger.info exception.backtrace.join('\n')

    respond_to do |format|

      format.html do
        render 'errors/internal_server_error', :status => 500
      end

      format.all { render :nothing => true, :status => 500 }
    end
  end

  # Handle errors
  if Rails.env.production?
    unless Rails.application.config.consider_all_requests_local
      rescue_from Exception, with: :render_500
      rescue_from ActionController::RoutingError, :with => :render_404
      rescue_from ActionController::UnknownController, :with => :render_404
      rescue_from ActionController::UnknownAction, :with => :render_404
      rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    end
  end

end
