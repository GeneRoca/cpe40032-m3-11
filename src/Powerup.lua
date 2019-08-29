Powerup = Class{}

function Powerup:init()
    self.width = 16
    self.height = 16

    self.x = math.random(1, VIRTUAL_WIDTH - self.width)
    self.y = -16
    self.dy = math.random (20, 40) 
end

function Powerup:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

-- ARKANOID UPDATE: TO KNOW IF ITS THE KEY OR THE MULTIBALL POWER UP
function Powerup:setSkin()
    if self.type == 'ball' then
        self.skin = 1
    else
        self.skin = 2
    end
end

function Powerup:update(dt)
    self.y = self.y + self.dy * dt
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], gFrames['powerup'][self.skin], self.x, self.y)
end 