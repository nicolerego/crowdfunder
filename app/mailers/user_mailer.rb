class UserMailer < ApplicationMailer

  def fully_funded(user)
      @user = user
      email_with_name = %("#{@user.first_name}" <#{@user.email}>)
      mail(to: email_with_name, subject: 'This project is fully funded!')
  end

end
