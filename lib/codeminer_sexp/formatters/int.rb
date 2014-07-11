module CodeMiner
  module Formatters

    class Int < SexpFormatter

      def type
        :lit
      end

      def value
        super.to_i
      end

    end

  end
end