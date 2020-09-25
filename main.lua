
-- initialize our nearest-neighbor filter
love.graphics.setDefaultFilter('nearest', 'nearest')

-- this time, we're keeping all requires and assets in our Dependencies.lua file
require 'src/Dependencies'


-- physical screen dimensions
WINDOW_WIDTH = 720
WINDOW_HEIGHT = 360

-- virtual resolution dimensions
VIRTUAL_WIDTH = 850
VIRTUAL_HEIGHT = 416

interval1 = 0.5
counter1 = 0


function love.load()
    
    gSounds['background']:setLooping(true)
    gSounds['background']:play()
    -- window bar title
    love.window.setTitle('Monkey Shot')

    -- seed the RNG
    math.randomseed(os.time())

    -- initialize our virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true,
        canvas = true
    })  

     -- initialize state machine with all state-returning functions
    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['GameOver'] = function () return GameOverState() end  
    }

    gStateMachine:change('start') 

    love.keyboard.keysPressed = {}
    
    love.mouse.screenPressed = {}


    Timer.every(interval1, function()
            counter1 = counter1 + 1
        end)
end



function love.resize(w, h)
    push:resize(w, h)
end


function love.mousepressed(x, y, istouch)
    love.mouse.screenPressed[istouch] = true
end

function love.mouse.wasTouched(istouch)
    return love.mouse.screenPressed[istouch]
end

--keyboard
function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end



function love.update(dt)
	-- body
	xx, yy = push:toGame(love.mouse.getPosition())
	gStateMachine:update(dt)
    Timer.update(dt)
	love.keyboard.keysPressed = {}
     love.mouse.screenPressed = {}
end


function love.draw()
    push:start()

    -- scrolling background drawn behind every state
    love.graphics.draw(gTextures['background'], 0, 0)

    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 255, 0, 255)

    gStateMachine:render()
    push:finish()
end