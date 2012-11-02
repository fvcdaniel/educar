    ActionMailer::Base.smtp_settings = {  
      :address              => "127.0.0.1",  
      :port                 => 25,  
      :domain               => "meuimovelpb.com",  
      :user_name            => "daniel",  
      #:password             => "secret",  
      :authentication       => "none"
      #:enable_starttls_auto => true  
    }