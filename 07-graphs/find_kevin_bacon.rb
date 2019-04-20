require_relative 'node'

$films = []
$counter = 0

def find_kevin_bacon(actor)
  unless $counter > 0
    actor.film_actor_hash.each do |title, actors|
      actors.each do |actor|
        if actor.name != 'Kevin Bacon'
          $films.push(title)
          find_kevin_bacon(actor)
        else
          $films.push(title)
          if $films.length <= 6
            puts "Degrees of Kevin Bacon: #{$films.length}"
            $films.each do |film|
              puts "Connected by: #{film}"
            end
            $counter += 1
          else
            puts "More than six degrees of Kevin Bacon"
            $counter += 1
          end
        end
      end
    end
  end
end