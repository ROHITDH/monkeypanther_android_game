--[[
    GD50
    Match-3 Remake

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    -- Dependencies --

    A file to organize all of the global dependencies for our project, as
    well as the assets for our game, rather than pollute our main.lua file.
]]

--
-- libraries
--
Class = require 'lib/class'

push = require 'lib/push'

Timer = require 'lib/knife.timer'

require 'src/StateMachine'

require 'src/states/StartState'
require 'src/states/BaseState'
require 'src/states/PlayState'

require 'src/states/GameOverState'


gSounds = {
    ['background'] = love.audio.newSource('sounds/background.mp3','static'),
    ['happy'] = love.audio.newSource('sounds/happy.wav','static'),
    ['sad'] = love.audio.newSource('sounds/sad.wav','static'),
    ['MEnter'] = love.audio.newSource('sounds/monkeyEnter.wav','static'),
    ['MTouch'] = love.audio.newSource('sounds/monkeyTouch.ogg','static'),
    ['MDie'] = love.audio.newSource('sounds/monkeyDie.wav','static'),
    ['arrowFlow'] = love.audio.newSource('sounds/arrowFlow.wav','static'),
    ['arrowStart'] = love.audio.newSource('sounds/arrowStart.wav','static'),
    ['enter'] = love.audio.newSource('sounds/enter.wav','static'),

}

gTextures = {
    ['background'] = love.graphics.newImage('graphics/background.png'),
    ['monkey'] = love.graphics.newImage('graphics/monkey.png'),
    ['pp'] = love.graphics.newImage('graphics/pinkPanther.png'),
    ['bow'] = love.graphics.newImage('graphics/bow.png'),
    ['aCase'] = love.graphics.newImage('graphics/arrowCase.png'),
    ['banana'] = love.graphics.newImage('graphics/banana.png'),
    ['diamond'] = love.graphics.newImage('graphics/diamond.png'),
    ['cry'] = love.graphics.newImage('graphics/cry.png'),
      ['monkeyStart'] = love.graphics.newImage('graphics/monkeyStart.png'),


    --arrows

     ['a0'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (0).png'),
     ['a1'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (1).png'),
     ['a2'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (2).png'),
     ['a3'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (3).png'),
     ['a4'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (4).png'),
     ['a5'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (5).png'),
     ['a6'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (6).png'),
     ['a7'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (7).png'),
     ['a8'] = love.graphics.newImage('graphics/arrow/output-onlinepngtools (8).png'),
  }


-- this time, we're keeping our fonts in a global table for readability
gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
     ['verylarge'] = love.graphics.newFont('fonts/font.ttf', 64)
}