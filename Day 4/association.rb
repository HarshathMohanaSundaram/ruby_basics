class Association end

Association.class_eval do
  ASSOCIATION_TYPE = %i(has_many)

  ASSOCIATION_TYPE.each do |association|
    define_method("self.#{association}") do |name|
      define_method(name) do
        instance_variable_get("@#{name}") || instance_variable_set("@#{name}", [])
      end

      define_method("#{name}_count") do
        instance_variable_get("@#{name}").size
      end
    end
  end
end

class Author < Association
  has_many :books
end

author = Author.new
puts author.books.inspect # => []
author.books << "Book 1"
puts author.books.inspect # => ["Book 1"]
puts author.books_count # => 1