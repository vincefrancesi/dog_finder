desc 'Cron job to run daily'
task daily_task: :environment do
  Website.update_all_puppies
  User.send_emails
end
