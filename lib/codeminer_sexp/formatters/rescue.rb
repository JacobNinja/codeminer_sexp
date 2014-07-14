require File.expand_path('../rescue_body', __FILE__)
require File.expand_path('../rescue_match', __FILE__)

module CodeMiner
  module Formatters

    class Rescue < SexpFormatter

      def initialize(*args, body)
        super(*args)
        @body = body
      end

      def type
        :rescue
      end

      def each
        [RescueBody.new(exp.body, @parser, RescueMatch.new(exp.match, @parser)).to_sexp]
      end

      def to_sexp
        format(type, *@parser.to_sexp(@body), each)
      end

    end

  end
end