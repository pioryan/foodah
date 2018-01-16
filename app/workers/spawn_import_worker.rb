class SpawnImportWorker
  include Sidekiq::Worker

  def perform(klass, filename)
    SmarterCSV.process(filename, {:chunk_size => 1000 }) do |chunk|
      ImportWorker.perform_async(klass, chunk)
    end
  end
end
