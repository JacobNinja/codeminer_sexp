module CodeMiner
  module Formatters

    class DestructuredParams < SexpFormatter

      def each
        exp.each.map(&:value).map(&:to_sym)
      end

      def to_sexp
        format(:masgn, each)
      end

    end

  end
end