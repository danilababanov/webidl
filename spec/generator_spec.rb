require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Generator do

  it "generates an empty interface" do
    expected = %Q{module System\n  # do nothing\nend}
    actual   = generate(fixture('empty_interface.idl'))

    actual.should == expected
  end

  it "generates an exception" do
    expected = <<-RUBY
class FrameworkException < StandardError
  ERR_NOT_FOUND = 1
  attr_accessor(:code)
end
RUBY

    actual = generate(fixture('exception.idl'))
    actual.should == expected.strip
  end

  it "generates an interface with attributes" do
    expected = <<-RUBY
module Foo
  attr_accessor(:const)
  attr_accessor(:value)
end
RUBY

    actual = generate(fixture('interface_with_attribute.idl'))
    actual.should == expected.strip
  end

  it "generates an interface with a member operation" do
    expected = <<-RUBY
module System
  def create_object(interface)
    raise(NotImplementedError)
  end
end
RUBY

    actual = generate(fixture("interface_with_members.idl"))
    actual.should == expected.strip
  end

  it "generates an implements statement" do
    expected = <<-RUBY
module Bar
  # do nothing
end

module Baz
  # do nothing
end

module Bar
  include(Baz)
end
RUBY

    actual = generate(fixture("implements_statement.idl"))
    actual.should == expected.strip
  end

  it "generates code for no-name setters, getters, creators, stringifier and deleters" do
    expected = <<-RUBY
module Foo
  def initialize(foo)
    raise(NotImplementedError)
  end
  def []=(key, value)
    raise(NotImplementedError)
  end
  def [](key)
    raise(NotImplementedError)
  end
  def to_s
    raise(NotImplementedError)
  end
  def delete!
    raise(NotImplementedError)
  end
end
RUBY

    actual = generate(fixture("interface_with_specials.idl"))
    actual.should == expected.strip
  end

  it "accepts an array of AST nodes or a single AST node as input" do
    ast_nodes = parse(fixture("implements_statement.idl")).build


    lambda { generate(ast_nodes.first)  }.should_not raise_error
    lambda { generate(ast_nodes)  }.should_not raise_error
  end
end
