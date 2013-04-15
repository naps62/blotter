require 'pry'

module Blotter
  class Result
    attr_accessor :name, :values, :tables

    def initialize
      @values = {}
      @tables = {}
    end

    def <<(command)
      self.send command["cmd"], command["params"]
    end

    def init(params)
      @name = params["name"]
    end

    def set(params)
      @values[params["name"]] = params["value"]
    end

    def push(params)
      @tables[params["table"]] ||= {}
      @tables[params["table"]][params["name"]] ||= []
      @tables[params["table"]][params["name"]] << params["value"]
    end

  end
end
