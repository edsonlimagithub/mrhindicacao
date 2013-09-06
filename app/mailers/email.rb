class Email < ActionMailer::Base
  default from: "indicacao@mrhgestao.com.br"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.indicacao.subject
  #
  def indicacao(email, indicacao)
    #@greeting = "Hi"
    @indicacao = indicacao

    mail to: email, subject: "Indicacao"
  end
end
