class User < ActionMailer::Base
  default from: "jain0695@gmail.com"
  def send_signup_email(user)
    @user = user
    mail( :to => @user,
          :subject => 'Thanks for signing up eatzza.com' )
  end
end
