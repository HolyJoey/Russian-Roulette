--Made by holyjoey.
--2.2.2

util.require_natives('2944b')

menu.toggle(menu.my_root(), "Enable Roulette Chat", { "rrchat" }, "Enables the ability for others to play Russian Roulette by typing 'playrr' in chat.", function(on)
    enablerr = on
end)
chat.on_message(function(pid, unused, content, tc)
    if enablerr then
        local lowerContent = content:lower()
        if lowerContent:find('playrr') and not lowerContent:find('> ') then
            chat.send_message('> Welcome to Russian Roulette ' .. players.get_name(pid) .. '. Loading the gun.', tc, true, true)
            util.yield(4000)
            chat.send_message('> Pulling the trigger.', tc, true, true)
            util.yield(1000)
            local rndNum = math.random(1, 3)
            if rndNum == 1 then
                chat.send_message("> *click* uhg you survived this time :/", tc, true, true)
            elseif rndNum == 2 then
                chat.send_message("> Bang!", tc, true, true)
                chat.send_message("> It looks like " .. players.get_name(pid) .. " did not survive. Whoops.", tc, true, true)
                menu.trigger_commands("crash" .. players.get_name(pid))
            else
                chat.send_message("> *click* you should try this again :)", tc, true, true)
            end
        end
    end
end)

menu.action(menu.my_root(), "Announce In Chat", { "announcerr" }, "Announce in chat that Russian Roulette has been enabled.", function()
    chat.send_message('> Russian Roulette has been enabled. Play by typing "playrr".', tc, true, true)
end)

util.keep_running()
