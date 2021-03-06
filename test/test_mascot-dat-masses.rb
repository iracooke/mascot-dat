require 'test_mascot-dat-helper'
require 'mascot/dat/masses'
class TestMascotDatMasses < TestMascotDatHelper

  def setup
    super
    @masses =  @dat.masses
    @fromhtml_masses =  @dat_withhtml.masses
  end

  def test_masses
    assert_kind_of(Mascot::DAT::Masses, @masses)
    assert_kind_of(Mascot::DAT::Masses, @fromhtml_masses)
  end

  def test_masses_masstable_is_hash
    assert_kind_of(Hash, @masses.masstable)
    assert_kind_of(Hash, @fromhtml_masses.masstable)
  end
  def test_masses_delta1
    # delta1=15.994915,Oxidation (M)
    assert_equal(15.994915,@masses.masstable[:delta1])
    assert_equal(15.994915,@masses.delta1)
    assert_equal(0.984016,@fromhtml_masses.masstable[:delta1])
    assert_equal(0.984016,@fromhtml_masses.delta1)
  end
  def test_masses_var_mod_is_delta1
    assert_equal(15.994915,@masses.deltas[0][0])
    assert_equal("Oxidation (M)",@masses.deltas[0][1])
    assert_equal(0.984016,@fromhtml_masses.deltas[0][0])
    assert_equal("Deamidated-N (N)",@fromhtml_masses.deltas[0][1])
  end
  def test_masses_FixedMod1_mass
    assert_equal(57.021464,@masses.masstable[:FixedMod1])
    assert_equal(57.021464,@masses.FixedMod1)
    assert_equal(57.021464,@fromhtml_masses.masstable[:FixedMod1])
    assert_equal(57.021464,@fromhtml_masses.FixedMod1)
  end

  def test_masses_fixed_mod_is_FixedMod1
    assert_equal(57.021464,@masses.fixed_mods[0][0])
    assert_equal("Carbamidomethyl (C)",@masses.fixed_mods[0][1])
    assert_equal("C",@masses.fixed_mods[0][2])
    assert_equal(57.021464,@fromhtml_masses.fixed_mods[0][0])
    assert_equal("Carbamidomethyl (C)",@fromhtml_masses.fixed_mods[0][1])
    assert_equal("C",@fromhtml_masses.fixed_mods[0][2])
  end
end
