유니코드랑 utf-8 차이

유니코드 << a b c d e ......... =>
utf-8 
char << short = 2byte
0000_0000

0110_0001 = a << utf-8

한글 한글자 << 1 << 한글 (일반적으로 3바이트) << 1110_xxxx 10xx_xxx 10xx_xxxx
                                                   xxxx   xx xxx   xx xxxx

utf8.codepoint('한') << 54620 <<< 2진수로 바꿈
(1110_1101 1001_0101 1001_1000)
(1110_xxxx 10xx_xxx 10xx_xxxx)
(     xxxx   xx xxx   xx xxxx)
(     1101   01_010   01_1000)

local buf = buffer.create()
local content = "한asdqwkeqw"
buffer.readu32(buf, #content)
buffer.writestring(buf, content)
buf = buffer.writei32

print(buffer.len(buf)) << 4 (한글 3바이트 , a 1바이트)

(0이나1) << 비트(bit)
비트 8개 모아놓은거 << 1byte

i32 << int32
32 << 4byte (32bit)
(+-) (.......)

i64 << int64
64 << 8byte (64bit)

버퍼 -> 바이트를 하나하나 나열해놓은거 [ () , () , () , () ....]
버퍼 장점

{
    일반 테이블 << 하나하나 키마다 좀 무거움
}

bit32.band()
bit32.bor()
bit32.lshift() >> 0b1
bit32.rshift() 그냥 C++ 에서 보이는 << 이랑 >> 임 
rshift 는 다름 + , - 에 따라 다름

0b0000 0000 0000 (+)
0b0000 0000 0000 0000 (1111 1111 1111)
// 0b1111 1111 1111
bit32.bnot(1) << 1번 비트는 빼고
bit32.band(num,2^0) ~= 0 << 
fkags = {
    a = true,
    b = false,
    c = false,
    d = true,
}

0b1
0b0
0b1

시작하는바이트+n*...
즉 n번쨰 위치를 암 (접근하는 속도가 동일하다)

ex. 
{
    health = 100,
    coin = 100,
    name = 'sunwoo',
}

float32 = float (자바 , C) = 4byte
float64 = double (자바 , C) = 8byte



u8 i8 short = 2byte

u32 i32 = int = 4byte

u64 i64 = int64 = 8byte

코루틴 << 중간에 쉴수있는대 바깥에서 다시 호출해주면 다시 멈춘 자리에서 시작하는 함수
코루틴 << state << 돌아가냐 멈췄냐

local newCoroutine >> coroutine.create(function(b)
    coroutine.yield(1+b) 
    coroutine.yield(2+b)
    coroutine.yield(3+b)
end)

print(coroutine.resume(t,1)) << 2