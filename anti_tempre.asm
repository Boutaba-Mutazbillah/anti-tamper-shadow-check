mov ecx, 1000
mov edx, ecx

_loop_start:
    jecxz _verify_end
    
    cmp edx, 400
    jbe _skip_check
    
    mov eax, edx
    sub eax, ecx
    jnz _tamper_detected

_skip_check:
    nop                
    
    dec ecx
    dec edx
    jmp _loop_start

_verify_end:
    cmp edx, 0
    jnz _tamper_detected
    jmp _success_exit

_tamper_detected:
    xor eax, eax
    mov ebx, [eax]

_success_exit:
    ret
