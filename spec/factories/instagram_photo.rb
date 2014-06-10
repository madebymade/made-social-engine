FactoryGirl.define do
  factory :instagram_photo, class: Social::InstagramPhoto do
    instagram_hashtag_id 1
    photo_id '739065768712775233_24104520'
    link 'http://instagram.com/p/pBsGahxqZB/'
    image_url 'http://scontent-a.cdninstagram.com/hphotos-xfa1/t51.2885-15/10375840_502211203239770_597176398_n.jpg'
    photo_created_at '1402323526'
    like_count 17
    comment_count 0
    offensive false
  end
end
