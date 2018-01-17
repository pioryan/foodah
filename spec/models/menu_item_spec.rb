require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it "creates spawn SpawnImportWorker" do
    expect do
      MenuItem.import_file(fixture_file_upload('files/menu_item.csv', 'text/csv'))
    end.to change(SpawnImportWorker.jobs, :count).by(1)
  end
end
