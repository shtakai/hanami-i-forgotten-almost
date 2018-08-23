require 'hanami/interactor'

class AddBook
  include Hanami::Interactor

  expose :book

  def initialize
    # set up the object
  end

  def call(book_attributes)
    @book = Book.new(book_attributes)
  end
end
