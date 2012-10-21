class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_var

  private
  def set_var
    @materias = Materia.all
  end

  
end
