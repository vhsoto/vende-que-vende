require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = User.last
  end

  test "welcome" do
    mail = UserMailer.with(user: @user).welcome
    assert_equal "Welcome aboard to Vendelo", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["no-reply@vendelo.com"], mail.from
    assert_match "Hey #{@user.username}, welcome to Vendelo.", mail.body.encoded
  end

end
