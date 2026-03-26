class Association
  def self.has_many(name)
    define_method(name) do
      instance_variable_get("@#{name}") || instance_variable_set("@#{name}", [])
    end

    define_method("#{name}_count") do
      instance_variable_get("@#{name}")&.size || 0
    end
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