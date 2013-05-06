require 'blotter/params'
require 'blotter/kbest'
require 'blotter/runner'

require 'pry'

module Blot

  def self.bin(name)
    @@bin = name.to_s
  end

  def self.params(&block)
    @@params = Params.new
    @@params.instance_eval(&block)
  end

  def self.kbest(&block)
    @@kbest = KBest.new
    @@kbest.instance_eval(&block)
  end

  def self.run
    @@params ||= Params.new
    @@kbest  ||= KBest.new
    Runner.new @@bin, @@params, @@kbest
  end
end
