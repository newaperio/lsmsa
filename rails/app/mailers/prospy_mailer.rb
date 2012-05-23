class ProspyMailer < ActionMailer::Base
  default from: "admissions@lsmsa.edu"

  def interest_notification(prospy)
    @prospy = prospy

    mail to: @prospy.email, subject: "New Prospective Student"
  end
end
