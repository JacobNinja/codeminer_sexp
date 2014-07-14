module CodeMiner
  module Formatters

    class GlobalVariable < SexpFormatter

      def type
        :gvar
      end

      def value
        super.to_sym
      end

    end

  end
end