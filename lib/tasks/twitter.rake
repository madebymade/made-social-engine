namespace :social do
  namespace :twitter do
    desc 'Updates Twitter feeds'
    task :fetch => :environment do
      Social::TwitterUser.get_all_tweets
    end
  end
end
