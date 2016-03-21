class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterapp.com"

  def comment_added
    mail(to: "efesantos.webapps@gmail.com", subject: "A comment has been posted")
  end

end
