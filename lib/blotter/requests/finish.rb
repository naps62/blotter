require 'blotter/request'

module Blotter
  class FinishRequest < Request
    def process(client)
      client.finish = self
    end
  end
end
