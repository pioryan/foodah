class MenuPagesController < ApplicationController
  include SortHelper
  def index
    @menu_pages = MenuPage.search(params[:term], params[:page], sort_column, sort_direction)
  end

  def import
    MenuPage.import_file(params[:file])
    redirect_to menu_pages_path, notice: "MenuPage Data imported!"
  end
end
