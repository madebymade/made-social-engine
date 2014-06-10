require 'spec_helper'

module Social
  describe InstagramPhoto do
    include Helpers

    before(:each) do
      stub_instagram_api
      @instagram_photo = FactoryGirl.create(:instagram_photo)
    end

    it "has a valid factory" do
      expect(@instagram_photo).to be_valid
    end

    it "is invalid without a photo id" do
      expect(FactoryGirl.build(:instagram_photo, photo_id: nil)).to_not be_valid
    end

    it "is invalid without a link" do
      expect(FactoryGirl.build(:instagram_photo, link: nil)).to_not be_valid
    end

    it "is invalid without an image url" do
      expect(FactoryGirl.build(:instagram_photo, image_url: nil)).to_not be_valid
    end

    it "is invalid without a like count" do
      expect(FactoryGirl.build(:instagram_photo, like_count: nil)).to_not be_valid
    end

    it "is invalid without a comment count" do
      expect(FactoryGirl.build(:instagram_photo, comment_count: nil)).to_not be_valid
    end

    it "is invalid without an instagram hashtag id" do
      expect(FactoryGirl.build(:instagram_photo, instagram_hashtag_id: nil)).to_not be_valid
    end

    it "should fetch the photos for a given hashtag" do
      InstagramPhoto.get_hashtag_photos('ryvita', 1)
      expect(InstagramPhoto.where(:instagram_hashtag_id => 1).count).to eq 20
    end
  end
end
