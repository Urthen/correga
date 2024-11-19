-- supports stack sizes > 1 in theory but not tested
local function insert_to_best_inventory(stack, entity)
  success = false
  
  -- Best case, if this is an assembler, just try and put it back into the output.
  -- Note to self: Always make sure relevant recipes include a 0% probability of all possible results
  if source.get_output_inventory() then
    inventory = source.get_output_inventory()
    inserted = inventory.insert(result)

    if inserted > 0 then
      game.print("Inserted " .. stack.name .. " into output")
    end

    if inserted == stack.count then
      success = true
    else
      stack.count = stack.count - inserted
    end
  end

  if not success then
    -- loop through inventories in reverse order, this should in theory insert to the "correct" inventories first
    -- but so far this branch never seems to do anything (either above output inventory works or nothing)
    for i = 0, entity.get_max_inventory_index() - 1 do 
      inventory = source.get_inventory(source.get_max_inventory_index() - i)
      if inventory then            
        inserted = inventory.insert(result)

        if inserted > 0 then
          game.print("Inserted " .. stack.name .. " into slot " .. source.get_max_inventory_index() - i)
        end
        
        -- future proofing; account for stack sizes higher than one
        if inserted == stack.count then          
          success = true
          break
        else
          stack.count = stack.count - inserted
        end
      end
    end
  end

  if not success then
    -- last ditch effort, also never seems to insert anything
    inserted = source.insert(stack)
    
    if inserted > 0 then
      game.print("Inserted " .. stack.name .. " ...somewhere")
    end

    if inserted == stack.count then
      success = true
    end
  end

  if not success then
    game.print("Correga - Bug warning: Could not output all " .. stack.name .. " to any inventory in " .. source.name)        
  end

  return success
end

local function handle_script_trigger_event(event)
  if event.effect_id == "correga-result-power-core" then    
    result = {name="correga-power-core", count=1}

    if math.random() < 0.1 then
      result = {name="correga-unstable-power-core", count=1}
    end

    success = false

    if event.source_entity then 
      source = event.source_entity
      game.print("Power Core Result spoiled in an entity!")
      success = insert_to_best_inventory(result, source)      
    end

    if not success then
      game.print("Power Core Result spoiled onto the ground!")
      game.surfaces[event.surface_index].spill_item_stack({
        position = event.source_position,
        stack = result
      })
    end

  end
end
  
script.on_event(defines.events.on_script_trigger_effect, handle_script_trigger_event)