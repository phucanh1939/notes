    .section	__TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0	sdk_version 13, 3

###################################################
# Constructor Vector::Vector(float x, float y) : x(x), y(y) {}
###################################################
    .globl	__ZN6VectorC2Eff                ; -- Begin function _ZN6VectorC2Eff
    .p2align	2
__ZN6VectorC2Eff:                       ; @_ZN6VectorC2Eff
    # Setup stack frame
    sub	sp, sp, #16         # sp = sp - 16

    # Put data on stack
    # x0 contains address of the object being constructed (the this pointer)
    # s0, s1 contains constructor params (x, y)
    str	x0, [sp, #8]        # [sp + 8] = x0 = this
    str	s0, [sp, #4]        # [sp + 4] = s0 = x
    str	s1, [sp]            # [sp] = s1 = y

    # Load data from stack to calculate
    ldr	x0, [sp, #8]        # x0 = [sp + 8] = this
    ldr	s0, [sp, #4]        # s0 = [sp + 4] = x

    # Set value to class instance
    str	s0, [x0]            # [this + 0] = s0 = x (this->x = x)
    ldr	s0, [sp]            # s0 = [sp] = y
    str	s0, [x0, #4]        # [this + 4] = s0 = y (this->y = y)

    # Done
    add	sp, sp, #16
    ret

###################################################
# 
###################################################
    .globl	__ZN6VectorC1Eff                ; -- Begin function _ZN6VectorC1Eff
    .p2align	2
__ZN6VectorC1Eff:                       ; @_ZN6VectorC1Eff
    # Setup stack frame
    sub	sp, sp, #48
    stp	x29, x30, [sp, #32]
    add	x29, sp, #32

    # 
    stur	x0, [x29, #-8]          # [fp - 8] = x0
    stur	s0, [x29, #-12]         # [fp - 12] = s0
    str	s1, [sp, #16]               
    ldur	x0, [x29, #-8]
    str	x0, [sp, #8]                    ; 8-byte Folded Spill
    ldur	s0, [x29, #-12]
    ldr	s1, [sp, #16]
    bl	__ZN6VectorC2Eff
    ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
    ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
    add	sp, sp, #48
    ret

###################################################
# 
###################################################
    .globl	__ZNK6Vector4getXEv             ; -- Begin function _ZNK6Vector4getXEv
    .p2align	2
__ZNK6Vector4getXEv:                    ; @_ZNK6Vector4getXEv
    sub	sp, sp, #16
    str	x0, [sp, #8]
    ldr	x8, [sp, #8]
    ldr	s0, [x8]
    add	sp, sp, #16
    ret

###################################################
# 
###################################################
    .globl	__ZNK6Vector4getYEv             ; -- Begin function _ZNK6Vector4getYEv
    .p2align	2
__ZNK6Vector4getYEv:                    ; @_ZNK6Vector4getYEv
    sub	sp, sp, #16
    str	x0, [sp, #8]
    ldr	x8, [sp, #8]
    ldr	s0, [x8, #4]
    add	sp, sp, #16
    ret

###################################################
# 
###################################################
    .globl	__ZN6Vector4setXEf              ; -- Begin function _ZN6Vector4setXEf
    .p2align	2
__ZN6Vector4setXEf:                     ; @_ZN6Vector4setXEf
    sub	sp, sp, #16
    str	x0, [sp, #8]
    str	s0, [sp, #4]
    ldr	x8, [sp, #8]
    ldr	s0, [sp, #4]
    str	s0, [x8]
    add	sp, sp, #16
    ret

###################################################
# 
###################################################
    .globl	__ZN6Vector4setYEf              ; -- Begin function _ZN6Vector4setYEf
    .p2align	2
__ZN6Vector4setYEf:                     ; @_ZN6Vector4setYEf
    sub	sp, sp, #16
    str	x0, [sp, #8]
    str	s0, [sp, #4]
    ldr	x8, [sp, #8]
    ldr	s0, [sp, #4]
    str	s0, [x8, #4]
    add	sp, sp, #16
    ret

###################################################
# 
###################################################
    .globl	__ZN6Vector3addERKS_            ; -- Begin function _ZN6Vector3addERKS_
    .p2align	2
__ZN6Vector3addERKS_:                   ; @_ZN6Vector3addERKS_
    sub	sp, sp, #16
    str	x0, [sp, #8]
    str	x1, [sp]
    ldr	x8, [sp, #8]
    ldr	x9, [sp]
    ldr	s1, [x9]
    ldr	s0, [x8]
    fadd	s0, s0, s1
    str	s0, [x8]
    ldr	x9, [sp]
    ldr	s1, [x9, #4]
    ldr	s0, [x8, #4]
    fadd	s0, s0, s1
    str	s0, [x8, #4]
    add	sp, sp, #16
    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
