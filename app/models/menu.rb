class Menu < ApplicationRecord
  include Importer

  def self.search(term, page = 1 , sort_column, sort_direction)
    if term.present?
      where('name LIKE ? or sponsor ILIKE ? or event ILIKE ? or venue ILIKE ?',
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
end
