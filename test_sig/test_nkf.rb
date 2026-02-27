require "nkf"
require "test/unit"
require "rbs/unit_test"
require_relative "test_helper"

class NKFTest < Test::Unit::TestCase
  include TestHelper
  library "nkf"
  testing "singleton(::NKF)"

  def test_guess
    assert_send_type "(::String) -> ::Encoding",
                     NKF, :guess, "abc"
  end

  def test_nkf
    assert_send_type "(::String, ::String) -> ::String",
                     NKF, :nkf, "-w", "abc"
  end

  def test_constants
    assert_const_type "::Encoding", "NKF::ASCII"
    assert_const_type "nil", "NKF::AUTO"
    assert_const_type "::Encoding", "NKF::BINARY"
    assert_const_type "::Encoding", "NKF::EUC"
    assert_const_type "::Encoding", "NKF::JIS"
    assert_const_type "::String", "NKF::NKF_RELEASE_DATE"
    assert_const_type "::String", "NKF::GEM_VERSION"
    assert_const_type "::String", "NKF::NKF_VERSION"
    assert_const_type "nil", "NKF::NOCONV"
    assert_const_type "::Encoding", "NKF::SJIS"
    assert_const_type "nil", "NKF::UNKNOWN"
    assert_const_type "::Encoding", "NKF::UTF16"
    assert_const_type "::Encoding", "NKF::UTF32"
    assert_const_type "::Encoding", "NKF::UTF8"
    assert_const_type "::String", "NKF::VERSION"
  end
end
