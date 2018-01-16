require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  describe "#import" do

    before :each do
      @file = fixture_file_upload('files/dish.csv', 'text/csv')
    end

    subject { post :import, :params => {file: @file} }

    it "accepts file" do
      expect(subject).to  redirect_to(dishes_url)
    end

    it "creates new dish" do

      expect do
        subject
        SpawnImportWorker.drain
        ImportWorker.drain
      end.to change(Dish, :count).by(5)

    end
  end
end
