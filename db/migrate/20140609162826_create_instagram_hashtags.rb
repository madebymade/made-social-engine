class CreateInstagramHashtags < ActiveRecord::Migration
  def change
    create_table :social_instagram_hashtags do |t|
      t.string :hashtag

      t.timestamps
    end

    add_index :social_instagram_hashtags, :hashtag

    Social::InstagramHashtag.create!(
      :hashtag => 'ryvita'
    )
  end
end
