require File.expand_path('../call', __FILE__)

module CodeMiner
  module Formatters

    class Binary < Call

      def each
        exp.each.drop(1)
      end

      def to_sexp
        if exp.value == '=~'
          format(:match3, @parser.to_sexp(exp.body), [exp.receiver])
        else
          super
        end
      end

    end

  end
end