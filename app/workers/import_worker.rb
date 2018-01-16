class ImportWorker
  include Sidekiq::Worker

  def perform(klass, data)
    items = []
    klass = klass.constantize
    data.each do |row|
      items << klass.new(row.to_h)
    end
    klass.import(items)
  end
end
