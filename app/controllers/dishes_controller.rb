class DishesController < ApplicationController
  include SortHelper
  def index
    @menu_items = MenuItem.search(params[:term], params[:page], sort_column, sort_direction)
  end

  def import
    MenuItem.import_file(params[:file])
    redirect_to menu_items_path, notice: "MenuItem Data processing!"
  end
end
