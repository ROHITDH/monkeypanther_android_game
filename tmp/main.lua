
push = require 'push'
Class = require 'class'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288


function love.load()
    -- initialize our nearest-neighbor filter
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    -- seed the RNG
    math.randomseed(os.time())

    -- app window title
    love.window.setTitle('Fifty Bird')

    -- initialize our nice-looking retro text fonts
    smallFont = love.graphics.newFont('font.ttf', 8)

    love.graphics.setFont(smallFont)

    -- initialize our virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })


    monkeyTable = {}
    a = 0
    b = 1
    for i = 1,16 do
        table.insert(monkeyTable, {})
            table.insert(monkeyTable[i], {
                x = a ,
                y = b
            })
        a = a + 2
        b = b + 2
    end

    -- initialize input table
    love.keyboard.keysPressed = {}

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end



function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end


function love.update(dt)

    love.keyboard.keysPressed = {}
   
end

function love.draw()
    push:start()
    
        love.graphics.print(tostring(monkeyTable[16][1].x), 50, 50)
    

    push:finish()
end