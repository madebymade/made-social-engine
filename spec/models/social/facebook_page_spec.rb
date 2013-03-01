require 'spec_helper'

module Social
  describe FacebookPage do
    include Helpers

    before(:each) do
      @page = FactoryGirl.build(:facebook_page)
    end

    it "has a valid factory" do
      @page.should be_valid
    end

    it "is invalid without a URL" do
      FactoryGirl.build(:facebook_page, url: nil).should_not be_valid
    end

    it "should return a JSON representation of the page" do
      stub_request(:get, "http://graph.facebook.com/made.development").
         to_return(:status => 200, :body => fixture("facebook_page.json"), :headers => {})

      expect @page.get_info['likes'].should eql 780
    end
  end
end
