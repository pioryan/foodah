class MenusController < ApplicationController
  include SortHelper

  def index
    @menus = Menu.search(params[:term], params[:page], sort_column, sort_direction).filter(params)
  end

  def show
    @menu = Menu.where(id: params[:id]).includes(:menu_pages, :dishes).order("menu_pages.page_number asc").first
  end

  def import
    Menu.import_file(params[:file])
    redirect_to menus_path, notice: "Menu Data processing!"
  end

  def export
    @menus = Menu.search(params[:term], params[:page], sort_column, sort_direction).filter(params).includes(:menu_pages, :dishes).order("menu_pages.page_number asc")
    send_data @menus.to_json(include: {:menu_pages => {include: :dishes}}), type: "application/json"
  end


end
