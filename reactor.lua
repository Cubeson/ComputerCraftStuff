local reactor = peripheral.wrap("back")
local monitor = peripheral.wrap("top")
monitor.clear()

while(1) do
  monitor.setCursorPos(1, 1)
  currentEnergy = reactor.getEnergyStored()
  monitor.write(tostring(currentEnergy))
  monitor.write(" RF")
  
  monitor.setCursorPos(1, 2)
  currentFuel = reactor.getFuelAmount()
  monitor.write(tostring(currentFuel))
  monitor.write(" Fuel")
  
  sleep(0.5)
  monitor.clear()
end
