class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_var


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def set_var
    @materias ||= Materia.all
    @assuntos = Assunto.all
  end

  
end
