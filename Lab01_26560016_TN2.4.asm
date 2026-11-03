# Listing 4 - translating statements
# Register Plan:
# y   : $s0 = 8
# z   : $s1 = 5
# w   : $s2 = 3
# x1  : $t0 = y + z + w
# x2  : $t1 = (y + z) - (w + 5)
# x3  : $t2 = y (copy)
# x4  : $t3 = z - y
# Temp: $t5 (dùng cho tính toán trung gian)

.text
.globl main
main:
    addi $s0, $zero, 8        # y = 8
    addi $s1, $zero, 5        # z = 5
    addi $s2, $zero, 3        # w = 3

    # x1 = y + z + w
    add  $t5, $s0, $s1        # $t5 = y + z
    add  $t0, $t5, $s2        # $t0 = $t5 + w

    # x2 = (y + z) - (w + 5)
    add  $t5, $s0, $s1        # $t5 = y + z
    addi $t1, $s2, 5          # $t1 = w + 5
    sub  $t1, $t5, $t1        # $t1 = $t5 - $t1

    # x3 = y (copy)
    add  $t2, $s0, $zero      # copy $s0 sang $t2

    # x4 = z - y
    sub  $t3, $s1, $s0        # 5 - 8 = -3

    li   $v0, 10
    syscall
