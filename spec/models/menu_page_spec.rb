require 'rails_helper'

RSpec.describe MenuPage, type: :model do
  describe ".import_file" do

    it "creates new records" do
      expect {
        MenuPage.import_file(fixture_file_upload("files/menu_page.csv", 'text/csv'))
        SpawnImportWorker.drain
        ImportWorker.drain
      }.to change(MenuPage, :count).by(3)
    end

  end
end
