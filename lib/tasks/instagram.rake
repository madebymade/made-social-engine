namespace :social do
  namespace :instagram do
    desc 'Refreshes collection of Instagram photos'
    task :fetch => :environment do
      Social::InstagramHashtag.refresh_hashtag_photos
    end

    desc 'Refreshes collection of Instagram photos for users'
    task :fetch_user_photos => :environment do
      Social::InstagramPhoto.get_user_photos
    end
  end
end
