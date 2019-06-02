require("minitest/autorun")
require_relative("../exhibit")

class TestExhibit < MiniTest::Test

  def setup
    options = {"id" => 2, "exhibit_name" => "The Water Lily Pond",
      "type" => "Oil Painting", "year" => "1899", "artist_id" => 1}
      @exhibit = Exhibit.new(options)
    end

    def test_id()
      result = @exhibit.id()
      assert_equal(2 , result)
    end

    def test_exhibit_name()
      result = @exhibit.exhibit_name()
      assert_equal("The Water Lily Pond" , result)
    end

    def test_type()
      result = @exhibit.type()
      assert_equal("Oil Painting" , result)
    end

    def test_year()
      result = @exhibit.year()
      assert_equal("1899" , result)
    end

    def test_artist_id()
      result = @exhibit.artist_id()
      assert_equal(1 , result)
    end

  end
