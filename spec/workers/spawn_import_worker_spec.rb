require 'rails_helper'
RSpec.describe SpawnImportWorker, type: :worker do
  it "spawns ImportWorkers" do
    SpawnImportWorker.perform_async("Menu", fixture_file_upload('files/menu.csv', 'text/csv').path)
    SpawnImportWorker.drain
    assert_equal 1, ImportWorker.jobs.size
  end
end
