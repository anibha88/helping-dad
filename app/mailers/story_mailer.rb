class StoryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.story_mailer.daily_story.subject
  #
  def daily_story
    @greeting = "Hi"

    mail to: "nithin@cognitiveclouds.com", subject: "Today's report! Date: #{Time.now.strftime("%d/%m/%Y")}"
  end
end
