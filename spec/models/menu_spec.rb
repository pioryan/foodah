require 'rails_helper'

RSpec.describe Menu, type: :model do

  describe ".import_file" do

    it "creates new records" do
      expect {
        Menu.import_file(fixture_file_upload("files/menu.csv", 'text/csv'))
      }.to change(Menu, :count).by(2)
    end

  end
end
