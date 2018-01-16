class DishesController < ApplicationController
  include SortHelper
  def index
    @dishes = Dish.search(params[:term], params[:page], sort_column, sort_direction)
  end

  def import
    Dish.import_file(params[:file])
    redirect_to dishes_path, notice: "Dish Data processing!"
  end
end
