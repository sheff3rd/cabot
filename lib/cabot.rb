require_relative 'cabot/configuration'
require_relative 'cabot/factory'

# Cabot Gem Definition (CGD)
module Cabot
  # GET
  module Index
    def self.call(model, current_user = {}, options = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Index.send(model)
      options.each do |key, value|
        params[key] = value
      end

      Factory.new(object::Index.(params, current_user: current_user))
    end
  end

  # GET /:id
  module Show
    def self.call(model, current_user = {}, options = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Show.send(model)
      options.each do |key, value|
        params[key] = value
      end

      Factory.new(object::Show.(params, current_user: current_user))
    end
  end

  # POST
  module Create
    def self.call(model, current_user = {}, options = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Create.send(model)
      options.each do |key, value|
        params[key] = value
      end

      Factory.new(object::Create.(params, current_user: current_user))
    end
  end

  # PUT
  module Update
    def self.call(model, current_user = {}, options = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Update.send(model)
      options.each do |key, value|
        params[key] = value
      end

      Factory.new(object::Update.(params, current_user: current_user))
    end
  end
end
