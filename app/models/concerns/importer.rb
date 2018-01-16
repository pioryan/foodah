require 'csv'
module Importer
  extend ActiveSupport::Concern

  module ClassMethods
    def import_file(file)
      raise "Upload File Error" unless file
      items = []
      CSV.foreach(file.path, headers: true) do |row|
        items << self.new(row.to_h) if row.present?
      end

      self.import(items)
    end

  end
end