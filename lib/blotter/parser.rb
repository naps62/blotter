require 'json'
require 'pry'

module Blotter
  class Parser
    attr_accessor :data

    def initialize(input)
      @input = input
    end

    def parse
      @data = JSON.parse(@input.read)
      result = Blotter::Result.new
      @data.each do |cmd|
        result << cmd
      end
      binding.pry
    end
  end
end
