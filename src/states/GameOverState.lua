GameOverState = Class{__includes = BaseState}

function GameOverState:init()

    --point,M_NO,B_NO
if B_NO >= 8 and M_NO <= 2 then
    WON_FLAG = true
    gSounds['happy']:play()
end


if B_NO < 8  or M_NO > 2 then
    LOST_FLAG = true
    gSounds['sad']:play()
end

end

function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.mouse.wasTouched(1) then
        love.event.quit()
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

   
end


function GameOverState:render()




    if WON_FLAG then
    --reset color
        love.graphics.setColor(255, 255, 255, 255)
	    love.graphics.setColor(255,20,147, 255)
        love.graphics.setFont(gFonts['verylarge'])
        love.graphics.printf('Hurray!!! YOU WON', 0, 64, VIRTUAL_WIDTH, 'center')

            love.graphics.setColor(255, 255, 255, 255)
            love.graphics.draw(gTextures['diamond'],VIRTUAL_WIDTH/2 - 103.5, 190)
    end

    if LOST_FLAG then
    --reset color
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.setColor(255,20,147, 255)
        love.graphics.setFont(gFonts['verylarge'])
        love.graphics.printf('Oh..oh!!! YOU LOST', 0, 64, VIRTUAL_WIDTH, 'center')

        love.graphics.setColor(230,150,147, 255)
        love.graphics.setFont(gFonts['medium'])
         love.graphics.printf("You Haven't maintained atleast 8 bananas!!" , 0, 330, VIRTUAL_WIDTH, 'center')
         love.graphics.printf("|or| You Haven't runout all the monkeys!!" , 0, 345, VIRTUAL_WIDTH, 'center')
            love.graphics.setColor(255, 255, 255, 255)
            love.graphics.draw(gTextures['cry'],VIRTUAL_WIDTH/2 - 58 , 190)
    end



    --reset color
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setColor(200,166,64, 255)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('YOUR SCORE IS '..tostring(point), 0, 150, VIRTUAL_WIDTH, 'center')




    --reset color
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.setColor(255,140,0, 255)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Want To Play Again?? Restart the Game...☺☺ ', 50, 364, VIRTUAL_WIDTH)


end

function GameOverState:enter()
    -- if we're coming from death, restart scrolling
    scrolling = true
end

--[[
    Called when this state changes to another state.
]]
function GameOverState:exit()
    -- stop scrolling for the death/score screen
    scrolling = false
end