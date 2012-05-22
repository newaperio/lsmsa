require 'test_helper'

class InterestedStudentTest < ActionMailer::TestCase
  test "sending_email" do
    mail = InterestedStudent.sending_email
    assert_equal "Sending email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
