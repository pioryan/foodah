class Menu < ApplicationRecord
  include Importer
  has_many :menu_pages
  has_many :dishes, :through => :menu_pages

  def self.search(term, page = 1 , sort_column, sort_direction)
    if term.present?
      where('menus.name LIKE ? or sponsor ILIKE ? or event ILIKE ? or venue ILIKE ?',
                 "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%").or(
          self.where('place LIKE ? or physical_description ILIKE ? or occasion ILIKE ? or notes ILIKE ?',
                 "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%")).or(
          self.where('call_number LIKE ? or keywords ILIKE ? or language ILIKE ? or location ILIKE ?',
                     "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%")).or(
          self.where('currency LIKE ? or currency_symbol ILIKE ? or status ILIKE ?',
                     "%#{term}%", "%#{term}%", "%#{term}%"))
          .paginate(page: page, per_page: 20)
          .order("#{sort_column} #{sort_direction}")
    else
      paginate(page: page, per_page: 20)
          .order("#{sort_column} #{sort_direction}")
    end
  end

  def self.filter(params={})
    filters = {}
    filters.merge!({ venue: params[:venue]}) if params[:venue].present?
    filters.merge!({ event: params[:event]}) if params[:event].present?
    filters.merge!({ place: params[:place]}) if params[:place].present?
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
      end_date = Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
      where(filters).where("date BETWEEN ? and ?", start_date, end_date)
    else
      where(filters)
    end

  end
end
