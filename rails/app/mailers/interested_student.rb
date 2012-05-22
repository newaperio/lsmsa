class InterestedStudent < ActionMailer::Base
  default from: "interested_student@gmail.com"

  
  def sending_email(prospy)
    @prospy=prospy

    mail to: prospy.email, subject: "Your signed up!"
    # mail to: @prospy.email, subject: "New Prospective Student"
  end
end
