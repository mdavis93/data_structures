require_relative 'node'

class FindKevin

  def initialize
    @bacon_number = nil
    @checked_actors = nil
    @path_array = nil
  end

  def find_kevin_bacon(start)
    @bacon_number = 0
    @checked_actors = []
    @path_array = []
    @checked_actors.push(start)

    return @path_array if start.name == 'Kevin Bacon'

    until @checked_actors.empty?
      node = @checked_actors.shift

      node.film_actor_hash.each do |film, cast|
        @path_array.push(film) unless @path_array.include?(film)
        cast.each do |actor|
          if actor.name != 'Kevin Bacon' && !@checked_actors.include?(actor)
            @checked_actors.push(actor)
          elsif actor.name == 'Kevin Bacon'
            return @path_array
          end
        end

      end
    end
  end
end