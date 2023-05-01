--------------------------------------------------
------------- JOIN OUR DISCORD SERVER ------------
--------- https://discord.gg/7gbCD9Fzct ----------
--------------------------------------------------
--------------- DEVELOPED BY FLAP ----------------
-------------------- WITH 💜 ---------------------
--------------------------------------------------

local createCharacterPlaces = {
	{ coords = vector3(668.41, 1004.41, 968.32), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-655.29, -3126.86, 368.64), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-622.93, -3403.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-602.93, -3453.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-582.93, -3503.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-562.93, -3553.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-542.93, -3603.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-522.93, -3653.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-502.93, -3703.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-482.93, -3753.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-462.93, -3803.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-442.93, -3853.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-422.93, -3903.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-402.93, -3953.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-382.93, -4003.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-362.93, -4053.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-342.93, -4103.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-322.93, -4153.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-302.93, -4203.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-282.93, -4253.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-262.93, -4303.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-242.93, -4353.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-222.93, -4403.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-202.93, -4453.43, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1163.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1263.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1363.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1463.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1563.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1663.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1763.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1863.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1963.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2063.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2163.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2263.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2363.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2463.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2563.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2663.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2763.43, -3727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2713.43, -3677.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2663.43, -3627.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2613.43, -3577.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2563.43, -3527.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2513.43, -3477.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2463.43, -3427.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2413.43, -3377.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2363.43, -3327.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2313.43, -3277.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2263.43, -3227.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2213.43, -3177.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2163.43, -3127.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2113.43, -3077.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2063.43, -3027.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-2013.43, -2977.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1963.43, -2927.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1913.43, -2877.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1863.43, -2827.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1813.43, -2777.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1763.43, -2727.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1713.43, -2677.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1663.43, -2627.98, 333.85), heading = 345.0, playerInPlace = false },
	{ coords = vector3(-1613.43, -2577.98, 333.85), heading = 345.0, playerInPlace = false },
}
local playersInPlaces       = {}
local playerIdentity        = {}
ESX                         = exports["es_extended"]:getSharedObject()

AddEventHandler('onResourceStart', function(resourceName)

	if resourceName == GetCurrentResourceName() then

		while FLAP_SHOPS == nil do
			Wait(10)
		end

		print('^6[flap_character_creation] ^2resource flap_character_creation successfully loaded ^6[developed by Flap]^7 ^6[our discord - discord.gg/7gbCD9Fzct ]^0')
	end

end)

ESX.RegisterServerCallback('flap_character_creation:getConfigData', function(source, cb)
	while FLAP_CHARACTER_CREATION == nil do
		Citizen.Wait(10)
	end

	cb(FLAP_CHARACTER_CREATION)
end)

RegisterServerEvent('flap_character_creation:saveSkin')
AddEventHandler('flap_character_creation:saveSkin', function(skin)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	MySQL.Async.execute('UPDATE users SET `skin` = @skin WHERE identifier = @identifier',
			{
				['@skin']       = json.encode(skin),
				['@identifier'] = xPlayer.identifier
			})

end)

RegisterServerEvent('flap_character_creation:saveIdentity')
AddEventHandler('flap_character_creation:saveIdentity', function(data)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer then

		MySQL.Sync.execute('UPDATE users SET firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex WHERE identifier = @identifier', {
			['@identifier']  = xPlayer.identifier,
			['@firstname'] = data.firstName,
			['@lastname'] = data.lastName,
			['@dateofbirth'] = data.birthday,
			['@sex'] = data.sex
		})

	end
end)

RegisterServerEvent('flap_character_creation:requestPlace')
AddEventHandler('flap_character_creation:requestPlace', function()
	for k, v in pairs(createCharacterPlaces) do
		if not v.playerInPlace then
			v.playerInPlace = true
			playersInPlaces[source] = k
			TriggerClientEvent('flap_character_creation:teleportToPlace', source, k, v)
			return
		end
	end
end)

RegisterServerEvent('flap_character_creation:setPlaceToFree')
AddEventHandler('flap_character_creation:setPlaceToFree', function(id)
	createCharacterPlaces[id].playerInPlace = false
end)

AddEventHandler('playerDropped', function()
	local src = source

	if playersInPlaces[src] ~= nil then
		createCharacterPlaces[playersInPlaces[src]].playerInPlace = false
	end
end)

ESX.RegisterServerCallback('flap_character_creation:getSkin', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		local user = users[1]
		local skin = nil

		if user.skin ~= nil then
			skin = json.decode(user.skin)
		end

		cb(skin)
	end)
end)
