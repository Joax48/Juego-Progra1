anim8=require 'Librerias/anim8'
wf=require 'Librerias/windfield'

Jugador={}
function Jugador:load()
    self.x=1000
    self.y=200
    self.width=20
    self.height=60
   self.speed=2

    self.physics={}
   

    self.Hoja=love.graphics.newImage( 'Imagenes/Jugador3.png')
    self.grid=anim8.newGrid(24,32,self.Hoja:getWidth(),self.Hoja:getHeight())

    self.collider=mundo:newBSGRectangleCollider(1000,200,30,40,10)
    self.collider:setFixedRotation(true)
    

    self.animaciones = { }
    self.animaciones.abajo=anim8.newAnimation(self.grid('1-8',1),0.1)
    self.animaciones.arriba=anim8.newAnimation(self.grid('1-8',2),0.1)
    self.animaciones.izquierda=anim8.newAnimation(self.grid('1-8',3),0.1)
    self.animaciones.derecha=anim8.newAnimation(self.grid('1-8',4),0.1)
    self.anim=self.animaciones.arriba
end

    function Jugador:update(dt)
      self:movimiento(dt)
    end

    function Jugador:movimiento(dt)
        local movimiento=false
  local vx=0
  local vy=0

    if love.keyboard.isDown("right") then
        vx= self.speed
        self.anim=self.animaciones.derecha
        movimiento=true
    
    end

    if love.keyboard.isDown("left") then
       vx= self.speed * -1
        self.anim=self.animaciones.izquierda
        movimiento=true
    end

    if love.keyboard.isDown("down") then
        vy= self.speed 
        self.anim=self.animaciones.abajo
        movimiento=true
    end

    if love.keyboard.isDown("up") then
        vy= self.speed* -1
        self.anim=self.animaciones.arriba
        movimiento=true
    end

    if movimiento==false then
        self.anim:gotoFrame(1)
    end    

    self.collider:setLinearVelocity(vx,vy)
         
          self.anim:update(dt)



    
          self.x=self.collider:getX()
    self.y=self.collider:getY()
    end


    function Jugador:beginContact(a,b,collision)

    end
    
    function Jugador:endContact(a,b,collision)
    
    end
    function Jugador:draw()
        self.anim:draw(self.Hoja,self.x,self.y,nil,2,nil,12,17)
    end