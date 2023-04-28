--Made by Holy#6599
util.require_natives(1660775568)

randomizer = function(x)
    local r = math.random(1,3)
    return x[r]
end

array = {"1","1","2"}

menu.action(menu.my_root(), "Pull the trigger", { "RussianRoulette" }, "Play russian roulette with your game", function()
    if randomizer(array) == "1" then
        util.toast("Your game survived")
    else
        util.log("Looks like your game died")
        ENTITY.APPLY_FORCE_TO_ENTITY(0, 0, 0, 0, 0, 0, 0, 0, 0, false, false, false, false, false)
    end
end)

util.keep_running()
