require 'json'
require 'blotter/exceptions'

module Blotter
  class Request
    attr_accessor :raw, :data, :cmd, :args

    COMMANDS = {
      init:   'InitRequest',
      finish: 'FinishRequest'
    }

    def initialize(raw, data)
      @raw = raw
      @data = data
    end

    def self.instantiate(raw)
      data = JSON.parse(raw)
      cmd = data.keys.first.to_sym
      if COMMANDS.keys.include? cmd
        Kernel.const_get("Blotter::#{COMMANDS[cmd]}").new(raw, data)
      else
        raise UnknownCommandException.new(cmd)
      end
    end
  end
end

require 'blotter/requests/init'
require 'blotter/requests/finish'
