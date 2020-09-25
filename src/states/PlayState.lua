PlayState = Class{__includes = BaseState}



function PlayState:init()
    startingWidth = 300
     startingHeight = 110

     endingWidth = 575
     endingHeight = 0

     arrowChance = 24

    self.monkeyTable = {}
    self.bananaTable = {}


    self.monkeyNumber = 16
    self.bananaNumber = 16

   
    self.minSpeed = 15
    self.maxSpeed = 30


    monkeyWidth = 41
    monkeyHeight = 30

    arrowWidth = 86
    arrowHeight = 86

    changeFlag = false

    self.flag0 = false
    self.flag1 = false
    self.flag2 = false
    self.flag3 = false
    self.flag4 = false
    self.flag5 = false
    self.flag6 = false
    self.flag7 = false
    self.flag8 = false
    self.level = 2

    for i = 1,self.monkeyNumber do
        table.insert(self.monkeyTable, {})
            table.insert(self.monkeyTable[i], {
                x = math.random(startingWidth,endingWidth) ,
                y = math.random(startingHeight,endingHeight)
            })
    end

    for i = 1,self.monkeyNumber do
        table.insert(self.bananaTable, {})
            local temp = math.random(680,776)  
            table.insert(self.bananaTable[i], {
                x = temp ,
                y = math.random(213,383)
            })
            
    end

    Mflag = true
    allArrowFlag = true
    controlFlag = true
    controlFlag2 = true
    notKillFlag = true
    controlFlag3 = true
    controlFlag4 = false
    controlFlag5 = false
    changeFlag = false
    a=0

    ww = 100
    hh = 240

    arrowPos = {x = ww, y = hh}
    TimeWaste = {zzz = 10, yyy = 10}

    point = 0
  
end

function PlayState:enter(def)
    self.minSpeed = math.floor(math.random(self.minSpeed/self.level))
    self.maxSpeed = math.floor(math.random(self.minSpeed,self.maxSpeed/self.level))
end


function PlayState:update(dt)
M_NO = self.monkeyNumber
B_NO = self.bananaNumber

if controlFlag then

    arrowPos = {x = ww, y = hh}

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return')  or love.mouse.wasTouched(1) then
        if arrowChance > -1 then
            arrowChance = arrowChance - 1
        end

        if arrowChance == -1  or self.monkeyNumber <= 1 or self.bananaNumber <= 1 then
            gStateMachine:change('GameOver')
            changeFlag = true
        end

        if not changeFlag then
        gSounds['arrowStart']:play()
         Timer.tween(1, {
                [TimeWaste] = {zzz = 100 , yyy = 140}
            }):finish(function()
             gSounds['arrowFlow']:play()
         end)
        end
        



        allArrowFlag = false
        controlFlag = false
        if a == 0 then
            self.flag0 = true

            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 140}
            }):finish(function()
                self.flag0 = false 
                allArrowFlag = true
                controlFlag = true
            
            end)

        end

        if a == 1 then
            self.flag1 = true
            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 170}
            }):finish(function()
                self.flag1 = false
                allArrowFlag = true
                controlFlag = true
            
            end)

        end

        if a == 2 then
            self.flag2 = true
            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 200}
            }):finish(function()
                self.flag2 = false
                allArrowFlag = true
                controlFlag = true
            
            end)

        end

        if a == 3 then
            self.flag3 = true
            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 230}
            }):finish(function()
                self.flag3 = false
                allArrowFlag = true
                controlFlag = true
            
            end)
            
        end

        if a == 4 then
           self.flag4 = true
            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 260}
            }):finish(function()
                self.flag4 = false
                allArrowFlag = true
                controlFlag = true
            
            end)
             
        end

        if a == 5 then
            self.flag5 = true
            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 290}
            }):finish(function()
                self.flag5 = false
                allArrowFlag = true
                controlFlag = true
            
            end)
            
        end

        if a == 6 then
            self.flag6 = true
            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 320}
            }):finish(function()
                self.flag6 = false
                allArrowFlag = true
                controlFlag = true
            
            end)
            
        end

        if a == 7 then
            self.flag7 = true
            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 350}
            }):finish(function()
                self.flag7 = false
                allArrowFlag = true
                controlFlag = true
            
            end)
            
        end

        if a == 8 then
            self.flag8 = true
            Timer.tween(8, {
                [arrowPos] = {x = 680 , y = 380}
            }):finish(function()
                self.flag8 = false
                allArrowFlag = true
                controlFlag = true
            
            end)
            
        end
    end

    if counter1 > 17 then
        counter1 = 0
    end

if allArrowFlag then
--arrow down
-------------------------------
    if counter1 == 0 then
        self.flag0 = true
        a=0
    end
    if counter1 == 1 then
        self.flag0 = false
        self.flag1 = true
        a=1
    end
    if counter1 == 2 then
        self.flag1 = false
        self.flag2 = true
        a=2
    end
    if counter1 == 3 then
        self.flag2 = false
        self.flag3 = true
        a=3
    end
    if counter1 == 4 then
        self.flag3 = false
        self.flag4 = true
        a=4
    end
    if counter1 == 5 then
        self.flag4 = false
        self.flag5 = true
        a=5
    end
    if counter1 == 6 then
        self.flag5 = false
        self.flag6 = true
        a=6
    end
    if counter1 == 7 then
        self.flag6 = false
        self.flag7 = true
        a=7
    end
    if counter1 == 8 then
        self.flag7 = false
        self.flag8 = true
        a=8
    end
---------------------------

--arrow up
-------------------------------
    if counter1 == 9 then
        self.flag8 = true
        a=8
    end
    if counter1 == 10 then
        self.flag8 = false
        self.flag7 = true
        a=7
    end
    if counter1 == 11 then
        self.flag7 = false
        self.flag6 = true
        a=6
    end
    if counter1 == 12 then
        self.flag6 = false
        self.flag5 = true
        a=5
    end
    if counter1 == 13 then
        self.flag5 = false
        self.flag4 = true
        a=4
    end
    if counter1 == 14 then
        self.flag4 = false
        self.flag3 = true
        a=3
    end
    if counter1 == 15 then
        self.flag3 = false
        self.flag2 = true
        a=2
    end
    if counter1 == 16 then
        self.flag2 = false
        self.flag1 = true
        a=1
    end
    if counter1 == 17 then
        self.flag1 = false
        self.flag0 = true
        a=0
    end
---------------------------
end
end




    if Mflag then

        Mflag = false
        Timer.tween(math.random(self.minSpeed,self.maxSpeed), {  
            [self.monkeyTable[self.monkeyNumber][1]] = {x = 585 , y = 67}
        }):finish(function()
            local bW = self.bananaTable[self.bananaNumber][1].x
            local bH = self.bananaTable[self.bananaNumber][1].y        
                gSounds['MEnter']:play()
                Timer.tween(12, {
                [self.monkeyTable[self.monkeyNumber][1]] = {x = bW , y = bH}
            }):finish(function()


                local retW = math.random(startingWidth,endingWidth)
                local retH = math.random(startingHeight,endingHeight)

                if notKillFlag then
                    
                    controlFlag4 = true
                    gSounds['MEnter']:play()
                    self.bananaTable[self.bananaNumber][1].x =  self.bananaTable[self.bananaNumber][1].x + monkeyWidth - 17
                     self.bananaTable[self.bananaNumber][1].y =  self.bananaTable[self.bananaNumber][1].y +  11
                    Timer.tween(20, {
                    [self.monkeyTable[self.monkeyNumber][1]] = {x = retW , y = retH},
                    [self.bananaTable[self.bananaNumber][1]] = {x = retW + monkeyWidth - 17 , y = retH + 11}
                    }):finish(function()
                    controlFlag4 = false

                    if controlFlag5 == true then
                       
                        --something
                        if self.bananaNumber > 1 then
                            self.bananaNumber = self.bananaNumber - 1
                            table.remove(self.bananaTable, self.bananaNumber+1)
                        end

                        Timer.tween(4, {  
                            [self.monkeyTable[self.monkeyNumber][1]] = {x = 170 , y = 396}
                        }):finish(function()
                        
                            point = point + 1
                            controlFlag5 = false
                            Mflag = true
                            if self.monkeyNumber > 1 then
                                self.monkeyNumber = self.monkeyNumber - 1
                                table.remove(self.monkeyTable, self.monkeyNumber+1)
                                gSounds['MDie']:play()
                                controlFlag3 = true
                            end
                        end)

                    else

                        if self.bananaNumber > 1 then
                            self.bananaNumber = self.bananaNumber - 1
                            table.remove(self.bananaTable, self.bananaNumber+1)
                        end

                        if self.monkeyNumber > 1 then
                            Mflag = true
                        end
                    end
                
                    
                end)
                    
                end
            end)

        end)
    end



    if controlFlag3 then
    if self:collides(self.monkeyTable[self.monkeyNumber][1]) then
        gSounds['MTouch']:play()

        if controlFlag4 == true then
            controlFlag5 = true
            controlFlag3 = false
        else

        controlFlag3 = false
        notKillFlag = false
        controlFlag2 = false
        Mflag = false

        point = point + 1

        Timer.tween(10, {  
            [self.monkeyTable[self.monkeyNumber][1]] = {x = 705 , y = 385}
        }):finish(function()

        Timer.tween(2, {  
            [self.monkeyTable[self.monkeyNumber][1]] = {x = 170 , y = 385}
        }):finish(function()
            if self.monkeyNumber > 1 then
                self.monkeyNumber = self.monkeyNumber - 1
                table.remove(self.monkeyTable, self.monkeyNumber+1)
                gSounds['MDie']:play()
                
                
                Mflag = true
                controlFlag2 = true
                notKillFlag = true
                controlFlag3 = true
        end
        end) 
        end) 
        end
    end
    end
    

    Timer.update(dt)
end



function PlayState:collides(target)
   -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if arrowPos.x > target.x + monkeyWidth or target.x > arrowPos.x + arrowWidth then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if arrowPos.y + 40  > target.y + monkeyHeight or target.y > arrowPos.y + arrowHeight - 40 then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

function PlayState:render()

    --reset color
	love.graphics.setColor(255, 255, 255, 255)



    for i = 1,self.bananaNumber do
            love.graphics.draw(gTextures['banana'], self.bananaTable[i][1].x, self.bananaTable[i][1].y)
    end


   
    for i = 1,self.monkeyNumber do
            love.graphics.draw(gTextures['monkey'], self.monkeyTable[i][1].x, self.monkeyTable[i][1].y)
    end

    

    love.graphics.draw(gTextures['pp'],25 , 250)
    love.graphics.draw(gTextures['bow'],70 , 230)
    love.graphics.draw(gTextures['aCase'],-20, 220)
    
    if self.flag0 then
           love.graphics.draw(gTextures['a0'],arrowPos.x, arrowPos.y)
    end

    if self.flag1 then
           love.graphics.draw(gTextures['a1'],arrowPos.x, arrowPos.y)
    end

    if self.flag2 then
           love.graphics.draw(gTextures['a2'],arrowPos.x, arrowPos.y)
    end

    if self.flag3 then
           love.graphics.draw(gTextures['a3'],arrowPos.x, arrowPos.y)
    end

     if self.flag4 then
           love.graphics.draw(gTextures['a4'],arrowPos.x, arrowPos.y)
    end

    if self.flag5 then
           love.graphics.draw(gTextures['a5'],arrowPos.x, arrowPos.y)
    end

    if self.flag6 then
           love.graphics.draw(gTextures['a6'],arrowPos.x, arrowPos.y)
    end

    if self.flag7 then
           love.graphics.draw(gTextures['a7'],arrowPos.x, arrowPos.y)
    end

    if self.flag8 then
           love.graphics.draw(gTextures['a8'],arrowPos.x, arrowPos.y)
    end

    love.graphics.setColor(255,20,147, 255)
    love.graphics.setFont(gFonts['medium'])
    love.graphics.print(tostring(arrowChance) .." "..'Arrows Left', 0, VIRTUAL_HEIGHT - 30)


    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setColor(204,204,0, 255)
    love.graphics.setFont(gFonts['medium'])
    love.graphics.print('SCORE  '..tostring(point), 0, 50)


end


function PlayState:exit()
    -- stop scrolling for the death/score screen
    scrolling = false
end