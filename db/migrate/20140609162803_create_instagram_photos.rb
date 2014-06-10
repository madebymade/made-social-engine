class CreateInstagramPhotos < ActiveRecord::Migration
  def change
    create_table :social_instagram_photos do |t|
      t.text :photo_id
      t.text :link
      t.text :image_url
      t.text :photo_created_at
      t.integer :like_count
      t.integer :comment_count
      t.integer :instagram_hashtag_id
      t.boolean :offensive, :default => false
    end

    add_index :social_instagram_photos, :instagram_hashtag_id
    add_index :social_instagram_photos, :offensive
  end
end
