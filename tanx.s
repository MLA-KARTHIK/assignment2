	 ; Tan x calculation
	 
	 
	 area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function
		VLDR.F32   s0, =0				; X value
		VLDR.F32   s1, =10				; No of iterations
		
		vpush	   {s0}
		vpush	   {s1}
		BL sinx							; calculate sine x value
		vpop	   {s2}					; sine result
		B stop
		
		
		
sinx	vpop	   {s2}					; Pop No of iteration
		vpop	   {s3}					; Pop x value
		VLDR.F32   s4, =0				; Final sine results stored in s4
		VLDR.F32   s5, =1				; To calculate power and factorial
		VLDR.F32   s9, =2
		VLDR.F32   s10, =1				; Just to compare
Loop1	vpush	   {s3}
		vpush      {s5}
		BL multy
		vpop       {s6}
		vpush      {s5}
		BL fact
		vpop       {s7}
		VDIV.F32   s8, s6, s7
		VADD.F32   s4, s4, s8
		VADD.F32   s5, s5, s9
		VSUB.F32   s2, s2, s10
		VCMP.F32   s2, #0
		vmrs    APSR_nzcv, FPSCR
		BGT Loop1
		vpush      {s5}
		BX lr
		
		
; Multiply subroutine

multy	vpop {s11} 						; No of times to multiply
		vpop {s12}						; Number to multiply
		VMOV.F32  s15, s12
L4		VCMP.F32  s11, s0
		vmrs    APSR_nzcv, FPSCR
		BGT L3
		vpush  {s15}
		BX lr
L3		VMUL.F32  s15, s15, s12
		VSUB.F32  s11, s11, s0
		B L4


; Factorial subroutine

fact   	vpop {s16}
		VLDR.F32 s17, = 1
		VLDR.F32 s18, =1
L2	   	VCMP.F32 s16, s18
		vmrs    APSR_nzcv, FPSCR
		BGT L1
		vpush {s17}
		BX lr
L1	   	VMUL.F32 s17, s17, s16
		VSUB.F32 s16, s16, s18
		B L2
	   
stop    B stop								   
     endfunc
     end
		 
	