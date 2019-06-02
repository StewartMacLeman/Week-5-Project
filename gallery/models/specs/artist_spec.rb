require("minitest/autorun")
require_relative("../artist")

class TestArtist < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Claude Monet", "genre" => "impressionist"}
    @artist = Artist.new(options)
  end

  def test_id()
    result = @artist.id()
    assert_equal(1 , result)
  end

  def test_name()
    result = @artist.name()
    assert_equal("Claude Monet", result)
  end

  def test_genre()
    result = @artist.genre()
    assert_equal("impressionist", result)
  end

end
