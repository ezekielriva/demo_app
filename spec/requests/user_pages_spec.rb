require 'spec_helper'

describe "User pages" do


  describe "signup page" do
    let(:user) { FactoryGirl.build(:user) }
    let(:submit) { "Create my account" }
    before { visit signup_path }

    it { expect(page).to have_content 'Sign up' }
    it { expect(page).to have_title full_title 'Sign up' }

    describe "with invalid information" do
      it "should not create a user" do
        expect{ click_button submit }.not_to change User, :count
      end

      describe "after submission" do
        before { click_button submit }

        it { expect(page).to have_title full_title 'Sign up' }
        it { expect(page).to have_content 'error' }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: user.name
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        fill_in "Confirmation", with: user.password_confirmation
      end

      it "should create a user" do
        expect{ click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:new_user) { User.find_by(email: user.email) }

        it { expect(page).to have_title new_user.name }
        it { expect(page).to have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { expect(page).to have_content user.name }
    it { expect(page).to have_title user.name }
  end

end
