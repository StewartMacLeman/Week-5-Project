require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry')

Exhibit.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Claude Monet", "genre" => "Impressionism"})
artist1.save()
artist2 = Artist.new({"name" => "Salvador Dali", "genre" => "Surrealism"})
artist2.save()
artist3 = Artist.new({"name" => "Jenny Saville", "genre" => "Contemporary"})
artist3.save()

exhibit1 = Exhibit.new({"exhibit_name" => "The Water Lily Pond",
  "type" => "Oil Painting", "year" => "1899", "artist_id" => artist1.id})
exhibit1.save()

exhibit2 = Exhibit.new({"exhibit_name" => "Poppies",
  "type" => "Oil Painting", "year" => "1873", "artist_id" => artist1.id})
exhibit2.save()

exhibit3 = Exhibit.new({"exhibit_name" => "Impression, Sunrise",
  "type" => "Oil Painting", "year" => "1872", "artist_id" => artist1.id})
exhibit3.save()

exhibit4 = Exhibit.new({"exhibit_name" => "The Temptation of St. Anthony",
  "type" => "Oil Painting", "year" => "1946", "artist_id" => artist2.id})
exhibit4.save()

exhibit5 = Exhibit.new({"exhibit_name" => "The Burning Giraffe",
  "type" => "Oil Painting", "year" => "1937", "artist_id" => artist2.id})
exhibit5.save()

exhibit6 = Exhibit.new({"exhibit_name" => "Lobster Telephone",
  "type" => "Sculpture", "year" => "1936", "artist_id" => artist2.id})
exhibit6.save()

exhibit7 = Exhibit.new({"exhibit_name" => "Torso 2",
  "type" => "Oil Painting", "year" => "2004", "artist_id" => artist3.id})
exhibit7.save()

binding.pry
nil
