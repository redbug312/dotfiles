; extends

"?" @function.builtin
"::" @namespace

(mutable_specifier) @operator

(attribute_item
  ["#" "[" "]"] @attribute.bracket
  (_
    (identifier) @attribute.name
    arguments: (_ ["(" ")"] @attribute.bracket)))

(scoped_identifier
  path: (identifier) @namespace)

; (macro_invocation
;   macro: (identifier) @debug
;   (#eq? @debug "dbg")) @debug
