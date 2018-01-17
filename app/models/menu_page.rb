class MenuPage < ApplicationRecord
  include Importer

  belongs_to :menu
  has_many :menu_items
  has_many :dishes, :through => :menu_items

  def self.search(term, page = 1 , sort_column, sort_direction)
    if term.present?
      where('uuid LIKE ?', "%#{term}%")
          .paginate(page: page, per_page: 20)
          .order("#{sort_column} #{sort_direction}")
    else
      paginate(page: page, per_page: 20)
          .order("#{sort_column} #{sort_direction}")
    end
  end
end
