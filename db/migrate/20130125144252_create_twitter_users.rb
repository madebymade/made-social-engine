class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :social_twitter_users do |t|
      t.string :username

      t.timestamps
    end

    add_index :social_twitter_users, :username

    # Social::TwitterUser.create!(
    #   :username => 'JordansCereals'
    # )
  end
end
