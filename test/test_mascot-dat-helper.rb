require 'test/unit'
require 'mascot/dat'

class TestMascotDatHelper < Test::Unit::TestCase
  def setup
    @dat = Mascot::DAT.open("test/fixtures/example.dat")
    @dat_withhtml = Mascot::DAT.open("test/fixtures/example_withhtml.dat")
  end
  def test_canary
    pass
  end

  # def teardown
  #   File.unlink("test/fixtures/example.dat.idx")
  # end
end
