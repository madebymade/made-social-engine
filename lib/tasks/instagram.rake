namespace :social do
  namespace :instagram do
    desc 'Refreshes collection of Instagram photos'
    task :fetch => :environment do
      Social::InstagramHashtag.refresh_hashtag_photos
    end
  end
end
