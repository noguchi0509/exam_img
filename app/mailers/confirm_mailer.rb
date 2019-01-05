class ConfirmMailer < ApplicationMailer
  def confirm_mail(content)
    @content = content
    mail to: "nrmke4g7pr@gmail.com", subject: "投稿の確認メール"
  end
end
