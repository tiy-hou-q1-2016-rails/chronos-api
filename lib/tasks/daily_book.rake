namespace :chronos do

  desc "Run daily creation"
  task :daily_book => :environment do
    DailyBook.create_for_all
  end
end
