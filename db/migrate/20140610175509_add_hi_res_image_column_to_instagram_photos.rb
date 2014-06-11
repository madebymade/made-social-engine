class AddHiResImageColumnToInstagramPhotos < ActiveRecord::Migration
  def change
    add_column :social_instagram_photos, :hi_res_image_url, :string
  end
end
