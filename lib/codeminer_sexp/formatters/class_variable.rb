module CodeMiner
  module Formatters

    class ClassVariable < SexpFormatter

      def type
        :cvar
      end

      def value
        super.to_sym
      end

    end

  end
end