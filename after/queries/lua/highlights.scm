;; extends

;; Operators

;; Relational Operators

[
 "=="
 "~="
 ">"
 "<"
 ">="
 "<="
 ] @punctuation.special

;; Bitwise Operators

[
 "&"
 "|"
 "~"
 "<<"
 ">>"
 ] @exception

;; Arithmetic

[
  "+"
  "-"
  "*"
  "^"
  "%"
  "/"
  "//"
 ] @text.math

[
 ".."
 ] @character.special

(unary_expression
  [
  "#"
] @constructor)

;; Constants

(vararg_expression) @label

;; Variables

((identifier) @constant.builtin
  (#eq? @constant.builtin "_ENV"))

;; Tables

(field name: (identifier) @definition.field)

;; From locals.scm

(assignment_statement
  (variable_list
    (identifier) @definition))

(variable_declaration
  (variable_list
    (identifier) @definition.var))

(variable_declaration
  (assignment_statement
    (variable_list
      (identifier) @definition.var)))

((function_declaration
  name: (identifier) @definition.function)
  (#set! definition.function.scope "parent"))

;; Functions

(dot_index_expression
  table: (identifier) @namespace.builtin
    (#any-of? @namespace.builtin
      "vim" ))

(arguments (identifier) @definition.parameter)

(bracket_index_expression field: (identifier) @definition.enum)
