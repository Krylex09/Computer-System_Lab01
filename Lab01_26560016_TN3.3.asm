# Step 3.3 – Three-month summary with your own data
# Register Plan:
# $s0 : reading0
# $s1 : reading1
# $s2 : reading2
# $s3 : reading3
# $t0 : Month 1 usage ($s1 - $s0)
# $t1 : Month 2 usage ($s2 - $s1)
# $t2 : Month 3 usage ($s3 - $s2)
# $t3 : Total usage    ($s3 - $s0)

.data
prompt: .asciiz "Enter reading (kWh): "
m1:     .asciiz "Month 1: "
m2:     .asciiz "Month 2: "
m3:     .asciiz "Month 3: "
tot:    .asciiz "Total:   "
nl:     .asciiz "\n"

.text
.globl main
main:
    # --- Read 4 readings (reading0 to reading3) ---
    # Reading 0 ($s0)
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    # Reading 1 ($s1)
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    # Reading 2 ($s2)
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero

    # Reading 3 ($s3)
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero

    # --- Calculations ---
    sub  $t0, $s1, $s0    # Month 1 usage
    sub  $t1, $s2, $s1    # Month 2 usage
    sub  $t2, $s3, $s2    # Month 3 usage
    sub  $t3, $s3, $s0    # Total usage ($t0 + $t1 + $t2)

    # --- Print Output ---
    # Month 1
    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Month 2
    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Month 3
    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Total
    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Exit
    li   $v0, 10
    syscall
