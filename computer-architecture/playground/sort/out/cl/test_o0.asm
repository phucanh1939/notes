; Listing generated by Microsoft (R) Optimizing Compiler Version 19.41.34123.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	make_some_game
PUBLIC	main
pdata	SEGMENT
$pdata$main DD	imagerel $LN3
	DD	imagerel $LN3+171
	DD	imagerel $unwind$main
pdata	ENDS
xdata	SEGMENT
$unwind$main DD	020701H
	DD	0110107H
xdata	ENDS
; Function compile flags: /Odtp
; File D:\personal-space\notes\computer-architecture\playground\sort\src\test.c
_TEXT	SEGMENT
x0$ = 80
x9$ = 84
x8$ = 88
x7$ = 92
x6$ = 96
x5$ = 100
x4$ = 104
x3$ = 108
x2$ = 112
x1$ = 116
main	PROC

; 20   : {

$LN3:
	sub	rsp, 136				; 00000088H

; 21   :     int x1 = 1;

	mov	DWORD PTR x1$[rsp], 1

; 22   :     int x2 = 2;

	mov	DWORD PTR x2$[rsp], 2

; 23   :     int x3 = 3;

	mov	DWORD PTR x3$[rsp], 3

; 24   :     int x4 = 4;

	mov	DWORD PTR x4$[rsp], 4

; 25   :     int x5 = 5;

	mov	DWORD PTR x5$[rsp], 5

; 26   :     int x6 = 6;

	mov	DWORD PTR x6$[rsp], 6

; 27   :     int x7 = 7;

	mov	DWORD PTR x7$[rsp], 7

; 28   :     int x8 = 8;

	mov	DWORD PTR x8$[rsp], 8

; 29   :     int x9 = 9;

	mov	DWORD PTR x9$[rsp], 9

; 30   :     int x0 = 10;

	mov	DWORD PTR x0$[rsp], 10

; 31   :     make_some_game(x1, x2, x3, x4, x5, x6, x7, x8, x9, x0);

	mov	eax, DWORD PTR x0$[rsp]
	mov	DWORD PTR [rsp+72], eax
	mov	eax, DWORD PTR x9$[rsp]
	mov	DWORD PTR [rsp+64], eax
	mov	eax, DWORD PTR x8$[rsp]
	mov	DWORD PTR [rsp+56], eax
	mov	eax, DWORD PTR x7$[rsp]
	mov	DWORD PTR [rsp+48], eax
	mov	eax, DWORD PTR x6$[rsp]
	mov	DWORD PTR [rsp+40], eax
	mov	eax, DWORD PTR x5$[rsp]
	mov	DWORD PTR [rsp+32], eax
	mov	r9d, DWORD PTR x4$[rsp]
	mov	r8d, DWORD PTR x3$[rsp]
	mov	edx, DWORD PTR x2$[rsp]
	mov	ecx, DWORD PTR x1$[rsp]
	call	make_some_game

; 32   :     return 1;

	mov	eax, 1

; 33   : }

	add	rsp, 136				; 00000088H
	ret	0
main	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File D:\personal-space\notes\computer-architecture\playground\sort\src\test.c
_TEXT	SEGMENT
a1$ = 8
a2$ = 16
a3$ = 24
a4$ = 32
a5$ = 40
a6$ = 48
a7$ = 56
a8$ = 64
a9$ = 72
a0$ = 80
make_some_game PROC

; 2    : {

	mov	DWORD PTR [rsp+32], r9d
	mov	DWORD PTR [rsp+24], r8d
	mov	DWORD PTR [rsp+16], edx
	mov	DWORD PTR [rsp+8], ecx

; 3    :     a3 = a1 + a2;

	mov	eax, DWORD PTR a2$[rsp]
	mov	ecx, DWORD PTR a1$[rsp]
	add	ecx, eax
	mov	eax, ecx
	mov	DWORD PTR a3$[rsp], eax

; 4    :     // int b1 = a1 + a2; // 24
; 5    :     // int b2 = a3 + a4; // 24
; 6    :     // int b3 = a5 + a6; // 24
; 7    :     // int b4 = a7 + a8; // 24
; 8    :     // int b5 = a9 + a0; // 40 = 24 + 16
; 9    :     // int b6 = 0; // 40
; 10   :     // int b7 = 0; // 40
; 11   :     // int b8 = 0; // 40
; 12   :     // int b9 = 0; // 56 = 40 + 16
; 13   :     // int b10 = 0; // 56
; 14   :     // int b11 = 0; // 56
; 15   :     // int b12 = 0; // 56
; 16   :     // int b13 = 0; // 56 + 16 = 72
; 17   : }

	ret	0
make_some_game ENDP
_TEXT	ENDS
END
