class AdminMailer < ActionMailer::Base

  default from: "contractiqdev@gmail.com"

   def  new_user_notification(user)
     @user = user
     @user_subject = "Welcome to the SocialBlog"
     mail(:to =>  @user.email, :subject => @user_subject)
   end

      def  admin_notification(user)
     @user = user
     @admin = "admin@example.com"
     @admin_subject = "New user approval"
     mail(:to =>  "johnson@contractiq.in", :subject => @admin_subject)
   end

end
