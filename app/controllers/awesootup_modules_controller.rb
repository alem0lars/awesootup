class AwesootupModulesController < ApplicationController

  def index
    @awesootup_modules = nil

    if params[:filtering] && params[:type]
      case params[:type].downcase.gsub(' ', '_').to_sym
        when :alternatives
          if params[:id]
            @awesootup_modules = (params[:strict] == 'true') ?
              AwesootupModule.find(params[:id].to_i).alternatives(true) :
              AwesootupModule.find(params[:id].to_i).alternatives
          end
        when :equally_satisfied
          if params[:id]
            @awesootup_modules = (params[:strict] == 'true') ?
              AwesootupModule.find(params[:id].to_i).equally_satisfied(true) :
              AwesootupModule.find(params[:id].to_i).equally_satisfied
          end
        when :search
          if params[:search_value]
            @awesootup_modules = AwesootupModule.search_simple(params[:search_value])
          end
        when :deep_search
          if params[:search_value]
            @awesootup_modules = AwesootupModule.search_deep(params[:search_value])
          end
      end
    end

    if @awesootup_modules.nil?
      @awesootup_modules = AwesootupModule.all
    end

  end

  def show
    @awesootup_module = AwesootupModule.find(params[:id])
  end

  def new
    @awesootup_module = AwesootupModule.new
  end

  def create
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
