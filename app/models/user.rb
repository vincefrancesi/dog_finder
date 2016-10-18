class User < ApplicationRecord
  def self.send_emails
    User.all.each do |user|
      PuppyMailer.todays_puppies(user).deliver
    end
  end
end
