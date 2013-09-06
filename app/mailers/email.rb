class Email < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.indicacao.subject
  #
  def indicacao(email)
    #email = indicacao.servico.email
    @greeting = "Hi"

    mail to: email, subject: "testando mais em 08:49"
  end
end
