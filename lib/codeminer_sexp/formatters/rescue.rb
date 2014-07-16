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
        [*@body.each, RescueBody.new(exp.body, @parser, RescueMatch.new(exp.match, @parser)).to_sexp]
      end

    end

  end
end