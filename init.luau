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
        result = `{ if value > 9 then _16[value - 9] else value }{result}`
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

export type UTF16Impl = {
    __index: UTF16Impl,
    codepoint: (str: string) -> (number),
    encode: (str: string) -> (string),
    decode: (str: string) -> (string),
    char: (str: string) -> (string),
}

local utf16 = {} :: UTF16Impl
utf16.__index = utf16

function utf16.char(str)
	-- 내일 기능 추가 예정
	return '';
end

function utf16.codepoint(str)
    return utf8.codepoint(str);
end

function utf16.decode(str) 
	return utf8.char(tonumber(str, 16) :: number);
end

function utf16.encode(str)
    local codePoint = utf8.codepoint(str);
    local str16 = from16(codePoint);
    local result = '';

    if tonumber(str16, 16) <= 0xFFFF then 
        result = str16;
        for i=1, 4 - #str16 do
            result = `0{result}`;
        end
    else
        local str2 = from2(codePoint);
        for i=1, 20 - #str2 do
            str2 = `0{str2}`;
        end
        result = from16(tonumber(`110110{str2:sub(1, 10)}110111{str2:sub(11)}`, 2) :: number);
    end

    return result;
end

return utf16



