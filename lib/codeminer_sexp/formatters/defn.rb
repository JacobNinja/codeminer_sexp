module CodeMiner
  module Formatters

    class Defn < SexpFormatter

      def value
        value = super
        value.to_sym if value
      end

      def to_sexp
        format(type, value, exp.params, exp.body.each)
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