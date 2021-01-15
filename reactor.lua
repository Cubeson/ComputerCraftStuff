local reactor = peripheral.wrap("back")
local monitor = peripheral.wrap("top")
monitor.setCursorPos(1, 1)


while(1) do
  monitor.clear()
  currentEnergy = reactor.getEnergyStored
  monitor.write(currentEnergy,"RF")
end
