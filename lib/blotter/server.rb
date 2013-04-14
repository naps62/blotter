module Blotter
  class Server
    def initialize(port: 6200, logger: Logger.new('blotter.log'))
      server = TCPServer.open port
      loop { Client.new server.accept, logger }
    end
  end
end
