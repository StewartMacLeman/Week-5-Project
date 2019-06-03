require_relative('../db/sql_runner')

class Artist

attr_accessor :id, :name, :genre

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO artists
    (name, genre)
    VALUES
    ($1,$2)
    RETURNING *"
    values = [@name, @genre]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE artists SET name = $1, genre = $2 WHERE id = $3"
    values = [@name, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def exhibits() #Returns the exhibits by an artist.
    sql = "SELECT * FROM exhibits
    WHERE artist_id = $1"
    values = [@id]
    exhibits = SqlRunner.run(sql, values)
    result = exhibits.map { |exhibit| Exhibit.new(exhibit) }
    return result
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    artist = self.new(result.first)
    return artist
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
