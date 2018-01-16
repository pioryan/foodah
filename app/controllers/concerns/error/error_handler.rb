module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ActiveModel::UnknownAttributeError, with: :malformed_data
        rescue_from PG::UniqueViolation, with: :duplicate_data
        rescue_from StandardError, with: :standard_error
      end
    end

    private
    def record_not_found(_e)
      json = Helpers::Render.json(:record_not_found, 404, _e.to_s)
      render json: json
    end

    def malformed_data(_e)
      redirect_to "/#{self.controller_name}", alert: _e.to_s
    end

    def duplicate_data(_e)
      redirect_to "/#{self.controller_name}", alert: _e.to_s
    end

    def standard_error(_e)
      redirect_to "/#{self.controller_name}", alert: _e.to_s
    end
  end
end