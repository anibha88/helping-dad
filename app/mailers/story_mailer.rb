class StoryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.story_mailer.daily_story.subject
  #
  def daily_story
    @greeting = "Hi"
    email_attachment = "#{Rails.root}/lib/attachments/file.csv"
    
    # mail to: "nithin@cognitiveclouds.com", subject: "Today's report! Date: #{Time.now.strftime("%d/%m/%Y")}"
    mail to: "nithin@cognitiveclouds.com", subject: "Today's report!"
    #mail to: "sreelpg_response@yahoo.co.in", subject: "Today's report!"
    mail.attachments['file.csv'] = File.read(email_attachment)
  end
end
