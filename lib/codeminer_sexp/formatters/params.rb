module CodeMiner
  module Formatters

    class Params < CodeMiner::SexpFormatter

      def type
        :args
      end

      def format(*args, children)
        positional, optional, keyword = children
        super(*args, [*positional.each.map(&:value), *optional_to_lasgn(optional), *keyword_to_kwarg(keyword)])
      end

      private

      def optional_to_lasgn(optional)
        optional.each.map do |param|
          @parser.to_sexp(CodeMiner::LocalAssignExpression.new(param.token, param.value, param.src_extract))
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