class Association end

Association.class_eval do
  class << self
    def has_many(name)
      @associations ||= []
      @associations << name

      define_method(name) do
        associations = instance_variable_get("@associations") || {}
        puts associations
        associations[name] ||= []
        instance_variable_set("@associations", associations)
        associations[name]
      end

      define_method("#{name}_count") do
        send(name)&.size || 0
      end

      define_method("#{name}_titles") do
        send(name).map(&:title)
      end

      define_method("#{name}_clear") do
        associations = instance_variable_get("@associations") || {}
        associations[name] = []
        instance_variable_set("@associations", associations)
      end
    end

    def belongs_to(name)
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)

          association_name = "#{self.class.name.downcase}s"

          if value.respond_to?(association_name)
            collection = value.send(association_name)
            collection << self unless collection.include?(self)
          end
      end
    end
  end
end

class Book < Association
  belongs_to :author
  attr_reader :title

  def initialize(title)
    @title = title
  end
end

class Author < Association
  has_many :books
end

author = Author.new

puts author.books.inspect
author.books << Book.new("Ruby Book")
author.books << Book.new("Rails Book")
puts author.books.inspect
puts author.books_count
puts author.books_titles.inspect

book1 = Book.new('Rails Association')

book1.author = author

puts book1.author.inspect

puts author.books.inspect
