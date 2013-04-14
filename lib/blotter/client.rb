module Blotter
  class Client
    attr_accessor :init, :finish

    def initialize(socket, logger)
      @socket = socket
      @logger = logger
      @logger.info "new client connected: #{@socket.addr.last}"
      Thread.new { listen }
    end

    def listen
      begin
        get_init_request
        while @finish.nil? do
          get_request
        end
      rescue Exception => e
        puts e.to_s
      ensure
        @socket.close
      end
    end

    def get_init_request
      request = Request.instantiate(self.read)
      raise InitRequestException(request) if request.class != InitRequest
      process(request)
    end

    def get_request
      request = Request.instantiate(self.read)
      request.process(self)
    end

    def process(request)
      addr = @socket.addr.last
      type = request.class.to_s.split('::').last
      @logger.info "#{addr}: #{type}"
      request.process(self)
    end

    def read
      @socket.gets.strip
    end

  end
end
