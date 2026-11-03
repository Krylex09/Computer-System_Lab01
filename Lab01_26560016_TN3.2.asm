# Listing 6 - energy used between two readings
# Register Plan: 
# $s0 : Previous reading 
# $s1 : Current reading 
# $t0 : Usage (current - previous)

.data
prompt1: .asciiz "Enter previous reading (kWh): "
prompt2: .asciiz "Enter current reading (kWh): "
label:   .asciiz "Usage (kWh): "
newline: .asciiz "\n"
 
.text
.globl main
main:
    # --- read the previous reading into $s0 ---
    li   $v0, 4
    la   $a0, prompt1
    syscall
    li   $v0, 5              # service 5: read integer, result in $v0
    syscall
    add  $s0, $v0, $zero     # keep the value in $s0
 
    li   $v0, 4
    la   $a0, prompt2
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero
 
    sub $t0, $s1, $s0
 
    li   $v0, 4
    la   $a0, label
    syscall

    li   $v0, 1
    add  $a0, $t0, $zero
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall
 
    li   $v0, 10
    syscall
