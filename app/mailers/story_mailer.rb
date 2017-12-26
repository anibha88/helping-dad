class StoryMailer < ApplicationMailer

  def daily_story
    email_attachment = "#{Rails.root}/lib/attachments/ramesh_daily_report.pdf"
    
    # mail to: "nithin@cognitiveclouds.com", subject: "Today's report! Date: #{Time.now.strftime("%d/%m/%Y")}"
    mail to: "nithin@cognitiveclouds.com", subject: "Today's report!"
    #mail to: "sreelpg_response@yahoo.co.in", subject: "Today's report!"
    mail.attachments["ramesh_daily_report.pdf"] = File.read(email_attachment)
  end
end
