class NumberChase < ActiveRecord::Base
  def number_pairs
    number_of_turns = self.player_count * self.turns_per_player

    random_numbers=(1..self.maximum).to_a.sample number_of_turns-1

    number_pairs =[["Start",random_numbers.first]]

    for i in 0..number_of_turns-3 do
      number_pairs.push([random_numbers[i],random_numbers[i+1]])
    end
    number_pairs.push [random_numbers.last,"End"]

    divided_pairs = Array.new(self.player_count){[]}
    players= (0..player_count-1).to_a
    current_player = players.shuffle!.pop

    number_pairs.each do |pair|
      divided_pairs[current_player].push(pair)
      if players.empty?
        players= (0..self.player_count-1).to_a
      end
      current_player = players.shuffle!.pop
    end

    scrambled_divided_pairs = divided_pairs.map(&:shuffle)
    return scrambled_divided_pairs
  end
end
