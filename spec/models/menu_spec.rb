require 'rails_helper'

RSpec.describe Menu, type: :model do

  describe ".import_file" do

    it "creates spawn SpawnImportWorker" do
      expect do
        Menu.import_file(fixture_file_upload('files/menu.csv', 'text/csv'))
      end.to change(SpawnImportWorker.jobs, :count).by(1)
    end

  end
end
