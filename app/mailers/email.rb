class Email < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.indicacao.subject
  #
  def indicacao(email)
    @greeting = "Hi"

    mail to: email, subject: "Testando email para cabrito"
  end
end
