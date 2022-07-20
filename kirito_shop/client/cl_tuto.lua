ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

function RefreshMoney()
    Citizen.CreateThread(function()
            ESX.Math.GroupDigits(ESX.PlayerData.money)
            ESX.Math.GroupDigits(ESX.PlayerData.accounts[1].money) --  Argent propre
            ESX.Math.GroupDigits(ESX.PlayerData.accounts[2].money) -- Argent sale 
    end)
end

function OpenTuto()
    local Shop = RageUI.CreateMenu("Supérette", "Moyen de payement")
    local manger = RageUI.CreateSubMenu(Shop, "Supérette", "MENU") 
    local boire = RageUI.CreateSubMenu(Shop, "Supérette", "MENU") 
    local liquide = RageUI.CreateSubMenu(Shop, "Supérette", "MENU")
    local liquidemanger = RageUI.CreateSubMenu(liquide, "Supérette", "MENU")
    local liquideboire = RageUI.CreateSubMenu(liquide, "Supérette", "MENU")
    local liquidedivers = RageUI.CreateSubMenu(liquide, "Supérette", "MENU")
    local banque = RageUI.CreateSubMenu(Shop, "Supérette", "MENU")
    local banquedivers = RageUI.CreateSubMenu(banque, "Supérette", "MENU")
    local banquemanger = RageUI.CreateSubMenu(banque, "Supérette", "MENU")
    local banqueboire = RageUI.CreateSubMenu(banque, "Supérette", "MENU")
   

    RageUI.Visible(Shop, not RageUI.Visible(Shop))
    while Shop do
        Wait(0)

        RageUI.IsVisible(Shop, true, true, true, function()

            
                ESX.PlayerData = ESX.GetPlayerData()
                RefreshMoney()
                RageUI.ButtonWithStyle("Liquide 💶", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(_, _, s)
                end,liquide)

                RageUI.ButtonWithStyle("banque 💳", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(_, _, s)
                end,banque)
            
           
        end, function()
        end)

        RageUI.IsVisible(liquide, true, true, true, function()
            ESX.PlayerData = ESX.GetPlayerData()
                RefreshMoney()
                RageUI.Separator("→ Mode de Paiement : ~g~Liquide ~s~ ←")
                RageUI.Separator("→ Votre Solde liquide : ~g~".. ESX.Math.GroupDigits(ESX.PlayerData.money).."~s~ € ←")
                RageUI.ButtonWithStyle("Nourriture", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(_, _, s)
                end,liquidemanger)
                RageUI.ButtonWithStyle("Boissons", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(_, _, s)
                end,liquideboire)
                
        end)

        RageUI.IsVisible(liquidemanger, true, true, true, function()
            RageUI.ButtonWithStyle("Pain 🥖", "Acheter du pain", {RightLabel = "5€"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('kirito:achatPain')
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(liquideboire, true, true, true, function()
            RageUI.ButtonWithStyle("Eau 🥤", "Acheter de l'eau", {RightLabel = "4€"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('kirito:achatEau')
                end
            end)
        end, function()
        end)

    

        RageUI.IsVisible(banque, true, true, true, function()
            ESX.PlayerData = ESX.GetPlayerData()
            RefreshMoney()
            RageUI.Separator("→ Mode de Paiement : ~o~Banque ~s~ ←")
            RageUI.Separator("→ Votre Solde Banque : ~o~".. ESX.Math.GroupDigits(ESX.PlayerData.accounts[1].money).."~s~ € ←")
                RageUI.ButtonWithStyle("Nourriture", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(_, _, s)
                end,banquemanger)
                RageUI.ButtonWithStyle("Boissons", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(_, _, s)
                end,banqueboire)
                
        end)

        RageUI.IsVisible(banquemanger, true, true, true, function()
                RageUI.ButtonWithStyle("Pain 🥖", "Acheter du pain", {RightLabel = "5€"}, true, function(Hovered, Active, Selected)
                  if (Selected) then
                      TriggerServerEvent('kirito:banqueachatPain')
                    end
                end)
            end, function()
            end)

            RageUI.IsVisible(banqueboire, true, true, true, function()
                RageUI.ButtonWithStyle("Eau 🥤", "Acheter de l'eau", {RightLabel = "5€"}, true, function(Hovered, Active, Selected)
                  if (Selected) then
                      TriggerServerEvent('kirito:banqueachatEau')
                    end
                end)
            end, function()
            end)




        if not RageUI.Visible(Shop) and not RageUI.Visible(manger) and not RageUI.Visible(boire) and not RageUI.Visible(liquide) and not RageUI.Visible(liquidemanger) and not RageUI.Visible(liquideboire) and not RageUI.Visible(liquidedivers) and not RageUI.Visible(banque) and not RageUI.Visible(banquemanger) and not RageUI.Visible(banqueboire) and not RageUI.Visible(banquedivers) then
            Shop = RMenu:DeleteType("Shop", true)
        end
    end
end

local position = {
    {x = 373.875,   y = 325.896,  z = 103.566},
    {x = 2557.458,  y = 382.282,  z = 108.622},
    {x = -3038.939, y = 585.954,  z = 7.908},
    {x = -3241.927, y = 1001.462, z = 12.830},
    {x = 547.431,   y = 2671.710, z = 42.156},
    {x = 1961.464,  y = 3740.672, z = 32.343},
    {x = 2678.916,  y = 3280.671, z = 55.241},
    {x = 1729.216,  y = 6414.131, z = 35.037},
    {x = 1135.808,  y = -982.281,  z = 46.415},
    {x = -1222.915, y = -906.983,  z = 12.326},
    {x = -1487.553, y = -379.107,  z = 40.163},
    {x = -2968.243, y = 390.910,   z = 15.043},
    {x = 1166.024,  y = 2708.930,  z = 38.157},
    {x = 1392.562,  y = 3604.684,  z = 34.980},
    {x = -48.519,   y = -1757.514, z = 29.421},
    {x = 1163.373,  y = -323.801,  z = 69.205},
    {x = -707.501,  y = -914.260,  z = 19.215},
    {x = -1820.523, y = 792.518,   z = 138.118},
    {x = 1698.388,  y = 4924.404,  z = 42.063},
    {x = 25.82,  y = -1345.22,  z = 29.5},
    {x = -864.2,  y = -2409.29,  z = 14.03},
    {x = 967.74,  y = -1867.96,  z = 31.3}
}    

Citizen.CreateThread(function()
for k, v in pairs(position) do
    local blip = AddBlipForCoord(v.x, v.y, v.z)
    SetBlipSprite(blip, 52)
    SetBlipScale (blip, 0.6)
    SetBlipColour(blip, 18)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Supérette')
    EndTextCommandSetBlipName(blip)
end
end)    

Citizen.CreateThread(function()
while true do
    local sleep = 500
        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
                if dist <= 1.0 then
                sleep = 0
                RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour acheter des produits alimentaires", time_display = 1 })
                if IsControlJustPressed(1,51) then
                    OpenTuto()
                end
            end
        end
    Citizen.Wait(sleep)
end
end)