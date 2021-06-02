ESX = nil
local playersProcessingCannabis = {}

local DISCORD_WEBHOOK = "WEBHOOK_HERE"
local DISCORD_NAME = 'yatzzz'
local DISCORD_IMAGE = "https://i.hizliresim.com/uhJ4s3.gif"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local itemsList = {}

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM items', {}, function(itemsResult)
		for i=1, #itemsResult, 1 do
			itemsList[i] = {
				label = itemsResult[i].label,
				name  = itemsResult[i].name,
				price = itemsResult[i].price
			}
		end
	end)
end)

RegisterServerEvent('coder_dealer:rStart')
AddEventHandler('coder_dealer:rStart',function()
    DiscordHook(GetCurrentResourceName(), GetCurrentResourceName() .. " başlatıldı!", 65280)
    Citizen.Wait(5000)
end)


RegisterServerEvent('esx_allrounddealer:fetch')
AddEventHandler('esx_allrounddealer:fetch', function()
	TriggerClientEvent('esx_allrounddealer:fetchitems', source, itemsList)
end)


RegisterServerEvent('coder_delar:givemoney')
AddEventHandler('coder_delar:givemoney',function(item,price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemn = xPlayer.getInventoryItem(item).count
	local money = price * itemn
	if itemn >= 1 then
		xPlayer.removeInventoryItem(item,itemn)
		xPlayer.addMoney(money)
	else
		TriggerClientEvent('esx:showNotification', source, 'Yeterli eşya bulunamıyor')
	end
end)

RegisterServerEvent('esx_oranges:sellOrange')
AddEventHandler('esx_oranges:sellOrange', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(itemName)
	local price = nil
	price = Config.Allrounditems[itemName]



	if xItem.count < amount then
		TriggerClientEvent('esx:showNotification', source, _U('allrounddealer_notenough'))
		return
	end

	price = ESX.Math.Round(price * amount)

	DiscordHook(xPlayer.name .. " " .. xItem.name .. " sattı!", " **"..xPlayer.identifier.."** "..xPlayer.job.name.." **" .. xPlayer.name .. "** kişisi **"..amount.."** adet **"..xItem.name.."** satarak **"..price.."**$ kazandı. ", 2003199)

	xPlayer.removeInventoryItem(xItem.name, amount)
	xPlayer.addInventoryItem('cash', price)
	TriggerClientEvent('esx:showNotification', source, _U('allrounddeal_sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
end)


function DiscordHook(name, message, color)
	local connect = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
			  ["text"] = os.date('!%Y-%m-%d - %H:%M:%S') .. " / yatzzz",
			  },
		  }
	  }
	  if Config.Log == "dc" then
	PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
	  elseif Config.Log == "console" then
	print(message)
	  end
  end













