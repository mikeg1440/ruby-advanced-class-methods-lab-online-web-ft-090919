require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end


  def self.create
    new_instance = self.new
    new_instance.save
    new_instance
    end

  def self.new_by_name(name)
    # @@all << self
    new_instance = self.create
    new_instance.name = name
    new_instance
  end

  def self.create_by_name(name)
    new_instance = self.create
    new_instance.name = name
    new_instance.artist_name = name

    new_instance

  end

  def self.find_by_name(name)

    @@all.each do |instance|
      if instance.name == name
        return instance
      end

    end

    return nil
  end

  def self.find_or_create_by_name(name)

    if find_by_name(name)
      return find_by_name(name)
    else
      create_by_name(name)
    end

  end

  def self.alphabetical

    self.all.sort_by {|instance| instance.name }

  end


  def self.destroy_all
    @@all.clear
  end

  def self.create_from_filename(filename)

    match = filename.match(/(.+)-(\s.+[^\.mp3])/)

    new_instance = create_by_name(match[2].strip)

    new_instance.name = match[2].strip
    new_instance.artist_name = match[1].strip


    # binding.pry
    new_instance
  end

  def self.new_from_filename(filename)

    match = filename.match(/(.+)-(\s.+[^\.mp3])/)

    new_instance = create_by_name(match[2].strip)

    new_instance.name = match[2].strip
    new_instance.artist_name = match[1].strip

    # binding.pry
    new_instance
  end

end
