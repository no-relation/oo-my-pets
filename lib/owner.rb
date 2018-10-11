require 'pry'

class Owner
  @@all = []
  attr_reader :species
  attr_accessor :pets, :name

  def self.all
    @@all
  end 

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].map do | dog |
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].map do | cat |
      cat.mood = "happy"
    end 
  end

  def feed_fish
    @pets[:fishes].map do | fish |
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.map do | animal, names |
      names.map do | pet |
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end 

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end