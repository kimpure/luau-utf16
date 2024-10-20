# luau utf16

luau-utf16 is a library for using utf16 in luau.

## Install

pesde
```
pesde add kimpure/utf16
```

submodule
```
git submodule add https://github.com/kimpure/luau-utf16 lune-utf16
```


## how to use

require:
```luau
local utf16 = require('path');
```

encode:
```luau
local encodeA = utf16.encode('A');
print(encodeA); -- << "0041"
```

decode:
```luau
local decodeA = utf16.decode(encodeA);
print(decodeA); -- << "A"
```

codepoint:
```luau
print(utf16.codepoint('A')); -- << 65
```


