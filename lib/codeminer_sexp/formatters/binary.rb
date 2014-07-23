require File.expand_path('../call', __FILE__)

module CodeMiner
  module Formatters

    class Binary < Call

      def each
        exp.each.drop(1)
      end

      def to_sexp
        if match3?
          format(:match3, @parser.to_sexp(exp.body), [exp.receiver])
        else
          super
        end
      end

      private

      def match3?
        exp.value == '=~' && exp.body.type == :regexp
      end

    end

  end
end