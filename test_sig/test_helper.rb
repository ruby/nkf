require "rbs/unit_test"

module TestHelper
  include RBS::UnitTest::TypeAssertions
  include RBS::UnitTest::Convertibles

  def self.included(base)
    base.extend RBS::UnitTest::TypeAssertions::ClassMethods
  end
end
