require 'instagram'

module Social
  class InstagramPhoto < ActiveRecord::Base
    attr_accessible           :photo_id,
                              :link,
                              :image_url,
                              :hi_res_image_url,
                              :photo_created_at,
                              :like_count,
                              :comment_count,
                              :instgram_hashtag_id,
                              :offensive

    belongs_to                :instagram_hashtag

    validates_presence_of     :photo_id,
                              :link,
                              :image_url,
                              :photo_created_at,
                              :like_count,
                              :comment_count

    validates_uniqueness_of   :photo_id

    default_scope             :order => 'photo_created_at DESC'

    def self.get_hashtag_photos(instagram_hashtag)
      configure_instagram_client

      Instagram.tag_recent_media(instagram_hashtag.hashtag).each do |photo|
        instagram_photo = instagram_hashtag.photos.find_or_create_by_photo_id(
          :comment_count        => photo.comments["count"],
          :photo_id             => photo.id,
          :image_url            => photo.images.low_resolution.url,
          :hi_res_image_url     => photo.images.standard_resolution.url,
          :like_count           => photo.likes["count"],
          :photo_created_at     => Time.at(Integer(photo.created_time)),
          :link                 => photo.link
        )
      end

      delete_old_instagram_photos
    end

    def self.get_user_photos
      configure_instagram_client

      client = Instagram.client(:access_token => Social.config.instagram_access_token)
      client.user_recent_media.each do |photo|
        self.find_or_create_by_photo_id(
          :comment_count    => photo.comments["count"],
          :photo_id         => photo.id,
          :image_url        => photo.images.low_resolution.url,
          :hi_res_image_url => photo.images.standard_resolution.url,
          :like_count       => photo.likes["count"],
          :photo_created_at => Time.at(Integer(photo.created_time)),
          :link             => photo.link
        )
      end

      delete_old_instagram_photos
    end

    def self.delete_old_instagram_photos
      keep_photos = Social.config.instagram_display_count + 10

      self.where(:offensive => true).offset(keep_photos).destroy_all
      self.where(:offensive => false).offset(keep_photos).destroy_all
    end

    def self.get_unoffensive
      where(:offensive => false)
    end

    private

    def self.configure_instagram_client
      Instagram.configure do |config|
        config.client_id = Social.config.instagram_client_id
        config.client_secret = Social.config.instagram_client_secret
      end
    end
  end
end
