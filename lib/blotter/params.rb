module Blot
  class Params
    attr_accessor :__params

    def initialize
      @__params = []
    end

    def [](x)
      @__params[x]
    end

    def method_missing(method, *args, &block)
      @__params << [method, (args[0].respond_to?(:to_a) ? args[0].to_a : args)] if args.any?
    end

  end
end
