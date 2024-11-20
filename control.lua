-- supports stack sizes > 1 in theory but not tested
local function insert_to_best_inventory(stack, entity)
  success = false
  
  -- Best case, most entities have an output inventory for some reason. Just try and put it back into the output.
  -- Note to self: Always make sure relevant recipes include a 0% probability of all possible results.
  -- Otherwise assembler output inventory has a filter that prevents re-insertion.
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

  -- If this is an inserter, try and put the new stack back somewhere logical
  if not success and source.type == "inserter" then        
    -- Seems to always work, since spoiled stacks spoil together, meaning the hand should be empty at this point.
    -- But, not tested with items that stack greater than one.
    -- I'm also not sure if it only transfers if it can transfer the full stack. The result just says if the full 
    -- stack was transferred, but I *think* it should always work out in practice, since the hand should be empty.
    success = source.held_stack.transfer_stack(stack)    

    if success then
      game.print("Inserted " .. stack.name .. " into inserter hand")
    else 
      -- These code paths not well tested.
      if source.drop_target then
        success = insert_to_best_inventory(stack, source.drop_target)
        if success then
          game.print("Inserted " .. stack.name .. " into drop target")
        end
      end

      if not success then
        game.print("Inserter drop target missing or filled, spilling " .. stack.name .. " to ground.")
        game.surfaces[event.surface_index].spill_item_stack({
          position = source.drop_position,
          stack = stack
        })
      end
    end
  end

  -- Fallback, not tested well.
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

  -- Second fallback, also not tested well.
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

  -- Failure.
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

    -- If it wasn't in an entity, or we couldn't insert back to the entity, drop it to the ground.
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