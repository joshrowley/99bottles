class CountPresenter
  attr_reader :count

  def initialize(count)
    @count = count
  end

  def next_count
    count - 1
  end

  def count_noun
    count == 1 ? 'bottle' : 'bottles'
  end

  def next_count_noun
    next_count == 1 ? 'bottle' : 'bottles'
  end

  def count_and_noun
    "#{count} #{count_noun}"
  end

  def next_count_and_noun
    "#{next_count} #{next_count_noun}"
  end

  def end_phrase
    count == 1 ? 'no more bottles' : "#{next_count} #{next_count_noun}"
  end

  def take_noun
    count == 1 ? 'it' : 'one'
  end
end

class Bottles
  def verse(count)
    return ending if count == 0

    presenter = CountPresenter.new(count)

    <<-VERSE
#{presenter.count_and_noun} of beer on the wall, #{presenter.count_and_noun} of beer.
Take #{presenter.take_noun} down and pass it around, #{presenter.end_phrase} of beer on the wall.
    VERSE
  end

  def verses(beginning, end_count)
    verses = []
    while beginning >= end_count
      verses << verse(beginning)
      beginning -= 1
    end

    verses.join("\n")
  end

  def song
    verses(99, 0)
  end

  def take_noun(count)
    count == 1 ? 'it' : 'one'
  end

  def ending
    <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end
end
