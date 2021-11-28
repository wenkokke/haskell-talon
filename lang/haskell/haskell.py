from talon import Context, Module, actions

mod = Module()

ctx = Context()
ctx.matches = r"""
mode: user.haskell
mode: user.auto_lang
and code.language: haskell
"""


def format_constructor(text: str):
    return actions.user.formatted_text(text, "PRIVATE_CAMEL_CASE")


def format_variable(text: str):
    return actions.user.formatted_text(text, "PUBLIC_CAMEL_CASE")


@ctx.action_class("user")
class UserActions:

    # support for comment_line

    def code_comment_line_prefix():
        actions.insert("-- ")

    # support for comment_block

    def code_comment_block():
        actions.user.code_comment_block_prefix()
        actions.user.code_comment_block_suffix()

    def code_comment_block_prefix():
        actions.insert("{- ")

    def code_comment_block_suffix():
        actions.insert(" -}")

    # support for comment_documentation

    def code_comment_documentation():
        actions.insert("-- | ")

    # support for data_bool

    def code_insert_true():
        actions.insert("True")

    def code_insert_false():
        actions.insert("False")

    # support for operators_math

    def code_operator_subtraction():
        actions.insert(" - ")

    def code_operator_addition():
        actions.insert(" + ")

    def code_operator_multiplication():
        actions.insert(" * ")

    def code_operator_exponent_integral():
        actions.insert(" ^ ")

    def code_operator_exponent_fractional():
        actions.insert(" ^^ ")

    def code_operator_exponent_floating():
        actions.insert(" ** ")

    def code_operator_exponent():
        actions.user.code_operator_exponent_integral()

    def code_operator_division_integral():
        actions.insert(" `div` ")

    def code_operator_division_fractional():
        actions.insert(" / ")

    def code_operator_division():
        actions.user.code_operator_division_integral()

    def code_operator_modulo_integral():
        actions.insert(" `mod` ")

    def code_operator_modulo():
        actions.user.code_operator_modulo_integral()

    def code_operator_equal():
        actions.insert(" == ")

    def code_operator_not_equal():
        actions.insert(" /= ")

    def code_operator_greater_than():
        actions.insert(" > ")

    def code_operator_greater_than_or_equal_to():
        actions.insert(" >= ")

    def code_operator_less_than():
        actions.insert(" < ")

    def code_operator_less_than_or_equal_to():
        actions.insert(" <= ")

    def code_operator_and():
        actions.insert(" && ")

    def code_operator_or():
        actions.insert(" || ")

    # support for haskell

    def code_operator_has_type():
        actions.insert(" :: ")

    def code_insert_constructor(text: str):
        constructor_name = format_constructor(text)
        actions.insert(f"{constructor_name} ")

    def code_insert_variable(text: str):
        variable_name = format_variable(text)
        actions.insert(f"{variable_name} ")

    def code_insert_data_type_declaration(text: str):
        type_name = format_constructor(text)
        actions.insert(f"data {type_name}")
        actions.edit.line_insert_down()
        actions.insert("= ")

    def code_insert_type_declaration(text: str):
        type_name = format_constructor(text)
        actions.insert(f"type {type_name} = ")

    def code_insert_newtype_declaration(text: str):
        type_name = format_constructor(text)
        actions.insert(f"newtype {type_name} = {type_name} ")

    def code_insert_function_declaration(text: str):
        function_name = format_variable(text)
        actions.insert(f"{function_name}")
        actions.user.code_operator_has_type()
        actions.edit.line_insert_down()
        actions.insert(f"{function_name} = _")
        actions.edit.up()
        actions.edit.line_end()

    def code_insert_pragma():
        actions.insert("{-#  #-}")
        actions.edit.left()
        actions.edit.left()
        actions.edit.left()
        actions.edit.left()

    def code_insert_language_pragma():
        actions.user.code_insert_pragma()
        actions.insert("LANGUAGE ")
