# Cabot gem
class Cabot
  attr_accessor :result, :model, :serializer

  def initialize(result)
    @result = result
    @model = result[:model]
    @serializer = result[:serializer]
  end

  # GET
  module Index
    def self.call(model, current_user = {}, options = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Index.send(model)
      options.each do |key, value|
        params[key] = value
      end

      Cabot.new(object::Index.(params: params, current_user: current_user))
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

      Cabot.new(object::Show.(params: params, current_user: current_user))
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

      Cabot.new(object::Create.(params: params, current_user: current_user))
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

      Cabot.new(object::Update.(params: params, current_user: current_user))
    end
  end
end
