StartState = Class{__includes = BaseState}

function StartState:init()


end


function StartState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.mouse.wasTouched(1) then
        gSounds['enter']:play()
        gStateMachine:change('play', {
                        level = 1
                    })
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end



function StartState:render()
	--reset color
	love.graphics.setColor(255, 255, 255, 255)

	-- title of game
	love.graphics.setColor(255,20,147, 255)
    love.graphics.setFont(gFonts['verylarge'])
    love.graphics.printf('Monkey Shot', 0, 64, VIRTUAL_WIDTH, 'center')


    --reset color
	love.graphics.setColor(255, 255, 255, 255)

	-- title of game
	love.graphics.setColor(255,140,0, 255)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Press ENTER to continue', 215, 364, VIRTUAL_WIDTH)

      love.graphics.setColor(255, 255, 255, 255)
            love.graphics.draw(gTextures['monkeyStart'],VIRTUAL_WIDTH/2 - 72, 190)


end

function StartState:enter()
    -- if we're coming from death, restart scrolling
    scrolling = true
end

--[[
    Called when this state changes to another state.
]]
function StartState:exit()
    -- stop scrolling for the death/score screen
    scrolling = false
end