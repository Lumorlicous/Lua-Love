
function love.load()
    
    love.graphics.setBackgroundColor(40,0.2,25)

    bullets = {}
    bulletSpeed = 300

    --Player
    player = {x = 250, y = 250, width = 15, height = 15}

    math.randomseed(os.time())

    monster = { x = 500, y =500, width, width = 15, height = 15}

end

function love.update(dt)
-- right motion
if love.keyboard.isDown("d") then
    player.x = player.x + 50 * dt
end
--Left Motion
if love.keyboard.isDown("a") then
    player.x = player.x - 50 * dt
end
--up 
if love.keyboard.isDown("w") then
    player.y = player.y - 50 * dt
end
--down
if love.keyboard.isDown("s") then
    player.y = player.y + 50 * dt
end
--Movement

for i,v in ipairs(bullets) do
    --moving bullets
    v.x = v.x + (v.dx * dt)
    v.y = v.y + (v.dy * dt)

if  v.x >= monster.x and v.x <= (monster.x + monster.width) and 
v.y >= monster.y and v.y <= (monster.y + monster.height) then

    monster.x = math.random (0,600)
    monster.y = math.random (0,800)
end
end
end

function love.draw ()
    --PLayer
    love.graphics.setColor(1,2,1)
    love.graphics.rectangle("fill", player.x, player.y, player.width,player.height)


    --Draw Bullets
    for i,v in ipairs (bullets) do
        love.graphics.circle("fill", v.x, v.y, 3)
    end

    --set Monster 
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill" , monster.x, monster.y, monster.width, monster.height)
end

function love.mousepressed(x, y, button)
    if button == 1 then
        local startX = player.x + player.width/2
        local startY = player.y + player.height/2

        local mouseY = y
        local mouseX = x

        local angle = math.atan2((mouseY - startY), (mouseX - startX))

        local bulletDx = bulletSpeed * math.cos(angle)
        local bulletDy = bulletSpeed * math.sin(angle)
        
        table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
    end
end