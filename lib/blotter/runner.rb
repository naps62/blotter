module Blot
  class Runner
    def initialize(bin, params, kbest)
      @bin = bin
      @params = params
      @kbest = kbest
      run
    end

    def run
      params = stringify_params(@params)
      binding.pry
    end

    protected

    def stringify_params(params)
      head, *rest = params.__params.map do |name, vals|
        vals.map { |val| "#{name} #{val}"}
      end
      params = head.product(*rest).map do |param|
        {
          dirname: param.join('__').gsub(' ', '_'),
          cmd_args: param.map {|arg| "--#{arg}"}.join(' ')
        }
      end
    end
  end
end
