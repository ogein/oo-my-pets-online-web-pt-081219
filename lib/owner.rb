class Owner
  attr_reader :species, :name

  @@owners = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
  end
  
  
  def self.all
    @@owners
  end

  def self.count
    @@owners.size
  end

  def self.reset_all
    @@owners.clear
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
   
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    newcat = Cat.new(name, self)
  end
  
  def buy_dog(name)
    newdog = Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    cats.each {|cat| 
      cat.mood = "nervous"
      cat.owner = nil
    }
    dogs.each {|dog| 
      dog.mood = "nervous"
      dog.owner = nil
    }
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
end