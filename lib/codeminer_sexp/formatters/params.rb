module CodeMiner
  module Formatters

    class Params < CodeMiner::SexpFormatter

      def type
        :args
      end

      def to_sexp
        params = [*positional, *optional_to_lasgn(exp.optional), *keyword_to_kwarg(exp.keyword)]
        params << splat if exp.splat
        format(type, params)
      end

      private

      def positional
        exp.positional.each.map(&:value).map(&:to_sym)
      end

      def splat
        exp.splat.src.to_sym
      end

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