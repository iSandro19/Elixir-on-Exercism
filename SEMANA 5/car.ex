defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{} = remote_car) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery}) do
    "Battery at #{battery}%"
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car) do
    remote_car
  end

  def drive(%RemoteControlCar{battery_percentage: battery, distance_driven_in_meters: distance} = remote_car) do
    %RemoteControlCar{remote_car | battery_percentage: battery - 1, distance_driven_in_meters: distance + 20}
  end
end

#https://exercism.org/mentoring/external_requests/e571404d9de04c11838f619859a4f9d7
