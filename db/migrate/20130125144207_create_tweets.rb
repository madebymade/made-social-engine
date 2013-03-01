class CreateTweets < ActiveRecord::Migration
  def change
    create_table :social_tweets, :tweet_id => false do |t|
      t.text :text
      t.timestamp :tweeted_at
      t.integer :twitter_user_id
      t.integer :tweet_id, :limit => 8

      t.timestamps
    end

    add_index :social_tweets, :twitter_user_id
    add_index :social_tweets, :tweeted_at
  end
end
