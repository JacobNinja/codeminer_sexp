require File.expand_path('../rescue', __FILE__)

module CodeMiner
  module Formatters

    class Defn < SexpFormatter

      def value
        value = super
        value.to_sym if value
      end

      def to_sexp
        if exp.body.rescue
          format(type, value, exp.params, [Rescue.new(exp.body.rescue, @parser, exp.body.body.each).to_sexp])
        else
          format(type, value, exp.params, exp.body.each)
        end
      end

      def format(*nodes, body)
        if body.empty?
          Sexp.new([*nodes, [:nil]], exp)
        else
          super
        end
      end

    end

  end
end