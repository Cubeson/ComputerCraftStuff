local reactor = peripheral.wrap("back")
local monitor = peripheral.wrap("top")
monitor.clear()

while(1) do
  -- RF stored
  monitor.setCursorPos(1, 1)
  currentEnergy = reactor.getEnergyStored()
  monitor.write(tostring(currentEnergy))
  monitor.write(" RF")
  
  -- Fuel
  monitor.setCursorPos(1, 2)
  currentFuel = reactor.getFuelAmount()
  monitor.write(tostring(currentFuel))
  monitor.write(" Fuel")
  
  -- RF/t
  monitor.setCursorPos(1, 3)
  RFgeneration = reactor.getEnergyProducedLastTick()
  monitor.write(tostring(RFgeneration))
  monitor.write(" RF/t")
  
  sleep(0.5)
  monitor.clear()
end
