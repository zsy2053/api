class UserMailer < ActionMailer::Base
     default :from => "noreply@boro.one"

     def registration_confirmation(user)
        @user = user
        mail(:to => "<#{@user.email}>", :subject => "Registration Confirmation")
     end
 end
