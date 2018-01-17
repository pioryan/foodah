class MenuItem < ApplicationRecord
  include Importer

  belongs_to :menu_page
  belongs_to :dish

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
