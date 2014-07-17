module CodeMiner
  module Formatters

    class PositionalParam < SexpFormatter

      def to_sexp
        exp.value.to_sym
      end

    end

  end
end