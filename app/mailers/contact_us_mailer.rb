class ContactUsMailer < ApplicationMailer
  default :from => 'noreply@ozer-health.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def contact(params)
    @message = params['message']
    mail( :to => "robertschwar@gmail.com",
    :subject => params['subject'] )
  end
end
