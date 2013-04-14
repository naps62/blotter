module Blotter
  class CommandException < Exception
    attr_accessor :request

    def initialize(request)
      @request = request
    end

    def to_s
      request.to_s + self.backtrace
    end
  end


  class InitCommandException < CommandException
    def to_s
      "Expected InitRequest. Got #{@request.class}: '#{request.raw}'" + self.backtrace
    end
  end


  class AbstractCommandException < CommandException
    def to_s
      "Attempted to instantiate Request (abstract)" + self.backtrace
    end
  end


  class UnknownCommandException < Exception
    attr_accessor :cmd

    def initialize(cmd)
      @cmd = cmd
    end

    def to_s
      "Unkown Command: #{@cmd}" + self.backtrace
    end
  end
end
