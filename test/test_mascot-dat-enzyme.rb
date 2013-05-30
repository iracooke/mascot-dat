require 'test/unit'
require 'mascot/dat'
require 'mascot/dat/enzyme'
require 'test_mascot-dat-helper'

class TestMascotDatEnzyme < TestMascotDatHelper
  def setup
    super
    @enzyme = @dat.enzyme
    @fromhtml_enzyme = @dat_withhtml.enzyme
  end
  def test_enz_create
    assert_kind_of Mascot::DAT::Enzyme, @enzyme
    assert_kind_of Mascot::DAT::Enzyme, @fromhtml_enzyme
  end
  def test_enz_title
    assert_equal("Trypsin",  @enzyme.title)
    assert_equal("Trypsin",  @fromhtml_enzyme.title)
  end
  def test_enz_independent
    refute(@enzyme.independent)
    refute(@fromhtml_enzyme.independent)
  end
  def test_enz_semi_specific
    refute(@enzyme.semi_specific)
    refute(@fromhtml_enzyme.semi_specific)
  end
  def test_enz_terminals
    assert_equal("C",  @enzyme.terminals[0])
    assert_equal("C",  @fromhtml_enzyme.terminals[0])
  end
  def test_enz_restrictions
    assert_equal("P",  @enzyme.restrictions[0])
    assert_equal("P",  @fromhtml_enzyme.restrictions[0])
  end
  def test_enz_cleavages
    assert_equal("KR",  @enzyme.cleavages[0])
    assert_equal("KR",  @fromhtml_enzyme.cleavages[0])
  end
end