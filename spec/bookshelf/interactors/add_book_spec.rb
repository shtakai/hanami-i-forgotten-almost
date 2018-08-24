require 'spec_helper'

describe AddBook do
  let(:interactor) { AddBook.new }
  let(:attributes) { Hash[author: 'James Baldwin', title: 'The Fire Next Time'] }

  describe 'good input' do
    let(:result) { interactor.call(attributes) }

    it 'succeeds' do
      # NOTE ↓is not working.
      # expect(interactor.call(attributes)).to be_a_success
      assert interactor.call(attributes).success?
    end

    it 'creates a Book with correct title and author' do
      assert_equal result.book.title, 'The Fire Next Time'
      assert_equal result.book.author, 'James Baldwin'
    end

    # it 'persists the Book' do
    #   refute_nil result.book.id
    # end
  end

  describe 'persistence' do
    let(:repository) { instance_double("BookRepository") }

    it 'persists the book' do
      expect(repository).to receive(:create)
      AddBook.new(repository: repository).call(attributes)

    end
    # repository.stub :create do
    # expect(repository).to receive(:create)
    # AddBook.new(repository: repository).call(attributes)
  end
end
