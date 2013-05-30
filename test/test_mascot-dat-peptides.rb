require 'test_mascot-dat-helper'
require 'mascot/dat/peptides'
require 'mascot/dat/psm'

class TestMascotDatPeptides < TestMascotDatHelper

  def setup
    super
    @peptides = @dat.peptides
    @fromhtml_peptides = @dat_withhtml.peptides
  end

  def test_peptides
    assert_kind_of(Mascot::DAT::Peptides, @peptides)
    assert_kind_of(Mascot::DAT::Peptides, @fromhtml_peptides)
  end

  def test_peptides_psmindex_not_empty
    refute_empty(@peptides.psmidx)
    refute_empty(@fromhtml_peptides.psmidx)
  end
  def test_peptides_psmindex_is_empty
    peptides = @dat.peptides(false)
    assert_empty(peptides.psmidx)
    fromhtml_peptides = @dat_withhtml.peptides(false)
    assert_empty(fromhtml_peptides.psmidx)
  end

  def test_peptides_first_psm_position
    # position for q1_p1 PSM from test/fixtures/example.dat
    expected_position = 217538
    assert_equal(expected_position, @peptides.psmidx[1][1])
  end

  def test_peptides_psm_q11_p2_position
    # position for q1_p1 PSM from test/fixtures/example.dat
    expected_position = 239195
    assert_equal(expected_position, @peptides.psmidx[11][2])
  end

  def test_peptides_parse_first_psm
    q1p1_psm  = @peptides.psm(1,1)
    assert_equal(1, q1p1_psm.query)
    assert_equal(1, q1p1_psm.rank)
    assert_equal(1, q1p1_psm.missed_cleavages)
    assert_equal(475.275436, q1p1_psm.mr)
    assert_equal(0.007406, q1p1_psm.delta)
    assert_equal(2, q1p1_psm.num_ions_matched)
    assert_equal("GGSKK", q1p1_psm.pep)
    assert_equal(3, q1p1_psm.ions1)
    assert_equal("0000000", q1p1_psm.var_mods_str)
    assert_equal(15.99, q1p1_psm.score)
    assert_equal("0001000020000000000", q1p1_psm.ion_series_str)
    assert_equal(0, q1p1_psm.ions2)
    assert_equal(0, q1p1_psm.ions3)
    assert_equal([["Q3UJB0", 0, 868, 872, 2]], q1p1_psm.proteins)
    assert_equal([2], q1p1_psm.dbs)
    assert_equal([["R","Y"]], q1p1_psm.terms)
  end

  def test_peptides_fromhtml_parse_first_psm
    q1p1_psm  = @fromhtml_peptides.psm(1,1)
    assert_equal(1, q1p1_psm.query)
    assert_equal(1, q1p1_psm.rank)
  end

  def test_second_psm_fromhtml_from_next_psm
    q1p1_psm  = @fromhtml_peptides.psm(1,1)
    q2p1_psm = @fromhtml_peptides.next_psm()
    assert_equal(2, q2p1_psm.query)
    assert_equal(1, q2p1_psm.rank)
    assert_equal(0, q2p1_psm.missed_cleavages)
    assert_equal(1091.488327, q2p1_psm.mr)
    assert_equal(0.024301, q2p1_psm.delta)
    assert_equal(6, q2p1_psm.num_ions_matched)
    assert_equal("LENWTDASR", q2p1_psm.pep)
    assert_equal(9, q2p1_psm.ions1)
    assert_equal("00010000000", q2p1_psm.var_mods_str)
    assert_equal(51.73, q2p1_psm.score)
    assert_equal("0000002000000000000", q2p1_psm.ion_series_str)
    assert_equal(0, q2p1_psm.ions2)
    assert_equal(0, q2p1_psm.ions3)
    assert_equal([["FPRP_HUMAN", 0, 616, 624, 1]], q2p1_psm.proteins)
    assert_equal(nil, q2p1_psm.dbs)
    assert_equal([["K","V"]], q2p1_psm.terms)
  end
end
