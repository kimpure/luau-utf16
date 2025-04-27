local utf16 = require('../src')

local encodeString = utf16.encode('A');
local decodeString = utf16.decode(encodeString);

print(utf16.codepoint('A'))
print(encodeString);
print(decodeString);
