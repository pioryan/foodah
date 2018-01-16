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

      expect do
        subject
        SpawnImportWorker.drain
        ImportWorker.drain
      end.to change(Menu, :count).by(2)

    end
  end
end
