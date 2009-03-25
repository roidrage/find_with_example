require 'test_helper'

class FindWithExampleTest < ActiveSupport::TestCase
  def setup
    @example1 = Example.create!(:name => "regular")
    @example2 = Example.create!(:name => "irregular", :version => 2)
  end
  
  def teardown
    Example.delete_all
  end
  
  test "should find results for columns that are not nil" do
    example = Example.new(:name => "regular")
    result = Example.find_with_example(example)
    assert_equal @example1, result.first
  end
  
  test "should not query results with columns that are nil" do
    example = Example.new(:name => nil, :version => 2)
    result = Example.find_with_example(example)
    assert_equal 1, result.size
    assert_equal @example2, result.first
  end
  
  test "should also support a hash as an example" do
    result = Example.find_with_example(:name => "regular")
    assert_equal 1, result.size
    assert_equal @example1, result.first
  end
  
  test "should weed out attributes not supported by the current model" do
    result = Example.find_with_example(:name => "regular", :surname => "expression")
    assert_equal 1, result.size
    assert_equal @example1, result.first
  end
end
