# frozen_string_literal: false
require 'test/unit'
require 'core_assertions'
require 'nkf'

class TestNKF < Test::Unit::TestCase
  include Test::Unit::CoreAssertions

  EUC_STR = "\xa5\xaa\xa5\xd6\xa5\xb8\xa5\xa7\xa5\xaf\xa5\xc8\xbb\xd8\xb8\xfe\
\xa5\xb9\xa5\xaf\xa5\xea\xa5\xd7\xa5\xc8\xb8\xc0\xb8\xec\
Ruby"

  def test_guess
    str_euc = EUC_STR
    str_jis = NKF.nkf('-j', str_euc)
    assert_equal(::NKF::JIS, NKF.guess(str_jis))
    assert_equal(::NKF::EUC, NKF.guess(str_euc))
  end

  def test_ruby_dev_36909
    assert_nothing_raised do
      100.times { NKF.nkf("--oc=eucJP-nkf", "foo") }
    end
  end

  def test_ractor
    assert_ractor("#{<<~"begin;"}\n#{<<~'end;'}", require: "nkf")
    STR_EUC = #{EUC_STR.dump}.freeze
    begin;
      STR_JIS = NKF.nkf('-j', STR_EUC).freeze
      r1 = Ractor.new do
        NKF.guess(STR_JIS)
      end
      r2 = Ractor.new do
        NKF.guess(STR_EUC)
      end
      assert_equal(::NKF::JIS, r1.value)
      assert_equal(::NKF::EUC, r2.value)
    end;
  end
end
