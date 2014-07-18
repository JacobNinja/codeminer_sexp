require File.expand_path('../ensure', __FILE__)
require File.expand_path('../rescue', __FILE__)
require File.expand_path('../rescue_formatter', __FILE__)
require File.expand_path('../body_maybe', __FILE__)

module CodeMiner
  module Formatters

    class Defn < SexpFormatter

      include RescueFormatter

      def value
        value = super
        value.to_sym if value
      end

      def to_sexp
        format(type, value, @parser.to_sexp(exp.params), process(exp.body))
      end

      def format(*nodes, body)
        if body.empty?
          Sexp.new([*nodes, Nil.new(exp, @parser).to_sexp], exp)
        else
          super
        end
      end

    end

  end
end