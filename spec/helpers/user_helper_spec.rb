require 'spec_helper'

describe UsersHelper do

  describe "gravatar_for" do

    describe "should return image tag" do
      let(:user) { FactoryGirl.build(:user) }
      let(:user_md5) { Digest::MD5::hexdigest( user.email ) }

      it "with a gravatar default url" do
        expect( gravatar_for(user) ).to match('https://secure.gravatar.com/avatar/')
      end

      it "with a image tag" do
        expect( gravatar_for(user) ).to match(/^(<img.+src=".+".*>)/)
      end

      it "with a size modification" do
        expect( gravatar_for(user, 50) ).to match("s=50")
      end
    end

  end

end
