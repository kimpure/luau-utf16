--!strict

local _16 = { 'A', 'B', 'C', 'D', 'E', 'F' };
function from16(num: number): string
    if num == 0 then return '0' end
    local tab = {};
    local result = '';
    while true do
        if num < 1 then
            break
        end
        tab[#tab+1] = num % 16;
        num -= num % 16
        num /= 16;
    end
    for i=1, #tab do
        local value = tab[i];
        result = `{if value > 9 then _16[value - 9] else value}{result}`
    end
    return result
end

function from2(num: number): string
    if num == 0 then return '0' end
    local result = '';
    while true do
        if num < 1.1 then
            break
        end
        result = `{num % 2}{result}`;
        num = math.floor(num / 2);
    end
    return result
end

type UTF16Impl = {
    __index: UTF16Impl,
    encode: (value: string | number) -> (string),
}

export type UTF16 = typeof(setmetatable({} :: {

}, {} :: UTF16Impl))

local utf16 = {}
utf16.__index = utf16

function utf16.encode(str: string)
    local str16 = from16(utf8.codepoint(str));
    local result = '';

    if tonumber(str16, 16) <= 0xFFFF then 
        result = str16;
        for i=1, 4 - #str16 do
            result = `0{result}`;
        end
    else
        local str2 = from2(utf8.codepoint(str));
        for i=1, 20 - #str2 do
            str2 = `0{str2}`;
        end
        result = from16(tonumber(`110110{str2:sub(1, 10)}110111{str2:sub(11)}`, 2) :: number);
    end

    return result;
end

print(utf16.encode('𤭢'));
print(utf16.encode('𐐷'));

return utf16