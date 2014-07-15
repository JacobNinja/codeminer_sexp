module CodeMiner
  module Formatters

    class GlobalVariableAssign < SexpFormatter

      def type
        :gasgn
      end

      def value
        value = super
        value.to_sym if value
      end

    end

  end
end