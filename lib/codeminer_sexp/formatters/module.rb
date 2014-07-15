module CodeMiner
  module Formatters

    class Module < CodeMiner::SexpFormatter

      def to_sexp
        format(type, value, exp.body.each)
      end

      def value
        super.to_sym
      end

    end

  end
end