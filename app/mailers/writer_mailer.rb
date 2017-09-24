class WriterMailer < ApplicationMailer
	def welcome_email(writer)
	    @writer = writer
	    @url  = 'http://verby.io/writers/sign_in'
	    mail(from:"no-reply@verby.io", to: @writer.email, subject: 'Welcome to Verby',sent_on: Time.now)
  	end	
end
