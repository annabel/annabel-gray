class ContactMailer < ActionMailer::Base
  def contact_form(message)
    @name    = message.name
    @email   = message.email
    @content = message.content
    mail(subject:       "Contact Form Submission",
         to:            "annabel.dunstone@gmail.com",
         from:          @email,
         template_path: "mailers",
         template_name: "contact_form"
    )
  end
end