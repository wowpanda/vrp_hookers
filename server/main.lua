--------------------------------------------------
--                 _   _ _     _                --
--       Made by  | \ | | |   (_)               --
--       ___  __ _|  \| | |__  _  ___           --
--      / __|/ _` | . ` | '_ \| |/ _ \          --
--      \__ \ (_| | |\  | | | | |  __/          --
--      |___/\__,_\_| \_/_| |_| |\___|          --
--                           _/ |               --
--                          |__/  2019          --
--                                              --
--    https://forum.fivem.net/u/stianhje/       --
--------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_trucker")
-------------------------------------------------------------------------------
-- Get Money / Remove money
-------------------------------------------------------------------------------
RegisterServerEvent('sawu_hookers:pay')
AddEventHandler('sawu_hookers:pay', function(boolean)
	local user_id = vRP.getUserId({source})

    if (boolean == true) then
        --if vRP.getMoney({user_id}) >= Config.BlowjobPrice then
        if(vRP.tryFullPayment({user_id, Config.BlowjobPrice}))then
            vRPclient.notify(source, {"~w~[ESCORTE] ~r~Ai platit pentru blowjob"})
            TriggerClientEvent('sawu_hookers:startBlowjob', source)
            -- this adds money to society_nightclub
            if Config.SocietyNightclub then
                --sa adaugi bani la un id
            end
        else
            vRPclient.notify(source, {"~w~[esc] ~r~nu ai bani"})
            TriggerClientEvent('sawu_hookers:noMoney', source)
        end  
    else
        --if xPlayer.getMoney() >= Config.SexPrice then
        if(vRP.tryFullPayment({user_id, Config.SexPrice}))then
            TriggerClientEvent('sawu_hookers:startSex', source)
            vRPclient.notify(source, {"~w~[ESCORTE] ~r~Ai platit pentru sex"})
            -- this adds money to society_nightclub
            if Config.SocietyNightclub then
                --sa adaugi bani la un id
            end
        else
            vRPclient.notify(source, {"~w~[ESCORTE] ~r~Nu ai bani destui"})
            TriggerClientEvent('sawu_hookers:noMoney', source)
        end 
    end
end)




