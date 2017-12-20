# Preview all emails at http://localhost:3000/rails/mailers/story_mailer
class StoryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/story_mailer/daily_story
  def daily_story
    StoryMailer.daily_story
  end

end
