---Clase que se encarga de la creacion de los señuelos
Coin = {}
Coin.__index = Coin
ActiveCoins = {}

--Funcion que introduce los señuelos tomando su posicion x y y creando una instancia usando sus datos
function Coin.new(x,y,type)
   local instance = setmetatable({}, Coin)
   instance.x = x
   instance.y = y
   
   instance.scaleX = 1
   instance.randomTimeOffset = math.random(0, 100)
   instance.toBeRemoved = false
   instance.physics = {}

  
   --Seccion que se encarga de la apariencia de los señuelos
   piedras={}
   piedras.Hoja=love.graphics.newImage('Imagenes/ore.png' )
   piedras.grid=anim8.newGrid(32,32,piedras.Hoja:getWidth(),piedras.Hoja:getHeight())
   piedras.minerales={}
   piedras.minerales.piedra=anim8.newAnimation(piedras.grid(1,2),0.1)
  
   
 
   instance.img = piedras.minerales.piedra
   instance.width = 32
   instance.height = 32
    table.insert(ActiveCoins, instance)
end

--Funcion que quita los señuelos del mapa
function Coin:remove()
   for i,instance in ipairs(ActiveCoins) do
      if instance == self then
         Player:incrementCoins()
         print(Player.coins)
         self.physics.body:destroy()
         table.remove(ActiveCoins, i)
      end
   end
end
--Funcioon que actualiza y verifica el estado de los señuelos
function Coin:update(dt)
   
   self:checkRemove()
end

--Funcion que verifica si se deben de quitar los señuelos
function Coin:checkRemove()
   if self.toBeRemoved then
      self:remove()
   end
end


--Funcion que dibuja los señuelos
function Coin:draw()
   piedras.minerales.piedra:draw(piedras.Hoja, self.x, self.y,nil,2)
end

--Funcion que actualiza todos los señuelos
function Coin.updateAll(dt)
   for i,instance in ipairs(ActiveCoins) do
      instance:update(dt)
   end
end
--Funcion que dibuja todos los señuelos
function Coin.drawAll()
   for i,instance in ipairs(ActiveCoins) do
      instance:draw()
   end
end