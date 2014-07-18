require File.expand_path('../rescue', __FILE__)
require File.expand_path('../rescue_formatter', __FILE__)

module CodeMiner
  module Formatters

    class Defs < Defn

      include RescueFormatter

      def to_sexp
        format(type, @parser.to_sexp(exp.receiver), value, [exp.params, *process(exp.body)])
      end

    end

  end
end