class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :knowledge_base

  def knowledge_base
    @kb = KnowledgeBase
  end

end
