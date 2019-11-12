	 ; E power x series evaulation
	 
	 
	 area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function
		VLDR.F32   s1, = 2.71828182845904523536028747135266249775724709369995  		; e value 
		VLDR.F32   s2, = 100		  		; power x value
		VLDR.F32   s3, = 1				
		VLDR.F32   s4, = 20				; No of iterations
		VLDR.F32   s5, = 1
		VLDR.F32   s0, = 1				; Just for comparision
		VLDR.F32   s13, = 1
		VLDR.F32   s10, = 1				; s10 will have final exponential result
		VCMP.F32   s2, #0
		vmrs    APSR_nzcv, FPSCR
		BGT Loop1
		B stop
		
Loop1	vpush {s3}
		BL fact
		vpop  {s6}						; factorial value
		VADD.F32   s3, s3, s0
		
		VCMP.F32   s5, s0
		vmrs    APSR_nzcv, FPSCR
		BGT Loop2
		

Loop2   vpush	{s2}
		vpush   {s13}
		VADD.F32  s13, s13, s0
		BL multy
		vpop  {s14}
		VADD.F32   s5, s5, s0
		VDIV.F32   s15, s14, s6
		VADD.F32   s10, s10, s15
		VSUB.F32   s4, s4, s0
		VCMP.F32   s4, #0
		vmrs    APSR_nzcv, FPSCR
		BGT Loop1
		B stop
		
		
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

fact   	vpop {s6}
		VLDR.F32 s7, = 1
		VLDR.F32 s8, =1
L2	   	VCMP.F32 s6, s8
		vmrs    APSR_nzcv, FPSCR
		BGT L1
		vpush {s7}
		BX lr
L1	   	VMUL.F32 s7, s7, s6
		VSUB.F32 s6, s6, s8
		B L2
	   
stop    B stop								   
     endfunc
     end
		 
	