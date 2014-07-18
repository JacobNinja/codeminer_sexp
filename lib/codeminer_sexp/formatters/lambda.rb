module CodeMiner
  module Formatters

    class Lambda < SexpFormatter

      def to_sexp
        token = Token.new(:token, 'lambda', exp.src_extract)
        body = CallExpression.new(token, exp.src_extract)
        Iter.new(exp, @parser, @parser.to_sexp(body)).to_sexp
      end

    end

  end
end