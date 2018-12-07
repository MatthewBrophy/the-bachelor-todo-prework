require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each do |year, person|
    if year == season
      person.each do |attribute, _value|
        if attribute['status'] == 'Winner'
          return attribute['name'].partition(' ').first
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |_year, person|
    person.each do |attribute, _value|
      if attribute['occupation'] == occupation
        return attribute['name']
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  contestants = []
  data.each do |_year, person|
    person.each do |attribute, _value|
      if attribute['hometown'] == hometown
        contestants << attribute['name']
      end
    end
  end
  contestants.count
end

def get_occupation(data, hometown)
  data.each do |_year, person|
    person.each do |attribute, _value|
      if attribute['hometown'] == hometown
        return attribute['occupation']
      end
    end
  end
end

def get_average_age_for_season(data, season)
  contestant_ages = []
  data.each do |year, person|
    if year == season
      person.each do |attribute, _value|
        contestant_ages << attribute['age'].to_f
        
      end
    end
  end
  (contestant_ages.sum / contestant_ages.length).round
end
