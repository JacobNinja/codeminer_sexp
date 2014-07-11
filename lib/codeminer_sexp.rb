require File.expand_path('../codeminer_sexp/formatters/body', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/bodystmt', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/call', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/condition', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/dynamic_string', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/int', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/keyword_param', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/local_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/params', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/root', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/string', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/string_embexp', __FILE__)

module CodeMiner

  module Formatters

    SEXP_FORMATTERS = {
        call: Call,
        dynamic_string: DynamicString,
        string_embexp: StringEmbexp,
        string: String,
        root: Root,
        params: Params,
        bodystmt: Bodystmt,
        int: Int,
        assign: LocalAssign,
        condition: Condition,
        binary: Call,
    }

  end

end