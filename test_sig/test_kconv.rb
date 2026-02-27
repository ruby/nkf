require "kconv"
require "test/unit"
require "rbs/unit_test"
require_relative "test_helper"

class KconvTest < Test::Unit::TestCase
  include TestHelper
  library "kconv"
  testing "singleton(::Kconv)"

  def test_guess
    assert_send_type "(::String) -> ::Encoding",
                     Kconv, :guess, "abc"
  end

  def test_predicates
    assert_send_type "(::String) -> bool",
                     Kconv, :iseuc, "abc"
    assert_send_type "(::String) -> bool",
                     Kconv, :isjis, "abc"
    assert_send_type "(::String) -> bool",
                     Kconv, :issjis, "abc"
    assert_send_type "(::String) -> bool",
                     Kconv, :isutf8, "abc"
  end

  def test_kconv
    assert_send_type "(::String, ::Encoding?, ?::Encoding?) -> ::String",
                     Kconv, :kconv, "abc", Kconv::EUC, Kconv::UTF8
  end

  def test_converters
    assert_send_type "(::String) -> ::String",
                     Kconv, :toeuc, "abc"
    assert_send_type "(::String) -> ::String",
                     Kconv, :tojis, "abc"
    assert_send_type "(::String) -> ::String",
                     Kconv, :tolocale, "abc"
    assert_send_type "(::String) -> ::String",
                     Kconv, :tosjis, "abc"
    assert_send_type "(::String) -> ::String",
                     Kconv, :toutf16, "abc"
    assert_send_type "(::String) -> ::String",
                     Kconv, :toutf32, "abc"
    assert_send_type "(::String) -> ::String",
                     Kconv, :toutf8, "abc"
  end

  def test_constants
    assert_const_type "::Encoding", "Kconv::ASCII"
    assert_const_type "nil", "Kconv::AUTO"
    assert_const_type "::Encoding", "Kconv::BINARY"
    assert_const_type "::Encoding", "Kconv::EUC"
    assert_const_type "::Encoding", "Kconv::JIS"
    assert_const_type "nil", "Kconv::NOCONV"
    assert_const_type "::Encoding", "Kconv::SJIS"
    assert_const_type "nil", "Kconv::UNKNOWN"
    assert_const_type "::Encoding", "Kconv::UTF16"
    assert_const_type "::Encoding", "Kconv::UTF32"
    assert_const_type "::Encoding", "Kconv::UTF8"
  end
end
