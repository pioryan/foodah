class MenuItem < ApplicationRecord
  include Importer
  def self.search(term, page = 1 , sort_column, sort_direction)
    if term.present?
      where('id LIKE ?', "%#{term}%")
          .paginate(page: page, per_page: 20)
          .order("#{sort_column} #{sort_direction}")
    else
      paginate(page: page, per_page: 20)
          .order("#{sort_column} #{sort_direction}")
    end
  end
end
