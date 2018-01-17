require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe ".import_file" do

    it "creates spawn SpawnImportWorker" do
      expect {
        Dish.import_file(fixture_file_upload("files/dish.csv", 'text/csv'))
      }.to change(SpawnImportWorker.jobs, :count).by(1)
    end

  end
end
