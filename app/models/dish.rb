class Dish < ApplicationRecord
  include Importer

  has_many :menu_items
  has_many :menu_pages, :through => :menu_items

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
