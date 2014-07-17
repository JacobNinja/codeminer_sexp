require File.expand_path('../codeminer_sexp/formatters/aref_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/arglist', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/arguments', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/attribute_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/array', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/iter', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/block_pass', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/body', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/binary', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/call', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/case', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/class', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/class_variable', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/class_variable_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/condition', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/constant', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/constant_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/colon2', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/colon2_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/colon3', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/colon3_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/defn', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/defs', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/destructured_params', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/dynamic_string', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/global_variable', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/global_variable_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/instance_variable', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/instance_variable_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/int', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/keyword_param', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/local_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/local_variable', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/module', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/nil', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/op_assign', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/params', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/positional_param', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/rescue', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/rescue_body', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/rescue_match', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/root', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/sclass', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/string', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/string_embexp', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/super', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/symbol', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/unary', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/void', __FILE__)
require File.expand_path('../codeminer_sexp/formatters/when', __FILE__)

module CodeMiner

  module Formatters

    SEXP_FORMATTERS = {
        call: Call,
        dynamic_string: DynamicString,
        string_embexp: StringEmbexp,
        string: String,
        root: Root,
        params: Params,
        int: Int,
        assign: LocalAssign,
        condition: Condition,
        binary: Binary,
        command: Call,
        void: Void,
        defn: Defn,
        defs: Defs,
        constant: Constant,
        global_variable: GlobalVariable,
        global_variable_assign: GlobalVariableAssign,
        local_variable: LocalVariable,
        instance_variable: InstanceVariable,
        instance_variable_assign: InstanceVariableAssign,
        class: Class,
        module: Module,
        constant_assign: ConstantAssign,
        aref_assign: ArefAssign,
        colon2: Colon2,
        colon2_assign: Colon2Assign,
        colon3: Colon3,
        colon3_assign: Colon3Assign,
        array: Array,
        symbol: Symbol,
        sclass: SClass,
        case: Case,
        when: When,
        arguments: Arguments,
        attribute_assign: AttributeAssign,
        op_assign: OpAssign,
        super: Super,
        unary: Unary,
        destructured_params: DestructuredParams,
        positional_param: PositionalParam,
    }

  end

end