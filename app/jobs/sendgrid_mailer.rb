require 'sendgrid-ruby'
include SendGrid


module SendgridMailer
  def self.send_mail(params)

    from = Email.new(email: params['email'])
    to = Email.new(email: 'robertschwar@gmail.com')
    subject = params['subject']
    content = Content.new(type: 'text/plain', value: params['message'])
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
