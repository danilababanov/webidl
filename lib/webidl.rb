require "treetop"
require "ruby2ruby"


require "webidl/extensions/syntax_node"

require "webidl/parse_tree/definitions"
require "webidl/parse_tree/module"
require "webidl/parse_tree/attribute"
require "webidl/parse_tree/typedef"
require "webidl/parse_tree/interface"
require "webidl/parse_tree/argument"
require "webidl/parse_tree/argument_list"
require "webidl/parse_tree/extended_attributes"
require "webidl/parse_tree/relative_scoped_name"
require "webidl/parse_tree/absolute_scoped_name"
require "webidl/parse_tree/nullable_type"
require "webidl/parse_tree/interface_members"
require "webidl/parse_tree/operation"

require "webidl/ast/node"
require "webidl/ast/module"
require "webidl/ast/typedef"
require "webidl/ast/interface"
require "webidl/ast/extended_attribute"
require "webidl/ast/argument"
require "webidl/ast/type"
require "webidl/ast/scoped_name"

require "webidl/parser/debug_helper"
require "webidl/parser/idl"
# Treetop.load("#{File.dirname(__FILE__)}/webidl/parser/idl")
