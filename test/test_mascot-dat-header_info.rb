require 'test/unit'
require 'mascot/dat'
require 'test_mascot-dat-helper'

class TestMascotDatHeader < TestMascotDatHelper
  def setup
    super
    @header = @dat.header
    @fromhtml_header = @dat_withhtml.header
  end
  def test_header_create
    assert_kind_of Mascot::DAT::HeaderInfo, @header
    assert_kind_of Mascot::DAT::HeaderInfo, @fromhtml_header
  end
  def test_header_sequences
    assert_equal("54162",@header.sequences)
    assert_equal("40464",@fromhtml_header.sequences)
  end
end