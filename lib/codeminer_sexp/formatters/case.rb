module CodeMiner
  module Formatters

    class Case < CodeMiner::SexpFormatter

      def each
        if exp.else_exp
          [*exp.each.take(exp.each.length - 1), *exp.else_exp.body.each]
        else
          exp.each
        end
      end

    end

  end
end