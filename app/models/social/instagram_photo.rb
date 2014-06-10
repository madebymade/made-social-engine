require 'instagram'

module Social
  class InstagramPhoto < ActiveRecord::Base
    NUM_PHOTOS_STORE = 6

    attr_accessible           :photo_id,
                              :link,
                              :image_url,
                              :photo_created_at,
                              :like_count,
                              :comment_count,
                              :instgram_hashtag_id,
                              :offensive

    belongs_to                :instagram_hashtag

    validates                 :photo_id,
                              :presence => true
    validates                 :link,
                              :presence => true
    validates                 :image_url,
                              :presence => true
    validates                 :photo_created_at,
                              :presence => true
    validates                 :like_count,
                              :presence => true
    validates                 :comment_count,
                              :presence => true
    validates                 :instagram_hashtag_id,
                              :presence => true

    default_scope             :order => 'photo_created_at DESC'

    def self.get_hashtag_photos(hashtag, hashtag_id)
      delete_old_instagram_photos(hashtag_id)

      Instagram.configure do |config|
        config.client_id = Social.config.instagram_client_id
        config.client_secret = Social.config.instagram_client_secret
      end

      Instagram.tag_recent_media(hashtag).each do |photo|
        photo_obj = InstagramPhoto.where(
          :comment_count        => photo.comments["count"],
          :photo_id             => photo.id,
          :image_url            => photo.images.low_resolution.url,
          :like_count           => photo.likes["count"],
          :photo_created_at     => Time.at(Integer(photo.created_time)),
          :link                 => photo.link,
          :instagram_hashtag_id => hashtag_id
        ).first_or_create!
        photo_obj.save()
      end
    end

    def self.delete_old_instagram_photos(hashtag_id)
      InstagramPhoto.where('instagram_hashtag_id = ? ', hashtag_id)
        .each { |photo| photo.delete }
    end

  end
end
