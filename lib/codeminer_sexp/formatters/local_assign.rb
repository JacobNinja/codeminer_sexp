module CodeMiner
  module Formatters

    class LocalAssign < SexpFormatter

      def type
        :lasgn
      end

      def value
        super.to_sym
      end

    end

  end
end