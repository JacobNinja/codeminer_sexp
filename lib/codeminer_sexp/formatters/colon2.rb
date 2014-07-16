module CodeMiner
  module Formatters

    class Colon2 < CodeMiner::SexpFormatter

      def value
        super.to_sym
      end

      def to_sexp
        format(type, @parser.to_sexp(exp.body), [value])
      end

    end

  end
end