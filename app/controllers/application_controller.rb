class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_var


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def set_var
    @materias ||= Materia.all(:order => :nome)
    @assuntos = Assunto.all
  end

  around_filter :you_dont_have_bloody_clue

  protected

  def you_dont_have_bloody_clue
    klasses = [ActiveRecord::Base, ActiveRecord::Base.class]
    methods = ["session", "cookies", "params", "request"]

    methods.each do |shenanigan|
      oops = instance_variable_get(:"@_#{shenanigan}") 

      klasses.each do |klass|
        klass.send(:define_method, shenanigan, proc { oops })
      end
    end

    yield

    methods.each do |shenanigan|      
      klasses.each do |klass|
        klass.send :remove_method, shenanigan
      end
    end

  end

  
end
