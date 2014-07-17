module CodeMiner
  module Formatters

    class AttributeAssign < SexpFormatter

      def type
        :attrasgn
      end

      def to_sexp
        format(type, [exp.receiver, :"#{exp.value}=", exp.body])
      end

    end

  end
end