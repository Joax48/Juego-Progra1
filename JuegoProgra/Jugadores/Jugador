jugador = {}

function jugador:load()
    
    jugador.x = 400
    jugador.y = 200
    jugador.speed = 200
    jugador.max_hearts=4
    jugador.corazones_perdidos=0
    jugador.hearts=jugador.max_hearts

    jugador.Hoja=love.graphics.newImage( 'Imagenes/Jugador3.png')
    jugador.grid=anim8.newGrid(24,32,jugador.Hoja:getWidth(),jugador.Hoja:getHeight())
    jugador.collider=mundo:newBSGRectangleCollider(400,250,50,100,10)
    jugador.collider:setFixedRotation(true)


    
    jugador.animaciones={}
    jugador.animaciones.abajo=anim8.newAnimation(jugador.grid('1-8',1),0.1)
    jugador.animaciones.arriba=anim8.newAnimation(jugador.grid('1-8',2),0.1)
    jugador.animaciones.izquierda=anim8.newAnimation(jugador.grid('1-8',3),0.1)
    jugador.animaciones.derecha=anim8.newAnimation(jugador.grid('1-8',4),0.1)
    jugador.anim=jugador.animaciones.arriba

end
function jugador:movimiento(dt)
    local movimiento=false
    local vx=0
    local vy=0
      if love.keyboard.isDown("right") then
          vx= jugador.speed
          jugador.anim=jugador.animaciones.derecha
          movimiento=true
      
      end
  
      if love.keyboard.isDown("left") then
         vx= jugador.speed * -1
          jugador.anim=jugador.animaciones.izquierda
          movimiento=true
      end
  
      if love.keyboard.isDown("down") then
          vy= jugador.speed 
          jugador.anim=jugador.animaciones.abajo
          movimiento=true
      end
  
      if love.keyboard.isDown("up") then
          vy= jugador.speed* -1
          jugador.anim=jugador.animaciones.arriba
          movimiento=true
      end
  
      if movimiento==false then
          jugador.anim:gotoFrame(1)
      end    
   jugador.collider:setLinearVelocity(vx,vy)

   jugador.x=jugador.collider:getX()
   jugador.y=jugador.collider:getY()
   jugador.anim:update(dt)
end
function jugador:update(dt)

end

function jugador:draw()

end