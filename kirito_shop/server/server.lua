ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('kirito:achatEau') 
AddEventHandler('kirito:achatEau', function() 
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 5 
  local argent = joueur.getMoney()
    if argent >= prix then 
      joueur.removeMoney(prix) 
      joueur.addInventoryItem('eau', 1) 
      TriggerClientEvent('esx:showNotification', source, "~g~Achat :~s~ \n- Objet : ~g~x1 ~s~~o~Eau \n~s~- Paiement : ~g~Liquide~s~\n- Prix : ~r~5€")
    else 
      TriggerClientEvent('esx:showNotification', source, "~r~Achat annulé~s~\n - ~o~Pas assez d'argent")
    end
end)

RegisterNetEvent('kirito:achatPain') 
AddEventHandler('kirito:achatPain', function() 
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 4 
  local argent = joueur.getMoney()
    if argent >= prix then 
      joueur.removeMoney(prix) 
      joueur.addInventoryItem('pain', 1) 
      TriggerClientEvent('esx:showNotification', source, "~g~Achat :~s~ \n- Objet : ~g~x1 ~s~~o~Pain \n~s~- Paiement : ~g~Liquide~s~\n- Prix : ~r~4€")
    else 
     TriggerClientEvent('esx:showNotification', source, "~r~Achat annulé~s~\n - ~o~Pas assez d'argent")
    end
end)

 -----------------------------------------------------------------------banque-----------------------------------------------------------------------

RegisterNetEvent('kirito:banqueachatPain') 
AddEventHandler('kirito:banqueachatPain', function() 
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 4 
  local argent = joueur.getAccount('bank').money
    if argent >= prix then 
      joueur.removeAccountMoney('bank', prix)
      joueur.addInventoryItem('pain', 1) 
      TriggerClientEvent('esx:showNotification', source, "~g~Achat :~s~ \n- Objet : ~g~x1 ~s~~o~Pain \n~s~- Paiement : ~o~Banque~s~\n- Prix : ~r~4€")
    else 
     TriggerClientEvent('esx:showNotification', source, "~r~Achat annulé~s~\n - ~o~Pas assez d'argent")
    end
end)


RegisterNetEvent('kirito:banqueachatEau') 
AddEventHandler('kirito:banqueachatEau', function() 
  local joueur = ESX.GetPlayerFromId(source)  
  local prix = 4 
  local argent = joueur.getAccount('bank').money
    if argent >= prix then 
      joueur.removeAccountMoney('bank', prix)
      joueur.addInventoryItem('eau', 1) 
      TriggerClientEvent('esx:showNotification', source, "~g~Achat :~s~ \n- Objet : ~g~x1 ~s~~o~Pain \n~s~- Paiement : ~o~Banque~s~\n- Prix : ~r~4€")
    else 
     TriggerClientEvent('esx:showNotification', source, "~r~Achat annulé~s~\n - ~o~Pas assez d'argent")
    end
end)
