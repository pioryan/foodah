require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it "creates new records" do
    expect {
      MenuItem.import_file(fixture_file_upload("files/menu_item.csv", 'text/csv'))
      SpawnImportWorker.drain
      ImportWorker.drain
    }.to change(MenuItem, :count).by(4)
  end
end
