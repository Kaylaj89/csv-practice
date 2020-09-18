require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(file)
  olympic_athletes = []
  rows = CSV.read(file, headers:true )
  rows.each do |row|
    athlete = {
        "ID"=> row["ID"],
        "Name"=> row["Name"],
        "Height"=> row["Height"],
        "Team"=> row["Team"],
        "Year"=> row["Year"],
        "City"=> row["City"],
        "Sport"=> row["Sport"],
        "Event"=> row["Event"],
        "Medal"=> row["Medal"]
    }
    olympic_athletes << athlete
  end
  return  olympic_athletes
end


def total_medals_per_team(olympic_data)
  medals_per_team_hash = {}
  all_teams = olympic_data.map { |row|  row["Team"] }.uniq
  all_teams.each do |team|
    count = 0
    olympic_data.each do |row|
      if row["Team"] == team && if row["Medal"] != "NA"
          count +=1
        end
      end
    end
    if count > 0
      medals_per_team_hash[team] = count
    end

  end

  return medals_per_team_hash
end
