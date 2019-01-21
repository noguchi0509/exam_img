class ConfirmMailer < ApplicationMailer
  def confirm_mail(content)
    @content = content
    mail to: @content.user.email, subject: "投稿の確認メール"
  end
end
