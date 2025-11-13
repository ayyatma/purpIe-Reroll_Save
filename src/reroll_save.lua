---@meta _
---@diagnostic disable: lowercase-global

-- This mod wraps various AttemptReroll functions and requests a save after reroll action to persist the new seed.

local function do_save_after_reroll()
    if config == nil or config.Enabled == false then
        return
    end
    if CurrentRun == nil then
        return
    end
    if CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.TestRoom then
        return
    end
    local hubName = (CurrentHubRoom and CurrentHubRoom.Name) or nil
    local devName = "(Reroll)"
    if hubName then
        RequestSave({ DevSaveName = CreateDevSaveName( CurrentRun, { StartNextMap = hubName } ) .. " " .. devName })
    else
        RequestSave({ DevSaveName = CreateDevSaveName( CurrentRun ) .. " " .. devName })
    end
end

-- Wrap AttemptReroll (generic reroll entrypoint)
-- Only wrap the pre-run "Alter Fate" interaction so changing the next-run RNG requests a save
print("purpIe-RerollSave: pre-run hook installed")
modutil.mod.Path.Wrap("SpecialInteractChangeNextRunRNG", function(base, usee, args)
    local result = base(usee, args)
    -- Save the game so the new NextRunSeed persists
    do_save_after_reroll()
    return result
end)
