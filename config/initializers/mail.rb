ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,  
  :address            => 'smtp.gmail.com',
  :port               => 587,
  :domain             => 'aprenderconcursos.com', #you can also use google.com
  :authentication     => :plain,
  :user_name          => 'contato@aprenderconcursos.com',
  :password           => 'd@n13lc4rd0s0'
}