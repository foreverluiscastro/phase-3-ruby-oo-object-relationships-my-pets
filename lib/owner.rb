class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def walk_dogs
    Dog.all.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    Dog.all.each {|dog|
      dog.owner = nil
      dog.mood = "nervous"
    }
    Cat.all.each {|cat|
    cat.owner = nil
    cat.mood = "nervous"
    }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
    
end