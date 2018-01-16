require 'rails_helper'

RSpec.describe MenuPagesController, type: :controller do
  #refactor use shared behaviour

  describe "#import" do

    before :each do
      @file = fixture_file_upload('files/menu_page.csv', 'text/csv')
    end

    subject { post :import, :params => {file: @file} }

    it "accepts file" do
      expect(subject).to  redirect_to(menu_pages_url)
    end

    it "creates new menu" do
      expect{subject}.to change(MenuPage, :count).by(3)
    end

    describe "malformed file" do
      before :each do
        @file = fixture_file_upload('files/menu.csv', 'text/csv')
      end
      it "redirects to menu index" do
        expect(subject).to  redirect_to(menu_pages_url)
      end

      it "sets alert" do
        expect(subject).to  redirect_to(menu_pages_url)
        expect(flash[:alert]).to be_present
      end
    end

    describe "double import file" do
      it "doest not create new records" do
        expect{subject}.to change(MenuPage, :count).by(3)
        expect{subject}.to change(MenuPage, :count).by(0)
      end
    end

    describe "duplicte id" do
      before :each do
        @file = fixture_file_upload('files/menu_duplicate_id.csv', 'text/csv')
      end
      it "doest not create new records" do
        expect(subject).to  redirect_to(menu_pages_url)
        expect(flash[:alert]).to be_present
      end
    end

  end
end
