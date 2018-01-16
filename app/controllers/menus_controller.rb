class MenusController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @menus = Menu
    @menus = @menus.search(params[:term]) if params[:term].present?
    @menus = @menus.order("#{sort_column} #{sort_direction}")
  end

  def import
    Menu.import_file(params[:file].path)
    redirect_to menus_path, notice: "Menu Data imported!"
  end

  private
    def sortable_columns
      Menu.column_names
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

  def menus_params
    params.permit(:name, :sponsor, :event, :place, :physical_description, :occasion, :notes, :call_number, :keywords, :language, :location)
  end
end
