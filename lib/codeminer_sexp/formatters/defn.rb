require File.expand_path('../ensure', __FILE__)
require File.expand_path('../rescue', __FILE__)
require File.expand_path('../body_maybe', __FILE__)

module CodeMiner
  module Formatters

    class Defn < SexpFormatter

      def value
        value = super
        value.to_sym if value
      end

      def to_sexp
        if exp.body.rescue && exp.body.ensure
          format(type, value, @parser.to_sexp(exp.params), [ensure_expression([rescue_expression])])
        elsif exp.body.rescue
          format(type, value, @parser.to_sexp(exp.params), [rescue_expression])
        elsif exp.body.ensure
          format(type, value, @parser.to_sexp(exp.params), [ensure_expression(body_maybe)])
        else
          format(type, value, @parser.to_sexp(exp.params), exp.body.each)
        end
      end

      def format(*nodes, body)
        if body.empty?
          Sexp.new([*nodes, Nil.new(exp, @parser).to_sexp], exp)
        else
          super
        end
      end

      private

      def rescue_expression
        Rescue.new(exp.body.rescue, @parser, body_maybe).to_sexp
      end

      def ensure_expression(body)
        Ensure.new(exp.body.ensure, @parser, body).to_sexp
      end

      def body_maybe
        BodyMaybe.new(exp.body.body, @parser).to_sexp
      end

    end

  end
end