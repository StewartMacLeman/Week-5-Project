require_relative('../db/sql_runner')

class Exhibit

  attr_accessor :id, :exhibit_name, :type, :year, :artist_id

    def initialize(options)
      @id = options['id'].to_i
      @exhibit_name = options['exhibit_name']
      @type = options['type']
      @year = options['year']
      @artist_id = options['artist_id'].to_i
    end

    def save()
      sql = "INSERT INTO exhibits
      (exhibit_name, type, year, artist_id)
      VALUES
      ($1, $2, $3, $4)
      RETURNING *"
      values = [@exhibit_name, @type, @year, @artist_id]
      @id = SqlRunner.run( sql, values )[0]["id"].to_i()
    end

    def delete()
      sql = "DELETE FROM exhibts WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def update()
      sql = "UPDATE exhibits SET exhibit_name = $1, type = $2, year = $3,
      artist_id = $4 WHERE id = $5"
      values = [@exhibit_name, @type, @year, @artist_id, @id]
      SqlRunner.run(sql, values)
    end

    def artist() #Returns the artist of an exhibit.
      sql = "SELECT * FROM artists
      WHERE id = $1"
      values = [@artist_id]
      artist = SqlRunner.run(sql,values)
      result = Artist.new(artist.first)
      return result
    end

    def self.all()
      sql = "SELECT * FROM exhibits"
      exhibits = SqlRunner.run(sql)
      result = exhibits.map { |item| Exhibit.new(item) }
      return result
    end

    def self.find(id)
      sql = "SELECT * FROM exhibits WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values)
      exhibit = self.new(result.first)
      return exhibit
    end

    def self.delete_all()
      sql = "DELETE FROM exhibits"
      SqlRunner.run(sql)
    end

end
