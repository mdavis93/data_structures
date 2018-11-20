# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    members.delete(person)
  end

  def front
    members.first
  end

  def middle
    # This method -could- return the middle 2 people for even length arrays, but
    # currently just returns the (n/2) indexed person.
    #
    # Such as an array of 4 people will return the 2nd person.  An array of 5
    # people will return the 3rd person ( (5+1)/2 ).

    mid = if members.length.even?
            (members.length / 2)
          else
            (members.length + 1 / 2)
          end
    members[mid]
  end

  def back
    members.last
  end

  def search(person)
    members[index(person)] if index(person)
  end

  private

  def index(person)
    members.index(person)
  end

end