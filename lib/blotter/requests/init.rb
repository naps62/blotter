require 'blotter/request'

module Blotter
  class InitRequest < Request
    def name
      @data['init']
    end

    def process(client)
      client.init = self
    end
  end
end
