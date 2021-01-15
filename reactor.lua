local reactor = peripheral.wrap("back")
local monitor = peripheral.wrap("top")
monitor.clear()

highestRFpT = 0
threshold = 0.9

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
  
  -- RF stored / Max / Percentage
  monitor.setCursorPos(1, y)
  currentEnergy = reactor.getEnergyStored()
  monitor.write(tostring(currentEnergy))
  monitor.write("RF/")
  maxEnergy = reactor.getEnergyCapacity()
  monitor.write(tostring(maxEnergy))
  monitor.write(" RF: ")
  pRF = tostring(currentEnergy/maxEnergy*100)
  pRF = string.format("%3.2f",pRF)
  monitor.write(pRF)
  monitor.write("%")
  y = y + 1
  
  -- Fuel / Max / Percentage
  monitor.setCursorPos(1, y)
  currentFuel = reactor.getFuelAmount()
  monitor.write(tostring(currentFuel))
  monitor.write("/")
  maxFuel = reactor.getFuelAmountMax()
  monitor.write(tostring(maxFuel))
  monitor.write(" Fuel: ")
  pFuel = tostring(currentFuel/maxFuel*100)
  pFuel = string.format("%3.2f",pFuel)
  monitor.write(pFuel)
  monitor.write("%")
  y = y + 1
  
  -- RF/t
  monitor.setCursorPos(1, y)
  RFgeneration = reactor.getEnergyProducedLastTick()
  monitor.write(tostring(math.floor(RFgeneration)))
  monitor.write(" RF/t")
  y = y + 1
  
  if(RFgeneration > highestRFpT) then
    highestRFpT = RFgeneration
  end
  
  -- highest RF/t
  monitor.setCursorPos(1, y)
  monitor.write(tostring(math.floor(highestRFpT)))
  monitor.write(" peak RF/t")
  y = y + 1
  
  
  -- Controller
  if( (currentEnergy / maxEnergy) > threshold ) then
    reactor.setActive(false)
    threshold = 0.9
  else
    reactor.setActive(true)
    threshold =0.95
  end
  
  sleep(0.5)
  monitor.clear()
end
