class MenusController < ApplicationController
  include SortHelper
  def index
    @menus = Menu.search(params[:term], params[:page], sort_column, sort_direction)
  end

  def import
    Menu.import_file(params[:file])
    redirect_to menus_path, notice: "Menu Data processing!"
  end
end
