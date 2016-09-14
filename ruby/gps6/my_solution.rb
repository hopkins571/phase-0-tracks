# Virus Predictor

# I worked on this challenge by myself.
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# all content of the linked file is now contained in this one by reference
# require_relative uses relative path, whereas 'require' would need an absolute path
#
require_relative 'state_data'

class VirusPredictor

# creates a new instance of the class, currently accepting three parameters:
# state_of_origin, population_density, and population
# it simply creates instance variables of all three of those

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

# Prints the results of two methods: predicted_deaths and speed_of_spread

  def virus_effects
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
    puts @state.upcase + ":"
    puts "Total number of deaths: #{@number_of_deaths}"
    puts "Time for outbreak to spread across state: #{@speed} months\n\n"
    # print "#{@state} will lose #{@number_of_deaths} and the outbreak will spread across the state in #{@speed} months.\n\n"
  end

  private

# predicts deaths based on inputs of population density, population, and state
# depending on population density, different multiplier will be used with population to calculate deaths
# prints output as string, but no method output

  def predicted_deaths(population_density, population, state)
    # predicted deaths is solely based on population density
    if @population_density >= 200
      @number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      @number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      @number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      @number_of_deaths = (@population * 0.1).floor
    else
      @number_of_deaths = (@population * 0.05).floor
    end

    # print "#{@state} will lose #{number_of_deaths} people in this outbreak"
    @number_of_deaths
  end

  # calculate speed of spread based on population density
  # prints result as string, but no method output

  def speed_of_spread(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    @speed = 0.0

    if @population_density >= 200
      @speed += 0.5
    elsif @population_density >= 150
      @speed += 1
    elsif @population_density >= 100
      @speed += 1.5
    elsif @population_density >= 50
      @speed += 2
    else
      @speed += 2.5
    end

    # puts " and will spread across the state in #{speed} months.\n\n"
    @speed
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

# 50 state report driver code:
# (belongs outside the class because each instance is for only one state)

STATE_DATA.each do | state, stats |
  report = VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population])
  report.virus_effects
end



#=======================================================================
# Reflection Section