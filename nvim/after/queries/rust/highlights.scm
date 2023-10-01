; extends

"?" @exception.operator
"::" @namespace

(mutable_specifier) @type.qualifier

(attribute_item
  ["#" "[" "]"] @attribute
  (_
    (identifier) @attribute
    arguments: (_ ["(" ")"] @attribute) @attribute))

(scoped_identifier
  path: (identifier) @namespace)

(scoped_type_identifier
  path: (identifier) @namespace)

(visibility_modifier
  "(" @namespace
  [(crate) (super) (self)] @keyword
  ")" @namespace)

; (macro_invocation
;   macro: (identifier) @function.macro
;   "!" @function.macro)

(macro_invocation
  macro: (identifier) @debug
  "!" @debug.delimiter
  _ @function.call
  (#eq? @debug "dbg")) @debug
