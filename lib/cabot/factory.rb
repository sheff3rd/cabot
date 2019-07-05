module Cabot
  class Factory
    attr_accessor :result, :model, :serializer

    def initialize(result)
      @result = result
      @model = result[Cabot.configuration.symbolize_keys ? :model : "model"]
      @serializer = result[Cabot.configuration.symbolize_keys ? :serializer : "serializer"]
    end
  end
end
