require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do
#refactor use shared behaviour

  describe "#import" do

    before :each do
      @file = fixture_file_upload('files/menu_item.csv', 'text/csv')
    end

    subject { post :import, params: { file: @file } }

    it "accepts file" do
      expect(subject).to redirect_to(menu_items_url)
    end

    it "creates new menu item" do

      expect do
        subject
      end.to change(SpawnImportWorker.jobs, :count).by(1)

    end
  end
end
