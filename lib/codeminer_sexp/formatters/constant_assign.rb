module CodeMiner
  module Formatters

    class ConstantAssign < SexpFormatter

      def type
        :cdecl
      end

      def value
        value = super
        value.to_sym if value
      end

    end

  end
end