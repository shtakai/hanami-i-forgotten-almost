require 'spec_helper'

describe AddBook do
  let(:interactor) { AddBook.new }
  let(:attributes) { Hash[author: 'James Baldwin', title: 'The Fire Next Time'] }

  describe 'good input' do
    let(:result) { interactor.call(attributes) }

    it 'succeeds' do
      expect(interactor.call(attributes)).to be_a_success
    end

    it 'creates a Book with correct title and author' do
      expect(result.book.title).to eq 'The Fire Next Time'
      expect(result.book.author).to eq 'James Baldwin'
    end

    it 'persists the Book' do
      expect(result.book.id).not_to be_nil
    end
  end

  describe 'persistence' do
    let(:repository) { instance_double("BookRepository") }

    it 'persists the book' do
      expect(repository).to receive(:create)
      AddBook.new(repository: repository).call(attributes)
    end
  end
end
