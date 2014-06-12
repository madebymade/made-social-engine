class AddTwitterAvatarAndDisplayName < ActiveRecord::Migration
  def change
    add_column :social_twitter_users, :display_name, :string
    add_column :social_twitter_users, :avatar_url, :string
  end
end
