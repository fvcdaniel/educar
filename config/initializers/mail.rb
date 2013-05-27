ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,  
  :address            => 'localhost', #'smtp.gmail.com',
  :port               => 25, #587,
  :domain             => 'aprenderconcursos.com', #you can also use google.com
  :tls                => false
  #:authentication     => :plain,
  #:user_name          => 'contato@aprenderconcursos.com',
  #:password           => ''
}