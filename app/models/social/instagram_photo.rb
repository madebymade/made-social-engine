module Social
  class InstagramPhoto < ActiveRecord::Base
    NUM_PHOTOS_STORE = 6

    attr_accessible           :photo_id,
                              :link,
                              :image_url,
                              :photo_created_at,
                              :like_count,
                              :comment_count,
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

    default_scope             :order => 'photo_created_at DESC'

  end
end
