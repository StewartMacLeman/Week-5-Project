require_relative('../db/sql_runner')

class Artist

attr_accessor :id, :name, :genre

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
  end



end
