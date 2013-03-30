class AwesootupModulesController < ApplicationController

  def index
    if params[:filtering] && params[:type]
      case params[:type].to_sym
        when :alternatives
          if params[:id]
            params[:id] = params[:id].to_i
            params[:strict] = params[:strict] == 'true'
            if params[:strict]
              @awesootup_modules = AwesootupModule.find(params[:id]).alternatives(true)
            else
              @awesootup_modules = AwesootupModule.find(params[:id]).alternatives
            end
          else
            @awesootup_modules = AwesootupModule.all
          end
        when :equally_satisfied
          if params[:id]
            params[:id] = params[:id].to_i
            params[:strict] = params[:strict] == 'true'
            if params[:strict]
              @awesootup_modules = AwesootupModule.find(params[:id]).equally_satisfied(true)
            else
              @awesootup_modules = AwesootupModule.find(params[:id]).equally_satisfied
            end
          else
            @awesootup_modules = AwesootupModule.all
          end
      end
    else
      @awesootup_modules = AwesootupModule.all
    end
  end

  def show
    @awesootup_module = AwesootupModule.find(params[:id])
  end

  def new

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
