class Association
  @associations = {}
  class << self
    def has_many(name)
      @associations ||= []
      @associations << name
      
      define_method(name) do
        associations = instance_variable_get("@associations") || {}
        associations[name] ||= []
        instance_variable_set("@associations", associations)
        associations[name]
      end

      define_method("#{name}_count") do
        instance_variable_get("@associations")[name]&.size || 0
      end
    end

    def associations
      @associations || []
    end
  end

  def associations
    (instance_variable_get("@associations") || {}).keys
  end
end

class Author < Association
  has_many :books
end

author = Author.new

puts author.books.inspect
author.books << "Book 1"
puts author.books.inspect
puts author.books_count


class Library < Association
  has_many :books
  has_many :authors
end

library = Library.new

lib = Library.new

lib.books << "Ruby Book"
lib.authors << "Matz"

puts lib.books
puts lib.authors

puts lib.books_count
puts lib.authors_count

puts "Library (lib) associations: #{lib.associations.inspect}"
puts "Author associations: #{author.associations.inspect}"

puts "\n--- Class Level Associations ---"
puts "Library class associations: #{Library.associations.inspect}"
puts "Author class associations: #{Author.associations.inspect}"