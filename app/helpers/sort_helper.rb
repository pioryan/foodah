module SortHelper
  def sort_link(column, title = nil)
    column = column.gsub(" ","").underscore unless title
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end

  def sortable_columns
    self.controller_name.singularize.classify.constantize.column_names
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end