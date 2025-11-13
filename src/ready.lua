---@meta _
---@diagnostic disable



local function drawMenu()
    local value, checked = rom.ImGui.Checkbox(purpIe_RerollSave.name, config.Enabled)

	if checked then
		config.Enabled = value
	end

    if config.Enabled then
        purpIe_RerollSave.DrawUI()
    end
end

-- rom.gui.add_imgui(function()
-- 	if rom.ImGui.Begin("RerollSave") then
-- 		drawMenu()
-- 		rom.ImGui.End()
-- 	end
-- end)

rom.gui.add_to_menu_bar(function()
	if rom.ImGui.BeginMenu("Configure") then
		drawMenu()
		rom.ImGui.EndMenu()
	end
end)
