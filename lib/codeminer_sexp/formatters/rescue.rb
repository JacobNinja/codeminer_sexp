require File.expand_path('../rescue_body', __FILE__)
require File.expand_path('../rescue_match', __FILE__)

module CodeMiner
  module Formatters

    class Rescue < SexpFormatter

      def initialize(*args, body, else_exp)
        super(*args)
        @body = body
        @else_exp = else_exp
      end

      def type
        :rescue
      end

      def each
        [*@body, RescueBody.new(exp.body, @parser, RescueMatch.new(exp, @parser)).to_sexp, *else_body]
      end

      private

      def else_body
        BodyMaybe.new(@else_exp, @parser).to_sexp if @else_exp
      end

    end

  end
end