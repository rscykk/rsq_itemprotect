exports.ox_inventory:registerHook('swapItems', function(payload)
    local itemName = payload.fromSlot.name

    local protectedItems = {
        ['car_ticket'] = true, -- You can add more items
    }

    if not protectedItems[itemName] then
        return
    end

    local fromType = payload.fromType
    local toType = payload.toType
    local action = payload.action

    if toType == 'drop' then
        return false
    end
    if fromType == 'player' and toType == 'player' then

        if action ~= 'give' then
            return false
        end
    end

    if toType ~= 'player' then
        return false
    end

end, {
    print = false
})