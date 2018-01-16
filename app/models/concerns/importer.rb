require 'csv'
module Importer
  extend ActiveSupport::Concern

  module ClassMethods
    def import_file(file)
      raise "Upload File Error" unless file
      SpawnImportWorker.perform_async(self.to_s, file.path)
    end

  end
end