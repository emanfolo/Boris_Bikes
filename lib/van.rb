class Van
  def collect_bikes(docking_station)
    raise "There are no bikes" unless !docking_station.bikes.empty?
    []
  end
end 