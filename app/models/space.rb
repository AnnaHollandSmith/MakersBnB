require 'mini_magick'

class Space

  include DataMapper::Resource

  validates_presence_of :date_from
  validates_presence_of :date_to

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Float, required: true
  property :date_from, Date, required: true
  property :date_to, Date, required: true
  property :photo, String

  belongs_to :user

  has n, :requests

  def self.upload_photo(filename, file_contents)
    File.open('./app/public/image_uploads/' + filename, "w") do |f|
      f.write(file_contents.read)
    end

    image = MiniMagick::Image.open("./app/public/image_uploads/#{filename}")
    image.resize "200x200"
    image.write "./app/public/image_uploads/small_#{filename}"

    image = MiniMagick::Image.open("./app/public/image_uploads/#{filename}")
    image.resize "850x850"
    image.write "./app/public/image_uploads/#{filename}"

  end
end
