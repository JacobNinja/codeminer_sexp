module CodeMiner
  module Formatters

    class BodyMaybe < SexpFormatter

      def type
        :block
      end

      def to_sexp
        if exp.each.count == 1
          [exp.each.first]
        elsif
          exp.each.count == 0
          [Nil.new(exp, @parser).to_sexp]
        else
          [super]
        end
      end

    end

  end
end