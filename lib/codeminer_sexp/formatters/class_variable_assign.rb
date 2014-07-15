module CodeMiner
  module Formatters

    class ClassVariableAssign < SexpFormatter

      def type
        :casgn
      end

      def value
        value = super
        value.to_sym if value
      end

    end

  end
end