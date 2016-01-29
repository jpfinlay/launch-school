# 1. (32 * 4) >= 129
false # 32 * 4 = 128

# 2. FALSE != !TRUE
false # !TRUE is false, therefore FALSE is false

# 3. true == 4
false # true is not equivalent to the integer 4

# 4. false == (847 == '874')
true # Since 847 is not equivalent to the string '874' false is equivalent to FALSE

# 5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
true # Since one of the expressions - (328 / 4 == 82) - returns TRUE
