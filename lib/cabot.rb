class Cabot

  # GET
  module Index
    def self.call(model, current_user = {})
      object = model.capitalize.constantize
      params = Cabot::Parameters::Create.send(model)

      object::Index.(params: params, current_user: current_user)
    end
  end

  # GET /:id
  module Show
    def self.call(model, current_user = {})
      object = model.to_s.capitalize.constantize
      params = Cabot::Parameters::Show.send(model)

      object::Show.(params: params, current_user: current_user)
    end
  end

  # POST
  module Create
    def self.call(model, current_user = {})
      object = model.to_s.capitalize.constantize
      params = Cabot::Parameters::Create.send(model)

      object::Create.(params: params, current_user: current_user)
    end
  end

  # PUT
  module Update
    def self.call(model, current_user = {})
      object = model.capitalize.constantize
      params = Cabot::Parameters::Update.send(model)

      object::Update.(params: params, current_user: current_user)
    end
  end
end
