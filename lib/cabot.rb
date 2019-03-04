# Cabot gem
class Cabot
  def initialize(result)
    @result = result
  end

  def model
    @model ||= @result[:model]
  end

  def serializer
    @serializer ||= @result[:serializer]
  end


  # GET
  module Index
    def self.call(model, current_user = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Index.send(model)

      Cabot.new(object::Index.(params: params, current_user: current_user))
    end
  end

  # GET /:id
  module Show
    def self.call(model, current_user = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Show.send(model)

      Cabot.new(object::Show.(params: params, current_user: current_user))
    end
  end

  # POST
  module Create
    def self.call(model, current_user = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Create.send(model)

      Cabot.new(object::Create.(params: params, current_user: current_user))
    end
  end

  # PUT
  module Update
    def self.call(model, current_user = {})
      object = model.to_s.camelize.constantize
      params = Cabot::Parameters::Update.send(model)

      Cabot.new(object::Update.(params: params, current_user: current_user))
    end
  end
end
