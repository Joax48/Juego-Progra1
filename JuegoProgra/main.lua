--#Libreria importada que se encarga de las animaciones dle jugador
anim8=require 'Librerias/anim8'
--#Libreria importada que se encarga de la camar y que esta siga al jugador
camara=require 'Librerias/camera'
cam=camara()
--#Libreria Simple Tiled implementation que se encarga de tomar el mapa creado en la plataforma
--tiled y convertirlo a codigo
sti=require 'Librerias/sti'
mapa=sti('mapas/mapa2.lua')
--#Libreria importada que se encarga de las fisicas del mapa y juego
wf=require 'Librerias/windfield'
--#Clase importada que se encarga de las creaciones de las piedras
require("Spike")
--#Funcion de love 2D que se encarga de aumentar la resolucion de los pixeles al hacerles zoom
love.graphics.setDefaultFilter("nearest","nearest")

--#Funcion que se encarga de cargar y inicializar un gran numero de las variables y metodos que 
--se utilizan
function love.load()
    --#Random seed se encarga de aumentar la aleatoridad de los math.random utilizando la hora 
    --ya que esta cambia de manera constante
    math.randomseed(os.time())
    --#Tabla que se encarga de los sonidos del juego y la musica importados 
    sonidos={}
    sonidos.blip=love.audio.newSource("Sonidos/blip.wav",'static')
    sonidos.musica=love.audio.newSource("Sonidos/music.mp3",'stream')
    sonidos.victory=love.audio.newSource("Sonidos/Victory.mp3",'stream')
    sonidos.musica:play()

    --#Contadores que serviran para determinar el cuando los enemigos hagan daño(aumentan cuando 
    -- los collisoners de los enemigos y el del jugador chocan)
    contador=0
    contador2=0
    contador3=0
    contador4=0
    contador5=0

    --#Variable con math.random que se encarga de verificar cuando y cual enemigo soltara un señuelo
    verificadorSeñuelos=math.random(1,5)
    --#Contador de cuantos señuelos hay en el mapa
    contadorSeñuelos=0

    --#Variable que representa la creacion del "mundo" y sus collisoners o fisica
    mundo=wf.newWorld(0,0)

    --# Se agrega al mundo los tipos de collisoners de tanto los enemigos, los minerales y el jugador
    --Funcionan para distinguir que tipo de collisoner esta interactuando
    mundo:addCollisionClass('jugador')
    mundo:addCollisionClass('mineral')
    mundo:addCollisionClass('carbon')
    mundo:addCollisionClass('hierro')
    mundo:addCollisionClass('oro')
    mundo:addCollisionClass('diamante')
    mundo:addCollisionClass('rubi')
    mundo:addCollisionClass('piedra')
    mundo:addCollisionClass('cobre')
    mundo:addCollisionClass('marmol')
    mundo:addCollisionClass('granito')
    mundo:addCollisionClass('cuarzo')
    mundo:addCollisionClass('señuelo')
    mundo:addCollisionClass('piedra11')
    mundo:addCollisionClass('piedra12')
    mundo:addCollisionClass('piedra13')
    mundo:addCollisionClass('piedra14')
    mundo:addCollisionClass('piedra15')
    mundo:addCollisionClass('enemigo2')
    mundo:addCollisionClass('enemigo3')
    mundo:addCollisionClass('enemigo4')
    mundo:addCollisionClass('enemigo5')

    --# Variables xs y ys que se encargan de determinar la posicion de los minerales de manera 
    --aleatoria pero en un espacion restinguido y se les añade un collisoner en donde se pasa 
    --su posiion y se define su tipo
   
    xrandom1=math.random(100,300)
    yrandom1=math.random(100,200)
    mineral=mundo:newRectangleCollider(xrandom1,yrandom1,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('carbon')
    

    xrandom2=500
    yrandom2=math.random(500,550)
    mineral=mundo:newRectangleCollider(xrandom2,yrandom2,50,40)
    mineral:setType('static')
    mineral:setCollisionClass('hierro')

    xrandom3=math.random(100,300)
    yrandom3=math.random(1250,1600)
    mineral=mundo:newRectangleCollider(xrandom3,yrandom3,50,40)
    mineral:setType('static')
    mineral:setCollisionClass('cobre')

    xrandom4=math.random(1500,1700)
    yrandom4=math.random(500,600)
    mineral=mundo:newRectangleCollider(xrandom4,yrandom4,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('oro')
    

    xrandom5=math.random(1850,1990)
    yrandom5=math.random(1000,1150)
    mineral=mundo:newRectangleCollider(xrandom5,yrandom5,50,40)
    mineral:setType('static')
    mineral:setCollisionClass('rubi')

    xrandom6=math.random(650,800)
    yrandom6=math.random(240,260)
    mineral=mundo:newRectangleCollider(xrandom6,yrandom6,50,40)
    mineral:setType('static')
    mineral:setCollisionClass('cuarzo')

    xrandom7=math.random(1600,1800)
    yrandom7=math.random(1500,1650)
    mineral=mundo:newRectangleCollider(xrandom7,yrandom7,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('diamante')

    xrandom8=math.random(800,850)
    yrandom8=math.random(1050,1200)
    mineral=mundo:newRectangleCollider(xrandom8,yrandom8,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('piedra')


    xrandom9=math.random(1100,1200)
    yrandom9=math.random(400,500)
    mineral=mundo:newRectangleCollider(xrandom9,yrandom9,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('marmol')

    xrandom10=math.random(1000,1100)
    yrandom10=math.random(700,860)
    mineral=mundo:newRectangleCollider(xrandom10,yrandom10,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('granito')

    xrandom11=math.random(1450,1650)
    yrandom11=math.random(900,1000)
    mineral=mundo:newRectangleCollider(xrandom11,yrandom11,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('piedra11')

    xrandom12=math.random(100,250)
    yrandom12=math.random(800,1000)
    mineral=mundo:newRectangleCollider(xrandom12,yrandom12,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('piedra12')

    xrandom13=math.random(1450,1560)
    yrandom13=math.random(700,800)
    mineral=mundo:newRectangleCollider(xrandom13,yrandom13,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('piedra13')

    xrandom14=math.random(1950,2000)
    yrandom14=math.random(1450,1600)
    mineral=mundo:newRectangleCollider(xrandom14,yrandom14,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('piedra14')

    xrandom15=math.random(1200,1300)
    yrandom15=math.random(100,200)
    mineral=mundo:newRectangleCollider(xrandom15,yrandom15,50,40)
    mineral:setType('static') 
    mineral:setCollisionClass('piedra15')

--------------------------------------Jugador------------------------------------------
--# Tabla que se encarga de inicializar al jugador su posicion, su collider, a la clase que pertenecera
--y facotres como la velocidad y corazones
    jugador = {}
    jugador.collider=mundo:newBSGRectangleCollider(1050,1700,30,40,10)
    jugador.collider:setFixedRotation(true)
    jugador.collider:setCollisionClass('jugador')
    jugador.x = 1000
    jugador.y = 200
    jugador.speed = 100
    jugador.max_hearts=3
    jugador.corazones_perdidos=0
    jugador.hearts=jugador.max_hearts

    --#Seccion que se encarga de tanto la apariencia del jugador como de sus animaciones
    jugador.Hoja=love.graphics.newImage( 'Imagenes/Jugador3.png')
  

    --# Animaciones del jugador separando el sprite en subimagenes y recorriendolas a una velocidad
    --de 0.1 segundos para que asimile el movimiento de un jugador
    jugador.grid=anim8.newGrid(24,32,jugador.Hoja:getWidth(),jugador.Hoja:getHeight()) 
    jugador.animaciones={}
    jugador.animaciones.abajo=anim8.newAnimation(jugador.grid('1-8',1),0.1)
    jugador.animaciones.arriba=anim8.newAnimation(jugador.grid('1-8',2),0.1)
    jugador.animaciones.izquierda=anim8.newAnimation(jugador.grid('1-8',3),0.1)
    jugador.animaciones.derecha=anim8.newAnimation(jugador.grid('1-8',4),0.1)
    jugador.anim=jugador.animaciones.arriba
    
    --#Tabla que se encarga de cargar las imagenes que le perteneceran a los corazones del jugador
    corazon={}
    corazonPerdido={} 
    corazon.Hoja=love.graphics.newImage('Imagenes/heart.png' )
    corazonPerdido.Hoja=love.graphics.newImage('Imagenes/heart-empty.png' )

    sprites={} 
    sprites.animaciones={}
    sprites.corazon=corazon.Hoja

 ------------------------Gato-------------------------------   
 --# Tabla que se encarga de inicializar al gato acompañante su posicion,y facotres como la velocidad 
    gato={}
    gato.x=jugador.x + 20
    gato.y= jugador.y
    gato.speed=3
      --#Seccion que se encarga de tanto la apariencia del jugador como de sus animaciones
    gato.Hoja=love.graphics.newImage('Imagenes/cat.png' )
  
      --# Animaciones del gato separando el sprite en subimagenes y recorriendolas a una velocidad
    --de 0.1 segundos para que asimile el movimiento de un gato  
    gato.grid=anim8.newGrid(32,48,gato.Hoja:getWidth(),gato.Hoja:getHeight())
    gato.animaciones={}
    gato.animaciones.abajo=anim8.newAnimation(gato.grid('1-3',3),0.1)
    gato.animaciones.arriba=anim8.newAnimation(gato.grid('1-3',1),0.1)
    gato.animaciones.izquierda=anim8.newAnimation(gato.grid('1-3',4),0.1)
    gato.animaciones.derecha=anim8.newAnimation(gato.grid('1-3',2),0.1)
    gato.anim=gato.animaciones.arriba
    
  
 ------------------------Enemigos--------------------------------
--# Tabla que se encarga de inicializar al enemigo1 su posicion, su collider, a la clase que pertenecera
--y factores como la velocidad    
    slime={} 
    yrandomE=math.random(450,500)
    slime.x= 445
    slime.y = yrandomE
    colliderx=slime.x+100
    collidery=slime.y+90
    slime.speed=15
    slime.collider=mundo:newRectangleCollider(colliderx,collidery,30,20)
    slime.collider:setFixedRotation(true)
    slime.collider:setType('Dynamic') 
    
    --#Seccion que se encarga de tanto la apariencia del enemigo1 como de sus animaciones
    slime.Hoja=love.graphics.newImage( 'Imagenes/Slime.png')

    
    --# Animaciones del enemigo separando el sprite en subimagenes y recorriendolas a una velocidad
    --de 0.2 segundos para que asimile el movimiento de un jugador
    slime.grid=anim8.newGrid(64,64,slime.Hoja:getWidth(),slime.Hoja:getHeight())
    slime.animaciones={}
    slime.animaciones.moverse=anim8.newAnimation(slime.grid('1-4',1),0.2)
    slime.anim=slime.animaciones.moverse

    --#Verificador que se encarga de determinar si el enemigo coloca un señuelo de manera aleatoria
    --y lo crea añadiendole su clase y posicion
    if verificadorSeñuelos==1 then
    Coin.new(slime.x,slime.y-20)
    señuelo = mundo:newRectangleCollider(slime.x, slime.y, 15, 15)
    slime.señuelox=slime.x
    slime.señueloy=slime.y
    señuelo:setType('static') 
   señuelo:setCollisionClass('señuelo')
    end

    --# Tabla que se encarga de inicializar al enemigo2 su posicion, su collider, a la clase que pertenecera
    --y factores como la velocidad   
    slime2={} 
    --#Variable que crea de manera aleatoria la posicion x y y del enemigo 2
    xrandomE2=math.random(100,200)
    yrandomE2=math.random(200,300)
    slime2.x=xrandomE2
    slime2.y=yrandomE2
    slime2.collider=mundo:newRectangleCollider(slime2.x,slime2.y,30,20)
    slime2.collider:setFixedRotation(true)
    slime2.collider:setType('dynamic') 
    slime2.collider:setCollisionClass('enemigo2')
    --#Seccion que se encarga de tanto la apariencia del enemigo1 como de sus animaciones
    slime2.Hoja=love.graphics.newImage( 'Imagenes/Slime.png')
    --# Animaciones del enemigo separando el sprite en subimagenes y recorriendolas a una velocidad
    --de 0.2 segundos para que asimile el movimiento de un jugador
    slime2.grid=anim8.newGrid(64,64,slime2.Hoja:getWidth(),slime2.Hoja:getHeight())
    slime2.animaciones={}
    slime2.animaciones.moverse=anim8.newAnimation(slime2.grid('1-4',1),0.2)
    slime2.anim=slime2.animaciones.moverse

    --#Verificador que se encarga de determinar si el enemigo coloca un señuelo de manera aleatoria
    --y lo crea añadiendole su clase y posicion
    if verificadorSeñuelos==2 then
    Coin.new(slime2.x,slime2.y-20)
    señuelo = mundo:newRectangleCollider(slime2.x, slime2.y, 15, 15)
    slime2.señuelox=slime2.x
    slime2.señueloy=slime2.y
    señuelo:setType('static') 
   señuelo:setCollisionClass('señuelo')
    end

--# Tabla que se encarga de inicializar al enemigo1 su posicion, su collider, a la clase que pertenecera
--y factores como la velocidad    
    slime3={} 
    xrandomE3=math.random(1600,1800)
    yrandomE3=math.random(1500,1650)
    slime3.x=xrandomE3
    slime3.y=yrandomE3
    slime3.collider=mundo:newRectangleCollider(slime3.x,slime3.y,30,20)
    slime3.collider:setFixedRotation(true)
    slime3.collider:setType('dynamic') 
    slime3.collider:setCollisionClass('enemigo3')
    
    --#Seccion que se encarga de tanto la apariencia del enemigo1 como de sus animaciones
    slime3.Hoja=love.graphics.newImage( 'Imagenes/Slime.png')
    --# Animaciones del enemigo separando el sprite en subimagenes y recorriendolas a una velocidad
    --de 0.2 segundos para que asimile el movimiento de un jugador
    slime3.grid=anim8.newGrid(64,64,slime3.Hoja:getWidth(),slime3.Hoja:getHeight())
    slime3.animaciones={}
    slime3.animaciones.moverse=anim8.newAnimation(slime3.grid('1-4',1),0.2)
    slime3.anim=slime3.animaciones.moverse

    --#Verificador que se encarga de determinar si el enemigo coloca un señuelo de manera aleatoria
    --y lo crea añadiendole su clase y posicion
    if verificadorSeñuelos==3 then
    Coin.new(slime3.x,slime3.y-40)
    señuelo = mundo:newRectangleCollider(slime3.x, slime3.y, 15, 15)
    slime2.señuelox=slime2.x
    slime2.señueloy=slime2.y
    señuelo:setType('static') 
   señuelo:setCollisionClass('señuelo')
    end

--# Tabla que se encarga de inicializar al enemigo1 su posicion, su collider, a la clase que pertenecera
--y factores como la velocidad  
    slime4={} 
    --#Variable que crea de manera aleatoria la posicion x y y del enemigo 4
    xrandomE4=math.random(100,300)
    yrandomE4=math.random(1250,1550)
    slime4.x=xrandomE4
    slime4.y=yrandomE4
    slime4.collider=mundo:newRectangleCollider(slime4.x,slime4.y,30,20)
    slime4.collider:setFixedRotation(true)
    slime4.collider:setType('dynamic') 
    slime4.collider:setCollisionClass('enemigo4')
    --#Seccion que se encarga de tanto la apariencia del enemigo1 como de sus animaciones
    slime4.Hoja=love.graphics.newImage( 'Imagenes/Slime.png')
    --# Animaciones del enemigo separando el sprite en subimagenes y recorriendolas a una velocidad
    --de 0.2 segundos para que asimile el movimiento de un jugador
    slime4.grid=anim8.newGrid(64,64,slime4.Hoja:getWidth(),slime4.Hoja:getHeight())
    slime4.animaciones={}
    slime4.animaciones.moverse=anim8.newAnimation(slime4.grid('1-4',1),0.2)
    slime4.anim=slime4.animaciones.moverse

    --#Verificador que se encarga de determinar si el enemigo coloca un señuelo de manera aleatoria
    --y lo crea añadiendole su clase y posicion
    if verificadorSeñuelos==4 then
    Coin.new(slime4.x,slime4.y-20)
    señuelo = mundo:newRectangleCollider(slime4.x, slime4.y, 15, 15)
    slime4.señuelox=slime4.x
    slime4.señueloy=slime4.y
    señuelo:setType('static') 
    señuelo:setCollisionClass('señuelo')
    end

--# Tabla que se encarga de inicializar al enemigo1 su posicion, su collider, a la clase que pertenecera
--y factores como la velocidad  
    slime5={} 
    --#Variable que crea de manera aleatoria la posicion x y y del enemigo 5
    xrandomE5=math.random(900,1300)
    yrandomE5=math.random(600,660)
    slime5.x=xrandomE5
    slime5.y=yrandomE5
    slime5.collider=mundo:newRectangleCollider(slime5.x,slime5.y,30,20)
    slime5.collider:setFixedRotation(true)
    slime5.collider:setType('dynamic') 
    slime5.collider:setCollisionClass('enemigo5')
    --#Seccion que se encarga de tanto la apariencia del enemigo1 como de sus animaciones
    slime5.Hoja=love.graphics.newImage( 'Imagenes/Slime.png')
    --# Animaciones del enemigo separando el sprite en subimagenes y recorriendolas a una velocidad
    --de 0.2 segundos para que asimile el movimiento de un jugador
    slime5.grid=anim8.newGrid(64,64,slime5.Hoja:getWidth(),slime5.Hoja:getHeight())
    slime5.animaciones={}
    slime5.animaciones.moverse=anim8.newAnimation(slime5.grid('1-4',1),0.2)
    slime5.anim=slime5.animaciones.moverse
    --#Verificador que se encarga de determinar si el enemigo coloca un señuelo de manera aleatoria
    --y lo crea añadiendole su clase y posicion
    if verificadorSeñuelos==5 then
    Coin.new(slime5.x,slime5.y-40)
    señuelo = mundo:newRectangleCollider(slime5.x, slime5.y, 15, 15)
    slime5.señuelox=slime5.x
    slime5.señueloy=slime5.y
    señuelo:setType('static') 
   señuelo:setCollisionClass('señuelo')
   end
----------------------------Piedras-----------------------
--#Tabla que se encargara de la apariencia de cada piedra diferente y su apariencia   
    piedras={}
    piedras.Hoja=love.graphics.newImage('Imagenes/ore.png' )
    --#Se se para la imagen en grids con las dimensiones de las sub imagenes
    piedras.grid=anim8.newGrid(32,32,piedras.Hoja:getWidth(),piedras.Hoja:getHeight())
    --#Se encarga de referirse a cual piedra le equivale cual grid y los añade a una variable
    piedras.minerales={}
    piedras.minerales.carbon=anim8.newAnimation(piedras.grid(1,1),0.1)
    piedras.minerales.hierro=anim8.newAnimation(piedras.grid(5,1),0.1)
    piedras.minerales.cobre=anim8.newAnimation(piedras.grid(4,1),0.1)
    piedras.minerales.oro=anim8.newAnimation(piedras.grid(6,2),0.1)
    piedras.minerales.rubi=anim8.newAnimation(piedras.grid(2,1),0.1)
    piedras.minerales.diamante=anim8.newAnimation(piedras.grid(3,1),0.1)
    piedras.minerales.piedra=anim8.newAnimation(piedras.grid(7,2),0.1)
   
    piedras.carbon=piedras.minerales.carbon
    piedras.hierro=piedras.minerales.hierro
    piedras.cobre=piedras.minerales.cobre
    piedras.oro=piedras.minerales.oro
    piedras.rubi=piedras.minerales.rubi
    piedras.diamante=piedras.minerales.diamante
    piedras.piedra=piedras.minerales.piedra
    piedras.marmol=piedras.minerales.piedra
    piedras.granito=piedras.minerales.piedra
    piedras.cuarzo=piedras.minerales.piedra
    piedras.piedra11=piedras.minerales.piedra
    piedras.piedra12=piedras.minerales.piedra
    piedras.piedra13=piedras.minerales.piedra
    piedras.piedra14=piedras.minerales.piedra
    piedras.piedra15=piedras.minerales.piedra

    --Tabla que se encarga de la apariencia de los minerales pero minados
    --E igualmente e encarga de referirse a cual piedra le equivale cual grid y los añade a una variable
    recursos={}
    recursos.items={}
    recursos.items.carbon=anim8.newAnimation(piedras.grid(1,10),0.1)
    recursos.items.hierro=anim8.newAnimation(piedras.grid(5,12),0.1)
    recursos.items.cobre=anim8.newAnimation(piedras.grid(4,12),0.1)
    recursos.items.oro=anim8.newAnimation(piedras.grid(6,12),0.1)
    recursos.items.rubi=anim8.newAnimation(piedras.grid(2,11),0.1)
    recursos.items.diamante=anim8.newAnimation(piedras.grid(3,9),0.1)
    recursos.items.piedra=anim8.newAnimation(piedras.grid(7,8),0.1)
    recursos.items.vacio=anim8.newAnimation(piedras.grid(1,2),0.1)
    recursos.items.marmol=anim8.newAnimation(piedras.grid(4,9),0.1)
    recursos.items.granito=anim8.newAnimation(piedras.grid(5,9),0.1)
    recursos.items.cuarzo=anim8.newAnimation(piedras.grid(3,10),0.1)
--Variable que se encarga de la apariencia del señuelo
    piedras.señuelo=piedras.minerales.piedra

--#Tabla que se encarga de añadir todos los colliders que se añadieron al mapa de forma manual
--representando tanto los arboles como los brodes y los limites
  camino={}
    if mapa.layers["camino"] then
        for i, obj in pairs(mapa.layers["camino"].objects)do
        local camino1=mundo:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)   
        camino1:setType('static') 
        end
   end

end

---------------------------------------------------------------000-----------------------------------------------
--#Funcion que se encarga de actualizar los valores y variables a una velocidad de 60 fps
   
function love.update(dt)

--#Actualiza todos los señuelos a una velocidad de 60 fps para verificar cambios  
Coin.updateAll(dt)

--#Seccion que se encarga del movimientos como los imputs del teclado para definir el movimiento 
--del jugador

--#Variable que define si el jugador se esta movimedo
  local movimiento=false
  --Variables que se encargaran de dteerminar la velocidad con la que se movera el collisoner
  --acompañando al jugador
  local vx=0
  local vy=0
--(Se devuelve ambas variables ya sean en positivo o negativo para indicar la direccion)
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

    --#Se indica la dirreccion y velocidad con la que el collisoner se movera y el jugador lo acompañara
    jugador.collider:setLinearVelocity(vx,vy)

    jugador.x=jugador.collider:getX()
    jugador.y=jugador.collider:getY()
    --#Funcion que se encarga de actualizar las animaciones del jugador
    jugador.anim:update(dt)

    --#Se indica a quien seguira la camara
    cam:lookAt(jugador.x,jugador.y) 

 ----------------slime------------------------------------- 
enemMovin=false

  --Variables que se encargaran de determinar la velocidad con la que se movera el collisoner
  --acompañando a los enemigos
local vy1=0
local vx1=0
local vy2=0
local vx2=0
local vy3=0
local vx3=0
local vy4=0
local vx4=0
local vy5=0
local vx5=0

--#Conjunto de ciclos if que se encargaran de funcionar como algoritmo cuyo objetivo es que 
--el enemigo siga al jugador y su posicion en todo momento
if jugador.x-slime.x> 0 then
   vx1=slime.speed
    enemMovin=true
elseif jugador.x-slime.x< 0 then
    vx1=slime.speed*-1
    enemMovin=true
end
if jugador.y-slime.y> 0 then
vy1=slime.speed
    enemMovin=true
elseif jugador.y-slime.y< 0 then
    vy1=slime.speed*-1
    enemMovin=true
end

----------movimiento slime2------
--#Conjunto de ciclos if que se encargaran de funcionar como algoritmo cuyo objetivo es que 
--el enemigo siga al jugador y su posicion en todo momento
if jugador.x-slime2.x> 0 then
    vx2=slime.speed
     enemMovin2=true
 elseif jugador.x-slime2.x< 0 then
     vx2=slime.speed*-1
     enemMovin2=true
 end
 if jugador.y-slime2.y> 0 then
 vy2=slime.speed
     enemMovin2=true
 elseif jugador.y-slime2.y< 0 then
     vy2=slime.speed*-1
     enemMovin2=true
 end

-----------movimiento slime3-----------
--#Conjunto de ciclos if que se encargaran de funcionar como algoritmo cuyo objetivo es que 
--el enemigo siga al jugador y su posicion en todo momento

 if jugador.x-slime3.x> 0 then
    vx3=slime.speed
     enemMovin3=true
 elseif jugador.x-slime3.x< 0 then
     vx3=slime.speed*-1
     enemMovin3=true
 end
 if jugador.y-slime3.y> 0 then
 vy3=slime.speed
     enemMovin3=true
 elseif jugador.y-slime3.y< 0 then
     vy3=slime.speed*-1
     enemMovin3=true
 end

-----------movimiento slime4-------------
--#Conjunto de ciclos if que se encargaran de funcionar como algoritmo cuyo objetivo es que 
--el enemigo siga al jugador y su posicion en todo momento
 if jugador.x-slime4.x> 0 then
    vx4=slime.speed
     enemMovin4=true
 elseif jugador.x-slime4.x< 0 then
     vx4=slime.speed*-1
     enemMovin4=true
 end
 if jugador.y-slime4.y> 0 then
 vy4=slime.speed
     enemMovin5=true
 elseif jugador.y-slime4.y< 0 then
     vy4=slime.speed*-1
     enemMovin5=true
 end
-----------------movimiento slime5-----------
--#Conjunto de ciclos if que se encargaran de funcionar como algoritmo cuyo objetivo es que 
--el enemigo siga al jugador y su posicion en todo momento
if jugador.x-slime5.x> 0 then
    vx5=slime.speed
     enemMovin5=true
 elseif jugador.x-slime5.x< 0 then
     vx5=slime.speed*-1
     enemMovin5=true
 end
 if jugador.y-slime5.y> 0 then
 vy5=slime.speed
     enemMovin5=true
 elseif jugador.y-slime5.y< 0 then
     vy5=slime.speed*-1
     enemMovin5=true
 end

--------------------------------------------
 --#Se indica la dirreccion y velocidad con la que el collisoner se movera y el jugador lo acompañara
 slime.collider:setLinearVelocity(vx1,vy1)
    slime.x=slime.collider:getX()-45
    slime.y=slime.collider:getY()-60
    slime.anim:update(dt)

    slime2.anim:update(dt)
    slime2.collider:setLinearVelocity(vx2,vy2)
    slime2.x=slime2.collider:getX()-25
    slime2.y=slime2.collider:getY()-30

    slime3.anim:update(dt)
    slime3.collider:setLinearVelocity(vx3,vy3)
    slime3.x=slime3.collider:getX()-25
    slime3.y=slime3.collider:getY()-37

    slime4.anim:update(dt)
    slime4.collider:setLinearVelocity(vx4,vy4)
    slime4.x=slime4.collider:getX()-25
    slime4.y=slime4.collider:getY()-37

    slime5.anim:update(dt)
    slime5.collider:setLinearVelocity(vx5,vy5)
    slime5.x=slime5.collider:getX()-25
    slime5.y=slime5.collider:getY()-37

    -----------------+++++++++++++++++++++++---------------------------------------------
--#Seccion que se encarga de recibir los inputs del teclado para determinar el movimiento del gato
-- y como este acompaña al jugador durante todo el tiempo ya que es el mismo algoritmo que el del 
--jugador
    if love.keyboard.isDown("right") then
        gato.x = gato.x + gato.speed
        gato.anim=gato.animaciones.derecha
        movimiento=true
    end

    if love.keyboard.isDown("left") then
        gato.x = gato.x -  gato.speed
        gato.anim=gato.animaciones.izquierda
        movimiento=true
    end

    if love.keyboard.isDown("down") then
        gato.y = gato.y + gato.speed
        gato.anim=gato.animaciones.abajo
        movimiento=true
    end

    if love.keyboard.isDown("up") then
        gato.y = gato.y -gato.speed
        gato.anim=gato.animaciones.arriba
        movimiento=true
    end

    if movimiento==false then
        gato.anim:gotoFrame(2)
    end    
     --#Se indica la dirreccion y velocidad con la que el collisoner se movera y el gato lo acompañ
    gato.x=jugador.collider:getX()
    gato.y=jugador.collider:getY()
    gato.anim:update(dt)
  
--#Seccion que se encarga de determinar el tamaño dela pantalla y limita lo que la camara puede ver
--para que esta no se salga de los limites del mapa
    local w= love.graphics.getWidth()
    local h=love.graphics.getHeight()
    
    if cam.x < w/2 then
        cam.x =w/2
    end
    
    if cam.y < h/2 then
        cam.y =h/2
    end
   
    local mapaw=mapa.width* mapa.tilewidth
    local mapah=mapa.height*mapa.tileheight
  
    if cam.x > (mapaw - w/2) then
        cam.x =(mapaw - w/2)
    end
    
    if cam.y > (mapah - w/2) then
        cam.y =(mapah - w/2)
    end
    
--#Seccion que se encarga de recibir a los contadores de los enemigos y determinar si el valor de
--estos es igual a 10 y si lo es los corazones disminuyen por 2
  if contador==10 then
    jugador.corazones_perdidos=jugador.corazones_perdidos + 1
    jugador.max_hearts=1
  end

  if contador2==10 then
    jugador.corazones_perdidos=jugador.corazones_perdidos + 1
    jugador.max_hearts=1
  end

  if contador3==10 then
    jugador.corazones_perdidos=jugador.corazones_perdidos + 1
    jugador.max_hearts=1
  end
  if contador4==10 then
    jugador.corazones_perdidos=jugador.corazones_perdidos + 1
    jugador.max_hearts=1
  end
  if contador5==10 then
    jugador.corazones_perdidos=jugador.corazones_perdidos + 1
    jugador.max_hearts=1
  end
  
  --#Seccion que por medio de ifs verifica el cuanto daño se le hara al jugador tomando en cuenta
  --que si ha sido dañado anteriormente sumando los contadores de daño de los enemigos
  if contadorSeñuelos==10 then
    if contador+contador2+contador3+contador4+contador5==0 then
    jugador.max_hearts=2
    end
      if contador+contador2+contador3+contador4+contador5==10 then
        jugador.max_hearts=0
      end
  end
--#Ciclo que se encarga de verificar si dos enemigos han hehco daño por medio de la suma de todos
--sus contadores de daño y si es asi el jugador pierde todas sus vidas
  if contador+contador2+contador3+contador4+contador5==20 then
    jugador.corazones_perdidos=jugador.corazones_perdidos + 1
    jugador.max_hearts=-1
  end
  --#Ciclo que se encarga de verificar si ya el jugador no tiene mas vidas este muere y se cierra
  -- la aplicacion
if  jugador.max_hearts==-1 then
    love.event.quit()
end
--#Actuliza el mundo y sus valores

    mundo:update(dt)
end

---------------------------------------------------------------------------------------------------------------
-----Funcion que se encarga de dibujar todos los componentes del mundo

function love.draw()
   
    --Funcion que se encarga de mostrar los collisoners que se utilizan para detectar a otros valores
    mundo:setQueryDebugDrawing(true)

  --#Conjunto de tablas que reciben el input del declado y activan un collisoner rodeando al jugador
  --para determinar si uno de los valores esta en su alcanzo para minarlo
   marmol={}
   if love.keyboard.isDown('m') then
    local px,py=jugador.collider:getPosition()
     marmol=mundo:queryCircleArea(px,py,40,{'marmol'})
   end
   rubi={}
   if love.keyboard.isDown('m') then
    local px,py=jugador.collider:getPosition()
     rubi=mundo:queryCircleArea(px,py,40,{'rubi'})
   end
 
    cobre={}
  if love.keyboard.isDown('m') then
        local px,py=jugador.collider:getPosition()
         cobre=mundo:queryCircleArea(px,py,40,{'cobre'})
    end

    piedra={}
    if love.keyboard.isDown('m') then
     local px,py=jugador.collider:getPosition()
      piedra=mundo:queryCircleArea(px,py,40,{'piedra'})
    end
    cuarzo={}
    if love.keyboard.isDown('m') then
     local px,py=jugador.collider:getPosition()
      cuarzo=mundo:queryCircleArea(px,py,40,{'cuarzo'})
    end

    oro={}
    if love.keyboard.isDown('m') then
        local px,py=jugador.collider:getPosition()
         oro=mundo:queryCircleArea(px,py,40,{'oro'})
    end

    hierro={}
    if love.keyboard.isDown('m') then
        local px,py=jugador.collider:getPosition()
         hierro=mundo:queryCircleArea(px,py,40,{'hierro'})
    end

    carbon={}
    if love.keyboard.isDown('m') then
        local px,py=jugador.collider:getPosition()
         carbon=mundo:queryCircleArea(px,py,40,{'carbon'})
         
    end
 
    granito={}
    if love.keyboard.isDown('m') then
        local px,py=jugador.collider:getPosition()
         granito=mundo:queryCircleArea(px,py,40,{'granito'})
    end
    diamante={}
    if love.keyboard.isDown('m') then
        local px,py=jugador.collider:getPosition()
         diamante=mundo:queryCircleArea(px,py,40,{'diamante'})
    end
   
    piedra11={}
    if love.keyboard.isDown('m') then
     local px,py=jugador.collider:getPosition()
      piedra11=mundo:queryCircleArea(px,py,40,{'piedra11'})
    end
    
    piedra12={}
    if love.keyboard.isDown('m') then
     local px,py=jugador.collider:getPosition()
      piedra12=mundo:queryCircleArea(px,py,40,{'piedra12'})
    end
    
    piedra13={}
    if love.keyboard.isDown('m') then
     local px,py=jugador.collider:getPosition()
      piedra13=mundo:queryCircleArea(px,py,40,{'piedra13'})
    end
    
    piedra14={}
    if love.keyboard.isDown('m') then
     local px,py=jugador.collider:getPosition()
      piedra14=mundo:queryCircleArea(px,py,40,{'piedra14'})
    end
    
    piedra15={}
    if love.keyboard.isDown('m') then
     local px,py=jugador.collider:getPosition()
      piedra15=mundo:queryCircleArea(px,py,40,{'piedra15'})
    end
    
    --#Conjunto de tablas de los enemigos que activa un collisoner que detecta si el jugador esta en
    --su rango mientras se mueven
       enemy={}
    if enemMovin==true then
        local px,py=slime.collider:getPosition()
         enemy=mundo:queryCircleArea(px,py,20,{'jugador'})
    end
    enemy2={}
    if enemMovin==true then
        local px,py=slime2.collider:getPosition()
         enemy2=mundo:queryCircleArea(px,py,20,{'jugador'})
    end

    enemy3={}
    if enemMovin==true then
        local px,py=slime3.collider:getPosition()
         enemy3=mundo:queryCircleArea(px,py,20,{'jugador'})
    end
    enemy4={}
    if enemMovin==true then
        local px,py=slime4.collider:getPosition()
         enemy4=mundo:queryCircleArea(px,py,20,{'jugador'})
    end
    enemy5={}
    if enemMovin==true then
        local px,py=slime5.collider:getPosition()
         enemy5=mundo:queryCircleArea(px,py,20,{'jugador'})
    end
    --#Tabla que se encarga de confiramr si un señuelo esta en el alcance del jugador para  minarlo
    señuelo={}
    if love.keyboard.isDown('m') then
        local px,py=jugador.collider:getPosition()
         señuelo=mundo:queryCircleArea(px,py,40,{'señuelo'})
         
    end
   
    --#Ciclos que verifica si el collionsoner creado anteriromente detecto su objetivo y borrando 
    --a los componentes activados ya sea enemigo o señuelo simulando que mueren o explotan
    if #señuelo> 0 then
    piedras.señuelo=recursos.items.vacio
        contadorSeñuelos=10
            end

    if #enemy> 0 then
        contador=10
        slime.anim=recursos.items.vacio

    end

    if #enemy2> 0 then
        contador2=10
        slime2.anim=recursos.items.vacio
        
    end

    if #enemy3> 0 then
        contador3=10
        slime3.anim=recursos.items.vacio 
        
    end
    if #enemy4> 0 then
        contador4=10
        slime4.anim=recursos.items.vacio
    end
    if #enemy5> 0 then
        contador5=10
        slime5.anim=recursos.items.vacio
    end
   
    --#Ciclos que verifica si el collionsoner del jugador creado anteriromente detecto un mineral y los borra 
    -- simulando que se minan y se activa un sonido cada vez que se hace
    if #diamante>0 then
        sonidos.blip:play()
        piedras.diamante=recursos.items.vacio
    end
    if #granito>0 then
        sonidos.blip:play()
        piedras.granito=recursos.items.vacio
    end
    if #marmol>0 then
        sonidos.blip:play()
        piedras.marmol=recursos.items.vacio
    end

    if #oro> 0 then
        sonidos.blip:play()
        piedras.oro=recursos.items.vacio
    end
    
    if #piedra>0 then
        sonidos.blip:play()
        piedras.piedra=recursos.items.vacio
    end
    if #cuarzo>0 then
        sonidos.blip:play()
        piedras.cuarzo=recursos.items.vacio
    end

    if #cobre> 0 then
        sonidos.blip:play()
        piedras.cobre=recursos.items.vacio
    end

    if #carbon> 0 then
        sonidos.blip:play()
        piedras.carbon=recursos.items.vacio
    end
    
    if #rubi> 0 then
        sonidos.blip:play()
        piedras.rubi=recursos.items.vacio
    end

    if #hierro> 0 then
        sonidos.blip:play()
        piedras.hierro=recursos.items.vacio
    end
    if #piedra11>0 then
        sonidos.blip:play()
        piedras.piedra11=recursos.items.vacio
    end
    if #piedra12>0 then
        sonidos.blip:play()
        piedras.piedra12=recursos.items.vacio
    end
    if #piedra13>0 then
        sonidos.blip:play()
        piedras.piedra13=recursos.items.vacio
    end
    if #piedra14>0 then
        sonidos.blip:play()
        piedras.piedra14=recursos.items.vacio
    end
    if #piedra15>0 then
        sonidos.blip:play()
        piedras.piedra15=recursos.items.vacio
    end


--#Ciclo que se encarga de determinar todo lo que no sera contenido principalmente en todo momento 
--en la camara
   cam:attach()
        
  --#Se dibuja el mapa por todas sus capas una por una para que queden acomadas correctamente
        mapa:drawLayer((mapa.layers["Tile Layer 4"]))
        mapa:drawLayer((mapa.layers["Tile Layer 3"]))
        mapa:drawLayer((mapa.layers["Tile Layer 2"]))
        mapa:drawLayer((mapa.layers["Tile Layer 1"]))
        mapa:drawLayer((mapa.layers["Tile Layer 5"]))
        
     --#Se dibuja al jugador,gato y enemigos pasando su imagen,posicion y cuanto se incrementara su
     --escala   
        jugador.anim:draw(jugador.Hoja,jugador.x,jugador.y,nil,1.5,nil,12,17)  
        gato.anim:draw(gato.Hoja,gato.x,gato.y,nil,1,nil,12,17) 
        slime.anim:draw(slime.Hoja,slime.x,slime.y,nil,1.5) 
        slime2.anim:draw(slime2.Hoja,slime2.x-20,slime2.y-35,nil,1.5) 
        slime3.anim:draw(slime3.Hoja,slime3.x-20,slime3.y-25,nil,1.5) 
        slime4.anim:draw(slime4.Hoja,slime4.x-20,slime4.y-25,nil,1.5) 
        slime5.anim:draw(slime5.Hoja,slime5.x-20,slime5.y-25,nil,1.5) 

        --#Se verifica cual señuelo se ha colocado y de que enemigo y se dibuja en la posicion del
        --enemigo dada
        if verificadorSeñuelos==1 then
            piedras.señuelo:draw(piedras.Hoja,slime.señuelox,slime.señueloy,nil,1.5)
        end 

        if verificadorSeñuelos==2 then
            piedras.señuelo:draw(piedras.Hoja,slime2.señuelox,slime2.señueloy,nil,1.5)
        end 
        if verificadorSeñuelos==3 then
            piedras.señuelo:draw(piedras.Hoja,slime3.señuelox,slime3.señueloy,nil,1.5)
        end 
        if verificadorSeñuelos==4 then
        piedras.señuelo:draw(piedras.Hoja,slime4.señuelox,slime4.señueloy,nil,1.5)
        end 
        if verificadorSeñuelos==5 then
            piedras.señuelo:draw(piedras.Hoja,slime5.señuelox,slime5.señueloy,nil,1.5)
        end 
        
        --#Se dibujan a todas las piedras tomando su imagen,posicion y cuanto aumentara su escala
        piedras.carbon:draw(piedras.Hoja,xrandom1,yrandom1,nil,1.5) 
        piedras.hierro:draw(piedras.Hoja,xrandom2,yrandom2,nil,1.5) 
        piedras.cobre:draw(piedras.Hoja,xrandom3,yrandom3,nil,1.5) 
        piedras.oro:draw(piedras.Hoja,xrandom4,yrandom4,nil,1.5) 
        piedras.rubi:draw(piedras.Hoja,xrandom5,yrandom5,nil,1.5) 
        piedras.cuarzo:draw(piedras.Hoja,xrandom6,yrandom6,nil,1.5)
        piedras.diamante:draw(piedras.Hoja,xrandom7,yrandom7,nil,1.5) 
        piedras.piedra:draw(piedras.Hoja,xrandom8,yrandom8,nil,1.5)
        piedras.marmol:draw(piedras.Hoja,xrandom9,yrandom9,nil,1.5) 
        piedras.granito:draw(piedras.Hoja,xrandom10,yrandom10,nil,1.5) 
        piedras.piedra11:draw(piedras.Hoja,xrandom11,yrandom11,nil,1.5)
        piedras.piedra12:draw(piedras.Hoja,xrandom12,yrandom12,nil,1.5)
        piedras.piedra13:draw(piedras.Hoja,xrandom13,yrandom13,nil,1.5)
        piedras.piedra14:draw(piedras.Hoja,xrandom14,yrandom14,nil,1.5)
        piedras.piedra15:draw(piedras.Hoja,xrandom15,yrandom15,nil,1.5)

        --#Si desea ver los collisoners colocados en pantalla solo elimine llos siguientes "--" de mundo
        mundo:draw()
    cam:detach()


    --#Se dibuja lo que aparecera en pantalla en todo momento y dentro de la camara
    --Conjunto de ciclos if que verifican si se ha eliminado la piedra dada y colocando el mineral
    --recolectado de la misma en pantalla simulando un inventario
    if piedras.carbon==recursos.items.vacio then
        
        recursos.items.carbon:draw(piedras.Hoja,600,10,nil,1)
    end
    if piedras.diamante==recursos.items.vacio then
        recursos.items.diamante:draw(piedras.Hoja,510,10,nil,1)
    end
    if piedras.cuarzo==recursos.items.vacio then
        recursos.items.cuarzo:draw(piedras.Hoja,570,10,nil,1)
    end
    if piedras.granito==recursos.items.vacio then
        recursos.items.granito:draw(piedras.Hoja,480,10,nil,1)
    end
    if piedras.oro==recursos.items.vacio then
        recursos.items.oro:draw(piedras.Hoja,690,10,nil,1)
    end
    if piedras.piedra==recursos.items.vacio then
        recursos.items.piedra:draw(piedras.Hoja,630,10,nil,0.8)
    end
    if piedras.rubi==recursos.items.vacio then
        recursos.items.rubi:draw(piedras.Hoja,660,10,nil,1)
    end
    if piedras.hierro==recursos.items.vacio then
        recursos.items.hierro:draw(piedras.Hoja,720,10,nil,1)
    end
    if piedras.marmol==recursos.items.vacio then
        recursos.items.marmol:draw(piedras.Hoja,540,10,nil,1)
    end
    if piedras.cobre==recursos.items.vacio then
      
        recursos.items.cobre:draw(piedras.Hoja,750,10,nil,1)
    end


--#Conjunto de ciclos if que verifican si se han minado todas las piedras y se han adquirido
--los minerales y concluye el juego
    if piedras.carbon==recursos.items.vacio then
        if piedras.diamante==recursos.items.vacio then  
        if piedras.cuarzo==recursos.items.vacio then
            if piedras.granito==recursos.items.vacio then
    if piedras.oro==recursos.items.vacio then
    if piedras.piedra==recursos.items.vacio then
    if piedras.rubi==recursos.items.vacio then
    if piedras.hierro==recursos.items.vacio then
    if piedras.marmol==recursos.items.vacio then
    if piedras.cobre==recursos.items.vacio then
        sonidos.victory:play()
        love.event.quit()
    end
    end
    end
    end
    end
    end
    end
    end
    end
    end

-- Seccion que se encarga de mostrar en pantalla cuantos corazones se tiene y si disminuyen
    local width=sprites.corazon:getWidth()+25

    for i=0 , jugador.max_hearts do
        local offset = (i) * width
           local heartsheet=sprites.corazon
        if i>jugador.hearts then
        heartsheet=sprites.corazones_perdidos
end

  love.graphics.draw(heartsheet,10 + offset,10,nil,3)
end
end

