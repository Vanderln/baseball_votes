
@players = []
def offset_build
  offset = []
  i = 0
  while i < 69
   offset << (50 * i) + 1
   i += 1
  end
  offset
end

def pull_data(offset)
  uri = []
  offset.map do |num|
    uri =  URI.parse('http://api.espn.com/v1/sports/baseball/mlb/athletes?apikey=eygs8dv4fevn574zq68sbap8&offset='+ num.to_s )
    sleep(0.5)
    data = Net::HTTP.get(uri)
    data_hash = JSON.parse(data)
    convert_data(data_hash)
  end
end

def convert_data(data_hash)
  data_hash["sports"][0]["leagues"][0]["athletes"].each do |key, value|
    @players << key["fullName"]
  end
  @players
end

Player.create(:player_name => "Babe Ruth")

pull_data(offset_build)


@players.map do |x|
  Player.create(:player_name => x.to_s)
end
