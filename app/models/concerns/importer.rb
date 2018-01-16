# require 'csv'
module Importer
  extend ActiveSupport::Concern

  module ClassMethods
    def import_file(file)
      items = []
      # CSV.foreach(file, headers: true) do |row|
      #   items << self.new(row.to_h) if row.present?
      # end

      spreadsheet = Roo::Spreadsheet.open(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        items << self.new(row.to_hash)
      end
      self.import(items)
    end

  end
end