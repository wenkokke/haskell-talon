mode: command
and mode: user.haskell
mode: command
and mode: user.auto_lang
and code.language: haskell
-
tag(): user.code_comment_line
tag(): user.code_comment_block
tag(): user.code_comment_documentation
tag(): user.code_data_bool
tag(): user.code_operators_math

# support for operators_math (extended)
op (integral | integer) divide:
  user.code_operator_division_integral()
op (fractional | real) divide :
  user.code_operator_division_fractional()
op (integral | integer) mod:
  user.code_operator_modulo_integral()
op (integral | integer) (power | exponent):
  user.code_operator_exponent_integral()
op (fractional | real) (power | exponent):
  user.code_operator_exponent_fractional()
op (floating | float) (power | exponent):
  user.code_operator_exponent_floating()

has type:
  user.code_operator_has_type()

(deaf | define) data [type] <user.text>:
  user.code_insert_data_type_declaration(text)
(deaf | define) type [alias] <user.text>:
  user.code_insert_type_declaration(text)
(deaf | define) new type <user.text>:
  user.code_insert_newtype_declaration(text)
(deaf | define) (funk | function) <user.text>:
  user.code_insert_function_declaration(text)

con <user.text>:
  user.code_insert_constructor(text)

var <user.text>:
  user.code_insert_variable(text)

pragma:
  user.code_insert_pragma()

language pragma:
  user.code_insert_language_pragma()
