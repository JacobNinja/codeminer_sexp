module CodeMiner
  module Formatters

    class Params < CodeMiner::SexpFormatter

      def type
        :args
      end

      def to_sexp
        format(type, [*exp.positional.each.map(&:value), *optional_to_lasgn(exp.optional), *keyword_to_kwarg(exp.keyword)])
      end

      private

      def optional_to_lasgn(optional)
        optional.each.map do |param|
          CodeMiner::LocalAssignExpression.new(param.token, param.value, param.src_extract)
        end
      end

      def keyword_to_kwarg(keyword)
        keyword.each.map do |param|
          KeywordParam.new(param, @parser).to_sexp
        end
      end

    end

  end
end