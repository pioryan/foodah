require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe ".import_file" do

    it "creates new records" do
      expect {
        Dish.import_file(fixture_file_upload("files/dish.csv", 'text/csv'))
        SpawnImportWorker.drain
        ImportWorker.drain
      }.to change(Dish, :count).by(5)
    end

  end
end
