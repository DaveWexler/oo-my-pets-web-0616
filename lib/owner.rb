require 'pry'
require_relative 'fish.rb'
require_relative 'dog.rb'
require_relative 'cat.rb'
class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []
  @@owner_count = 0

  def self.all
    @@all
  end

  def initialize(species)
    @species = species
    @@all << self
    @@owner_count += 1
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def name
    @name
  end

  def self.reset_all
    @all = []
    @@owner_count = 0
  end

  def self.count
    @@owner_count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
  end

  def list_pets
    fishes = self.pets[:fishes]
    cats = self.pets[:cats]
    dogs = self.pets[:dogs]
    "I have #{fishes.count} fish, #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end

  def pets
    @pets
  end

  def sell_pets
    free_pets = self.pets.values.map do |pets|
      pets.map do |pet|
        pet.mood = "nervous"
      end
    end
    self.pets ={fishes: [], dogs: [], cats: []}
    free_pets
  end

end