ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  'bestustuvn@gmail.com',
  :password             =>  'huythanhloc',
  :domain               =>  'heroku.com',
  :enable_starttls_auto  =>  true
}
