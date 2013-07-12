class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :contributors, :awesootup_features, :awesootup_news

  before_filter :current_user

  helper_method :logged_in?
  helper_method :current_user
  helper_method :current_service

  # { common queries

  def contributors
    @contributors = Contributor.all
  end

  def awesootup_features
    @awesootup_features = AwesootupFeature.all
  end

  def awesootup_news
    @awesootup_news = AwesootupNews.all
  end

  # }

  # { errors handling

  # render 404 page
  def render_404
    @not_found_path = request.fullpath

    respond_to do |format|

      format.html do
        render 'errors/not_found', :status => 404
      end

      format.all { render :nothing => true, :status => 404 }
    end
  end

  # render 500 page
  def render_500(exception)
    logger.info exception.backtrace.join('\n')

    respond_to do |format|

      format.html do
        render 'errors/internal_server_error', :status => 500
      end

      format.all { render :nothing => true, :status => 500 }
    end
  end

  # handle errors
  if Rails.env.production?
    unless Rails.application.config.consider_all_requests_local
      rescue_from Exception, with: :render_500
      rescue_from ActionController::RoutingError, :with => :render_404
      rescue_from ActionController::UnknownController, :with => :render_404
      rescue_from ActionController::UnknownAction, :with => :render_404
      rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    end
  end

  # }

  protected

    # the default redirection path for the current controller
    def redirect_path
      :root
    end

    # { authentication utilities

    # @return [User] the current user logged in, or nil
    def current_user
      @current_user ||= User.find(session[:user_id]) if session.has_key?(:user_id)
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end

    # @return [Service] the service used by the current user to login, or nil
    def current_service
      if session.has_key?(:service_id)
        @current_service ||= Service.where(user_id: session[:user_id], id: session[:service_id]).first
      end
    rescue ActiveRecord::RecordNotFound
      session[:service_id] = nil
    end

    # @return [Boolean] true if an user is logged in, or false
    def current_user?
      !!current_user
    end

    # alias for ApplicationController#current_user?
    # @see ApplicationController#current_user?
    def logged_in?
      current_user?
    end

    def authenticate_user!
      if session.has_key?(:user_id)
        current_user
      else
        redirect_to redirect_path
      end
    end

    # perform a logout
    def logout!
      @current_user = nil
      reset_session
    end

    # }

end
