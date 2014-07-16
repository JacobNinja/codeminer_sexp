require File.expand_path('../rescue', __FILE__)

module CodeMiner
  module Formatters

    class Defs < Defn

      def to_sexp
        if exp.body.rescue
          format(type, @parser.to_sexp(exp.receiver), value, [exp.params, rescue_expression])
        else
          format(type, exp.receiver, value, [exp.params, *exp.body.each])
        end
      end

    end

  end
end