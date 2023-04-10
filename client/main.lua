--------------------------------------------------
------------- JOIN OUR DISCORD SERVER ------------
--------- https://discord.gg/7gbCD9Fzct ----------
--------------------------------------------------
--------------- DEVELOPED BY FLAP ----------------
-------------------- WITH 💜 ---------------------
--------------------------------------------------

ESX                        = exports["es_extended"]:getSharedObject()
sConfig                    = nil
currentHeading             = nil
local PlayerData           = {}
local inCharCreator        = false
local FirstSpawn           = true
local inPlace              = nil
local inPlaceData          = nil
local cam                  = nil

Citizen.CreateThread(function()

	print('^6[flap_character_creation] ^2resource flap_character_creation successfully loaded ^6[developed by Flap]^7 ^6[our discord - discord.gg/7gbCD9Fzct ]^0')

	while sConfig == nil do
		ESX.TriggerServerCallback('flap_character_creation:getConfigData', function(config)
			sConfig = config
		end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

------------------------------------------------------
------------------------------------------------------
------------------ Flap Development ------------------
------------------------------------------------------
----------------------- THREADS ----------------------
------------------------------------------------------
------------------ Developed by Flap -----------------
------------------------------------------------------
------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Wait(0)

		if inCharCreator then
			for k,v in pairs(sConfig) do
				for i=1, #v.DisableControlAction, 1 do
					DisableControlAction(v.DisableControlAction[i].a, v.DisableControlAction[i].b, v.DisableControlAction[i].c)
				end
			end
			N_0xf4f2c0d4ee209e20()
		else
			Wait(1500)
		end
	end
end)

------------------------------------------------------
------------------------------------------------------
------------------ Flap Development ------------------
------------------------------------------------------
-------------------- NUI CALLBACKS -------------------
------------------------------------------------------
------------------ Developed by Flap -----------------
------------------------------------------------------
------------------------------------------------------

RegisterNUICallback('saveAndClose', function(data, cb)
	for k,v in pairs(sConfig) do
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:loadSkin', {
					sex              = 0,
					torso_1          = v.DefaultOutfit.defOutfitMale.torso_1,
					torso_2          = v.DefaultOutfit.defOutfitMale.torso_2,
					arms             = v.DefaultOutfit.defOutfitMale.arms,
					pants_1          = v.DefaultOutfit.defOutfitMale.pants_1,
					pants_2          = v.DefaultOutfit.defOutfitMale.pants_2,
					shoes_1          = v.DefaultOutfit.defOutfitMale.shoes_1,
					shoes_2          = v.DefaultOutfit.defOutfitMale.shoes_2,
				})
			else
				TriggerEvent('skinchanger:loadSkin', {
					sex              = 1,
					torso_1          = v.DefaultOutfit.defOutfitFemale.torso_1,
					torso_2          = v.DefaultOutfit.defOutfitFemale.torso_2,
					arms             = v.DefaultOutfit.defOutfitFemale.arms,
					pants_1          = v.DefaultOutfit.defOutfitFemale.pants_1,
					pants_2          = v.DefaultOutfit.defOutfitFemale.pants_2,
					shoes_1          = v.DefaultOutfit.defOutfitFemale.shoes_1,
					shoes_2          = v.DefaultOutfit.defOutfitFemale.shoes_2,
				})
			end
		end)
		flap_openNUI("char_creator", false)
		TriggerServerEvent('flap_character_creation:saveIdentity', data)
	end
end)

RegisterNUICallback('character_rotation', function(data, cb)
	flap_charRotation(data.rotationType)
end)

RegisterNUICallback('changeCharacterValue', function(data, cb)
	TriggerEvent("skinchanger:getSkin", function(skin)
		skin[data.name] = data.result
		TriggerEvent("skinchanger:loadSkin", skin)
	end)

	Wait(1000)

	if data.name == "sex" then
	    flap_loadDefSkin()
	end
end)

RegisterNUICallback('changeColor', function(data, cb)
	TriggerEvent("skinchanger:getSkin", function(skin)
		skin[data.name] = data.color
		TriggerEvent("skinchanger:loadSkin", skin)
	end)
end)

RegisterNUICallback('changeCam', function(data, cb)
	flap_changeCam(data.type)
end)

------------------------------------------------------
------------------------------------------------------
------------------ Flap Development ------------------
------------------------------------------------------
---------------------- TRIGGERES ---------------------
------------------------------------------------------
------------------ Developed by Flap -----------------
------------------------------------------------------
------------------------------------------------------

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	Wait(5000)
	Citizen.CreateThread(function()
		if FirstSpawn then
			ESX.TriggerServerCallback('flap_character_creation:getSkin', function(skin)
				if skin == nil then
					Wait(1000)
					TriggerEvent("flap_character_creation:NUIfunct")
				end
				FirstSpawn = false
			end)
		end
	end)
end)

RegisterNetEvent('flap_character_creation:NUIfunct')
AddEventHandler('flap_character_creation:NUIfunct', function(type, funct)
	flap_loadDefSkin()
	TriggerServerEvent('flap_character_creation:requestPlace')
end)

RegisterNetEvent('flap_character_creation:teleportToPlace')
AddEventHandler('flap_character_creation:teleportToPlace', function(id, data)
	inPlace = id
	inPlaceData = data

	SetEntityCoords(PlayerPedId(), data.coords.x, data.coords.y, data.coords.z)
	SetEntityHeading(PlayerPedId(), data.heading)
	FreezeEntityPosition(PlayerPedId(), true)
	SetEntityInvincible(PlayerPedId(), true)
	flap_openNUI("char_creator", true)

	currentHeading = data.heading
	local coords    = GetEntityCoords(PlayerPedId())

	if not DoesCamExist(cam) then
		cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", vector3(coords.x, coords.y + 2, coords.z), 0.0, 0.0, 0.0, 80.0, false, false)
	end

	SetCamRot(cam, 0.0, 0.0, 160.0, true)
	SetCamActive(cam, true)
	RenderScriptCams(true)

end)

------------------------------------------------------
------------------------------------------------------
------------------ Flap Development ------------------
------------------------------------------------------
---------------------- FUNCTIONS ---------------------
------------------------------------------------------
------------------ Developed by Flap -----------------
------------------------------------------------------
------------------------------------------------------

function flap_openNUI(type, funct)
	if type == "char_creator" then
		SendNUIMessage({
			flap_open = funct
		})
		SetNuiFocus(funct, funct)
		inCharCreator = funct

		if funct == false then
			flap_closeNUI()
		end
	end
end

function flap_loadDefSkin()
	for k,v in pairs(sConfig) do
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:loadSkin', {
					sex          = v.DefaultSkin.defSkinMale.sex,
					face         = v.DefaultSkin.defSkinMale.face,
					skin         = v.DefaultSkin.defSkinMale.skin,
					beard_1      = v.DefaultSkin.defSkinMale.beard_1,
					beard_2      = v.DefaultSkin.defSkinMale.beard_2,
					beard_3      = v.DefaultSkin.defSkinMale.beard_3,
					beard_4      = v.DefaultSkin.defSkinMale.beard_4,
					hair_1       = v.DefaultSkin.defSkinMale.hair_1,
					hair_2       = v.DefaultSkin.defSkinMale.hair_2,
					hair_color_1 = v.DefaultSkin.defSkinMale.hair_color_1,
					hair_color_2 = v.DefaultSkin.defSkinMale.hair_color_2,
					tshirt_1     = v.DefaultSkin.defSkinMale.tshirt_1,
					tshirt_2     = v.DefaultSkin.defSkinMale.tshirt_2,
					torso_1      = v.DefaultSkin.defSkinMale.torso_1,
					torso_2      = v.DefaultSkin.defSkinMale.torso_2,
					decals_1     = v.DefaultSkin.defSkinMale.decals_1,
					decals_2     = v.DefaultSkin.defSkinMale.decals_2,
					arms         = v.DefaultSkin.defSkinMale.arms,
					pants_1      = v.DefaultSkin.defSkinMale.pants_1,
					pants_2      = v.DefaultSkin.defSkinMale.pants_2,
					shoes_1      = v.DefaultSkin.defSkinMale.shoes_1,
					shoes_2      = v.DefaultSkin.defSkinMale.shoes_2,
					mask_1       = v.DefaultSkin.defSkinMale.mask_1,
					mask_2       = v.DefaultSkin.defSkinMale.mask_2,
					bproof_1     = v.DefaultSkin.defSkinMale.bproof_1,
					bproof_2     = v.DefaultSkin.defSkinMale.bproof_2,
					chain_1      = v.DefaultSkin.defSkinMale.chain_1,
					chain_2      = v.DefaultSkin.defSkinMale.chain_2,
					helmet_1     = v.DefaultSkin.defSkinMale.helmet_1,
					helmet_2     = v.DefaultSkin.defSkinMale.helmet_2,
					glasses_1    = v.DefaultSkin.defSkinMale.glasses_1,
					glasses_2    = v.DefaultSkin.defSkinMale.glasses_2,
				})
			else
				TriggerEvent('skinchanger:loadSkin', {
					sex          = v.DefaultSkin.defSkinFemale.sex,
					face         = v.DefaultSkin.defSkinFemale.face,
					skin         = v.DefaultSkin.defSkinFemale.skin,
					beard_1      = v.DefaultSkin.defSkinFemale.beard_1,
					beard_2      = v.DefaultSkin.defSkinFemale.beard_2,
					beard_3      = v.DefaultSkin.defSkinFemale.beard_3,
					beard_4      = v.DefaultSkin.defSkinFemale.beard_4,
					hair_1       = v.DefaultSkin.defSkinFemale.hair_1,
					hair_2       = v.DefaultSkin.defSkinFemale.hair_2,
					hair_color_1 = v.DefaultSkin.defSkinFemale.hair_color_1,
					hair_color_2 = v.DefaultSkin.defSkinFemale.hair_color_2,
					tshirt_1     = v.DefaultSkin.defSkinFemale.tshirt_1,
					tshirt_2     = v.DefaultSkin.defSkinFemale.tshirt_2,
					torso_1      = v.DefaultSkin.defSkinFemale.torso_1,
					torso_2      = v.DefaultSkin.defSkinFemale.torso_2,
					decals_1     = v.DefaultSkin.defSkinFemale.decals_1,
					decals_2     = v.DefaultSkin.defSkinFemale.decals_2,
					arms         = v.DefaultSkin.defSkinFemale.arms,
					pants_1      = v.DefaultSkin.defSkinFemale.pants_1,
					pants_2      = v.DefaultSkin.defSkinFemale.pants_2,
					shoes_1      = v.DefaultSkin.defSkinFemale.shoes_1,
					shoes_2      = v.DefaultSkin.defSkinFemale.shoes_2,
					mask_1       = v.DefaultSkin.defSkinFemale.mask_1,
					mask_2       = v.DefaultSkin.defSkinFemale.mask_2,
					bproof_1     = v.DefaultSkin.defSkinFemale.bproof_1,
					bproof_2     = v.DefaultSkin.defSkinFemale.bproof_2,
					chain_1      = v.DefaultSkin.defSkinFemale.chain_1,
					chain_2      = v.DefaultSkin.defSkinFemale.chain_2,
					helmet_1     = v.DefaultSkin.defSkinFemale.helmet_1,
					helmet_2     = v.DefaultSkin.defSkinFemale.helmet_2,
					glasses_1    = v.DefaultSkin.defSkinFemale.glasses_1,
					glasses_2    = v.DefaultSkin.defSkinFemale.glasses_2,
				})
			end
		end)
	end
end

function flap_saveSkin()
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerServerEvent('flap_character_creation:saveSkin', skin)
	end)
end

function flap_charRotation(type)
	local heading   = currentHeading

	if type == "left" then
		SetEntityHeading(PlayerPedId(), currentHeading - 10)
		currentHeading = currentHeading - 10
	elseif type == "right" then
		SetEntityHeading(PlayerPedId(), currentHeading + 10)
		currentHeading = currentHeading + 10
	end
end

function flap_closeNUI()
	for k,v in pairs(sConfig) do
		ESX.Game.Teleport(PlayerPedId(), {x = v.DefaultSpawn.coords.coords.x, y = v.DefaultSpawn.coords.coords.y, z = v.DefaultSpawn.coords.coords.z, heading = v.DefaultSpawn.coords.heading}, function()
			SetEntityInvincible(PlayerPedId(), false)
			TriggerServerEvent('flap_character_creation:setPlaceToFree', inPlace)
			FreezeEntityPosition(PlayerPedId(), false)
			flap_saveSkin()
			inPlace = nil
			SetCamActive(cam, false)
			RenderScriptCams(false, true, 500, true, true)
			cam = nil
		end)
	end
end

function flap_changeCam(type)
	if DoesCamExist(cam) then
		local coords    = GetEntityCoords(PlayerPedId())

		SetCamActive(cam, false)
		RenderScriptCams(false, true, 500, true, true)

		cam = nil

		if type == "full" then
			cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", vector3(coords.x, coords.y + 2, coords.z), 0.0, 0.0, 0.0, 80.0, false, false)
			SetCamRot(cam, 0.0, 0.0, 160.0, true)
			SetCamActive(cam, true)
			RenderScriptCams(true)
		elseif type == "face" then
			cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", vector3(coords.x, coords.y + 0.5, coords.z + 0.6), 0.0, 0.0, 0.0, 80.0, false, false)
			SetCamRot(cam, 0.0, 0.0, 160.0, true)
			SetCamActive(cam, true)
			RenderScriptCams(true)
		elseif type == "eyes" then
			cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", vector3(coords.x, coords.y + 0.35, coords.z + 0.7), 0.0, 0.0, 0.0, 80.0, false, false)
			SetCamRot(cam, 0.0, 0.0, 160.0, true)
			SetCamActive(cam, true)
			RenderScriptCams(true)
		elseif type == "hair" then
			cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", vector3(coords.x, coords.y + 0.35, coords.z + 0.8), 0.0, 0.0, 0.0, 80.0, false, false)
			SetCamRot(cam, 0.0, 0.0, 160.0, true)
			SetCamActive(cam, true)
			RenderScriptCams(true)
		elseif type == "beard" then
			cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", vector3(coords.x, coords.y + 0.35, coords.z + 0.6), 0.0, 0.0, 0.0, 80.0, false, false)
			SetCamRot(cam, 0.0, 0.0, 160.0, true)
			SetCamActive(cam, true)
			RenderScriptCams(true)
		elseif type == "chest" then
			cam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", vector3(coords.x, coords.y + 0.55, coords.z + 0.2), 0.0, 0.0, 0.0, 80.0, false, false)
			SetCamRot(cam, 0.0, 0.0, 160.0, true)
			SetCamActive(cam, true)
			RenderScriptCams(true)
		end

	end
end