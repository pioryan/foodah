class Dish < ApplicationRecord
  include Importer

  def self.search(term, page = 1 , sort_column, sort_direction)
    if term.present?
      where('name LIKE ? or description ILIKE ?', "%#{term}%", "%#{term}%")
          .paginate(page: page, per_page: 20)
          .order("#{sort_column} #{sort_direction}")
    else
      paginate(page: page, per_page: 20)
          .order("#{sort_column} #{sort_direction}")
    end
  end
end
