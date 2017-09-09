class TicketMailer < ApplicationMailer
  def buy_ticket(user,ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end

  def remove_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы удалили купленный билет')
  end
end
