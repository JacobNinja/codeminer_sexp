module CodeMiner
  module Formatters

    class Root < SexpFormatter

      def format(*args, children)
        if children.count <= 1
          children.first
        else
          body = BodyExpression.from(*children)
          Body.new(body, @parser).to_sexp
        end
      end

    end

  end
end