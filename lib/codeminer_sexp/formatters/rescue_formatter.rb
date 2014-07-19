module CodeMiner
  module Formatters

    module RescueFormatter

      def process(exp)
        if exp.rescue && exp.ensure
          [ensure_expression(exp, [rescue_expression(exp)])]
        elsif exp.rescue
          [rescue_expression(exp)]
        elsif exp.ensure
          [ensure_expression(exp, body_maybe(exp))]
        else
          exp.each
        end
      end

      def rescue_expression(exp)
        Rescue.new(exp.rescue, @parser, body_maybe(exp), exp.else).to_sexp
      end

      def ensure_expression(exp, body)
        Ensure.new(exp.ensure, @parser, body).to_sexp
      end

      def body_maybe(exp)
        BodyMaybe.new(exp.body, @parser).to_sexp
      end

    end

  end
end