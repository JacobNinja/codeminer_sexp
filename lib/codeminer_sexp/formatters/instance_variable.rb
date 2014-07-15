module CodeMiner
  module Formatters

    class InstanceVariable < SexpFormatter

      def type
        :ivar
      end

      def value
        super.to_sym
      end

    end

  end
end