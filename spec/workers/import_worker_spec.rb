require 'rails_helper'
RSpec.describe ImportWorker, type: :worker do
  describe "Menu Import" do
    it "creates new menu records" do
      expect do
      data = SmarterCSV.process(fixture_file_upload('files/menu.csv', 'text/csv').path)
      ImportWorker.new.perform("Menu", data)
      end.to change(Menu, :count).by(2)
    end
  end

  

  describe "Dish Import" do
    it "creates new dish records" do
      expect do
        data = SmarterCSV.process(fixture_file_upload('files/dish.csv', 'text/csv').path)
        ImportWorker.new.perform("Dish", data)
      end.to change(Dish, :count).by(5)
    end
  end
end
