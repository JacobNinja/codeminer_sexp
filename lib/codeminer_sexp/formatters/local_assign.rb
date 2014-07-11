module CodeMiner
  module Formatters

    class LocalAssign < SexpFormatter

      def type
        :lasgn
      end

      def value
        value = super
        value.to_sym if value
      end

    end

  end
end