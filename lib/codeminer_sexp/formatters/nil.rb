module CodeMiner
  module Formatters

    class Nil < SexpFormatter

      def type
        :nil
      end

      def to_sexp
        format(type, [])
      end

    end

  end
end