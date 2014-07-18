require File.expand_path('../ensure', __FILE__)
require File.expand_path('../rescue', __FILE__)

module CodeMiner
  module Formatters

    class Begin < SexpFormatter

      def type
        :block
      end

      def each
        if exp.rescue
          [rescue_expression]
        else
          exp.body
        end
      end

      def to_sexp
        if exp.rescue && exp.ensure
          ensure_expression([rescue_expression]).to_sexp
        elsif exp.rescue
          rescue_expression
        elsif exp.ensure
          ensure_expression(body_maybe)
        else
          format(type, value, exp.body.each)
        end
      end

      def format(*nodes, body)
        if body.empty?
          Nil.new(exp, @parser).to_sexp
        elsif body.count == 1
          body.first
        else
          super
        end
      end

      private

      def rescue_expression
        Rescue.new(exp.rescue, @parser, body_maybe).to_sexp
      end

      def ensure_expression(body)
        Ensure.new(exp.ensure, @parser, body).to_sexp
      end

      def body_maybe
        BodyMaybe.new(exp.body, @parser).to_sexp
      end

    end

  end
end