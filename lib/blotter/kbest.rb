module Blot
  class KBest
    attr_accessor :min_execs,
                  :max_execs,
                  :diff,
                  :type,
                  :value_name

    def initialize
      @min_execs = 1
      @max_execs = 1
      @diff = 0
      @type = :minimize
      @value_name = :walltime
    end

    def min_execs(n)
      @min_execs = n
    end

    def max_execs(n)
      @max_execs = n
    end

    def diff(percent)
      @diff = percent
    end

    def minimize(value_name)
      @type = :minimize
      @value_name = value_name
    end

    def maximize(value_name)
      @type = :maximize
      @value_name = value_name
    end
  end
end
