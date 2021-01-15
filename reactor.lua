local reactor = peripheral.wrap("back")
local monitor = peripheral.wrap("top")
monitor.clear()

while(1) do
  y = 1
  
  -- Is active
  monitor.setCursorPos(1, y)
  if(reactor.getActive == true) then
    monitor.write("ON")
    else
    monitor.write("OFF")
  end
  y = y + 1
  
  -- RF stored / Max
  monitor.setCursorPos(1, y)
  y = y + 1
  currentEnergy = reactor.getEnergyStored()
  monitor.write(tostring(currentEnergy))
  monitor.write(" RF / ")
  maxEnergy = reactor.getEnergyCapacity()
  monitor.write(tostring(maxEnergy))
  monitor.write(" RF")
  
  -- Fuel
  monitor.setCursorPos(1, y)
  currentFuel = reactor.getFuelAmount()
  monitor.write(tostring(currentFuel))
  monitor.write(" Fuel")
  y = y + 1
  
  -- RF/t
  monitor.setCursorPos(1, y)
  RFgeneration = reactor.getEnergyProducedLastTick()
  monitor.write(tostring(math.floor(RFgeneration)))
  monitor.write(" RF/t")
  y = y + 1
  
  -- Controller
  if( (currentEnergy / maxEnergy) > 0.9 ) then
    reactor.setActive(false)    
  else
    reactor.setActive(true)  
  end
  
  sleep(0.5)
  monitor.clear()
end
