class Menu < ApplicationRecord
  include Importer

  def self.search(term)
    self.where('name LIKE ? or sponsor ILIKE ? or event ILIKE ? or venue ILIKE ?',
               "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%").or(
        self.where('place LIKE ? or physical_description ILIKE ? or occasion ILIKE ? or notes ILIKE ?',
               "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%")).or(
        self.where('call_number LIKE ? or keywords ILIKE ? or language ILIKE ? or location ILIKE ?',
                   "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%")).or(
        self.where('currency LIKE ? or currency_symbol ILIKE ? or status ILIKE ?',
                   "%#{term}%", "%#{term}%", "%#{term}%"))
  end
end
