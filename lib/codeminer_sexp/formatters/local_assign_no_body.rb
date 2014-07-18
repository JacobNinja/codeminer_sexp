module CodeMiner
  module Formatters

    class LocalAssignNoBody < LocalAssign

      def to_sexp
        format(type, value, [])
      end

    end

  end
end