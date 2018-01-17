module SortHelper
  def sort_link(column, title = nil)
    column = column.gsub(" ","").underscore unless title
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == sort_column ? icon : ""
    filters = {venue: params[:venue], event: params[:event], place: params[:place], start_date: filtering_params[:start_date], end_date: filtering_params[:end_date],column: column, direction: direction}
    link_to "#{title} <span class='#{icon}'></span>".html_safe, filters
  end

  def sortable_columns
    self.controller_name.singularize.classify.constantize.column_names
  end

  def table_name
    self.controller_name.singularize.classify.constantize.table_name
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "#{table_name}.id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def filtering_params
    params.permit(:venue, :event, :place, :term, :column, :direction, :commit, :utf8,:start_date => [:year, :month, :day], :end_date => [:year, :month, :day])
  end
end