-- create ore
local surface=game.player.surface
local ore=nil
local ore_name="uranium-ore"
local size=2
local density=10
for y=-size, size do
    for x=-size, size do
        a=(size+1-math.abs(x))*10
        b=(size+1-math.abs(y))*10
        if a<b then
            ore=math.random(a*density-a*(density-8), a*density+a*(density-8))
        end
        if b<a then
            ore=math.random(b*density-b*(density-8), b*density+b*(density-8))
        end
        if surface.get_tile(game.player.position.x+x, game.player.position.y+y).collides_with("ground-tile") then
            surface.create_entity({name=ore_name, amount=ore, position={game.player.position.x+x, game.player.position.y+y}})
        end
    end
end

-- find drill
local drill = game.player.surface.find_entities_filtered{ name = "nuclear-mining-drill" }[1]
