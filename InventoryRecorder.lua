IRData = nil

function IR_Register()
	SLASH_COMMANDS["/record"] = function(arg)
		IRData.inventory = {}
		t = {}
		--ZO_DeepTableCopy(PLAYER_INVENTORY.inventories[BAG_BACKPACK].slots, IRData["Inventory"])
		--IRData["Inventory"] = PLAYER_INVENTORY.inventories[BAG_BACKPACK].slots
		for _,v in pairs(ZO_PlayerInventoryBackpack.data) do
			t.age = v.age
			t.equipType = v.data.equipType
			t.filterData = v.data.filterData
			t.iconFile = v.data.iconFile
			t.itemInstanceId = v.data.itemInstanceId
			t.itemType = v.data.itemType
			t.name = v.data.name
			t.nameWithQuantity = v.data.nameWithQuantity
			t.quality = v.data.quality
			t.rawName = v.data.rawName
			t.requiredLevel = v.data.requiredLevel
			t.requiredVeteranRank = v.data.requiredVeteranRank
			t.sellPrice = v.data.sellPrice
			t.SousChef_provisioningRank = v.data.SousChef_provisioningRank
			t.stackCount = v.data.stackCount
			t.stackSellPrice = v.data.stackSellPrice
			t.statValue = v.data.statValue

			table.insert(IRData.inventory, t)
			t = {}
		end
		d("Inventory recorded to file.")
	end
	d("Inventory Recorder loaded.")
end

local function IR_OnLoaded(eventCode, addonName)
	if addonName ~= "InventoryRecorder" then return end

	IRData = ZO_SavedVars:New("InventoryRecorderData", 0.1, nil, nil)
	EVENT_MANAGER:RegisterForEvent("IR_Register", EVENT_PLAYER_ACTIVATED, IR_Register)
end

EVENT_MANAGER:RegisterForEvent("InventoryRecorder", EVENT_ADD_ON_LOADED, IR_OnLoaded)