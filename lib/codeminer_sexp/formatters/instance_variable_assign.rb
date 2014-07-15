module CodeMiner
  module Formatters

    class InstanceVariableAssign < SexpFormatter

      def type
        :iasgn
      end

      def value
        value = super
        value.to_sym if value
      end

    end

  end
end