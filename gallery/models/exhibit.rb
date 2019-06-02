require_relative('../db/sql_runner')

class Exhibit

  attr_accessor :id, :exhibit_name, :type, :year, :artist_id

    def initialize( options )
      @id = options['id'].to_i
      @exhibit_name = options['exhibit_name']
      @type = options['type']
      @year = options['year']
      @artist_id = options['artist_id'].to_i

    end

end
