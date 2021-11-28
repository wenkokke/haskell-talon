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
  insert(" :: ")

con <user.text>:
  constructor_name = format_constructor(text)
  insert(f"{constructor_name} ")

var <user.text>:
  variable_name = format_variable(text)
  insert(f"{variable_name} ")

(deaf | define) data [type] <user.text>:
  type_name = format_constructor(text)
  insert(f"data {type_name}")
  edit.line_insert_down()
  insert("= ")

(deaf | define) type [alias] <user.text>:
  type_name = format_constructor(text)
  insert(f"type {type_name} = ")

(deaf | define) new type <user.text>:
  type_name = format_constructor(text)
  insert(f"newtype {type_name} = {type_name} ")

(deaf | define) (funk | function) <user.text>:
  function_name = format_variable(text)
  insert(f"{function_name} :: ")
  edit.line_insert_down()
  insert(f"{function_name} = _")
  edit.up()
  edit.line_end()

pragma:
  insert("{-#  #-}")
  edit.left()
  edit.left()
  edit.left()
  edit.left()

language pragma:
  insert("{-# LANGUAGE  #-}")
  edit.left()
  edit.left()
  edit.left()
  edit.left()
