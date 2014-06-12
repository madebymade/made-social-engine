# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140612090858) do

  create_table "social_instagram_hashtags", :force => true do |t|
    t.string   "hashtag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "social_instagram_hashtags", ["hashtag"], :name => "index_social_instagram_hashtags_on_hashtag"

  create_table "social_instagram_photos", :force => true do |t|
    t.text    "photo_id"
    t.text    "link"
    t.text    "image_url"
    t.text    "photo_created_at"
    t.integer "like_count"
    t.integer "comment_count"
    t.integer "instagram_hashtag_id"
    t.boolean "offensive",            :default => false
    t.string  "hi_res_image_url"
  end

  add_index "social_instagram_photos", ["instagram_hashtag_id"], :name => "index_social_instagram_photos_on_instagram_hashtag_id"
  add_index "social_instagram_photos", ["offensive"], :name => "index_social_instagram_photos_on_offensive"

  create_table "social_tweets", :force => true do |t|
    t.text     "text"
    t.datetime "tweeted_at"
    t.integer  "twitter_user_id"
    t.integer  "tweet_id",        :limit => 8
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "social_tweets", ["tweeted_at"], :name => "index_social_tweets_on_tweeted_at"
  add_index "social_tweets", ["twitter_user_id"], :name => "index_social_tweets_on_twitter_user_id"

  create_table "social_twitter_users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "display_name"
    t.string   "avatar_url"
  end

  add_index "social_twitter_users", ["username"], :name => "index_social_twitter_users_on_username"

end
