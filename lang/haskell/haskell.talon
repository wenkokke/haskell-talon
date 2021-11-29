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
  insert(" `div` ")
op (fractional | real) divide :
  insert(" / ")
op (integral | integer) mod:
  insert(" `mod` ")
op (integral | integer) (power | exponent):
  insert(" ^ ")
op (fractional | real) (power | exponent):
  insert(" ^^ ")
op (floating | float) (power | exponent):
  insert(" ** ")

has type:
  insert(" :: ")

con <user.text>:
  constructor_name = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
  insert("{constructor_name} ")

var <user.text>:
  variable_name = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
  insert("{variable_name} ")

(deaf | define) data [type] <user.text>:
  type_name = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
  insert("data {type_name}")
  edit.line_insert_down()
  insert("= ")

(deaf | define) type [alias] <user.text>:
  type_name = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
  insert("type {type_name} = ")

(deaf | define) new type <user.text>:
  type_name = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
  insert("newtype {type_name} = {type_name} ")

(deaf | define) (funk | function) <user.text>:
  function_name = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
  insert("{function_name} :: ")
  edit.line_insert_down()
  insert("{function_name} = _")
  edit.up()
  edit.line_end()

import [<user.text>]:
  module_name = user.formatted_text(text or "", "DOT_SEPARATED,CAPITALIZE_ALL_WORDS")
  insert("import {module_name}")

using:
  insert(" ()")
  edit.left()

qualified as [<user.text>]:
  module_name = user.formatted_text(text or "", "DOT_SEPARATED,CAPITALIZE_ALL_WORDS")
  insert(" qualified as {module_name}")

pragma:
  insert("{{-#  #-}}")
  edit.left()
  edit.left()
  edit.left()
  edit.left()

language pragma:
  insert("{{-# LANGUAGE  #-}}")
  edit.left()
  edit.left()
  edit.left()
  edit.left()
