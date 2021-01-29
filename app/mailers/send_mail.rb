require 'sendgrid-ruby'
include SendGrid


from = SendGrid::Email.new(email: 'me@brentschooley.com')
to = SendGrid::Email.new(email: 'bentfromtwilio@gmail.com')
subject = 'sending with twilio sendgrid is fun......'
content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to anywhere, even with ruby!')
mail = SendGrid::Mail.new(from, subject, to, content)
sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body:mail.to_json)


puts response.status_code
puts response.body
puts response.headers
