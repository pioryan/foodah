require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  describe "#import" do

    before :each do
      @file = fixture_file_upload('files/menu.csv', 'text/csv')
    end

    subject { post :import, :params => {file: @file} }

    it "accepts file" do
      expect(subject).to  redirect_to(menus_url)
    end

    it "creates new menu" do
      expect{subject}.to change(Menu, :count).by(2)
    end

    describe "malformed file" do
      before :each do
        @file = fixture_file_upload('files/menu_page.csv', 'text/csv')
      end
      it "redirects to menu index" do
        expect(subject).to  redirect_to(menus_url)
      end

      it "sets alert" do
        expect(subject).to  redirect_to(menus_url)
        expect(flash[:alert]).to be_present
      end
    end

    describe "double import file" do
      it "doest not create new records" do
        expect{subject}.to change(Menu, :count).by(2)
        expect{subject}.to change(Menu, :count).by(0)
      end
    end

    describe "duplicte id" do
      before :each do
        @file = fixture_file_upload('files/menu_duplicate_id.csv', 'text/csv')
      end
      it "doest not create new records" do
        expect(subject).to  redirect_to(menus_url)
        expect(flash[:alert]).to be_present
      end
    end

  end
end
