	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleNormalState
	.type	handleNormalState, %function
handleNormalState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L4
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L5
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L3
.L5:
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
.L3:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleNormalState, .-handleNormalState
	.align	2
	.global	handleEnteringCommentState
	.type	handleEnteringCommentState, %function
handleEnteringCommentState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	w0, [sp, 44]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	w0, [sp, 44]
	cmp	w0, 47
	bne	.L8
	mov	w0, 47
	bl	putchar
	mov	w0, 2
	str	w0, [sp, 60]
	b	.L9
.L8:
	ldr	w0, [sp, 44]
	cmp	w0, 42
	bne	.L10
	mov	w0, 32
	bl	putchar
	ldr	x0, [sp, 24]
	ldr	w1, [x0]
	ldr	x0, [sp, 32]
	str	w1, [x0]
	mov	w0, 1
	str	w0, [sp, 60]
	b	.L9
.L10:
	ldr	w0, [sp, 44]
	cmp	w0, 39
	bne	.L11
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 44]
	bl	putchar
	mov	w0, 7
	str	w0, [sp, 60]
	b	.L9
.L11:
	ldr	w0, [sp, 44]
	cmp	w0, 34
	bne	.L12
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 44]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 60]
	b	.L9
.L12:
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 44]
	bl	putchar
	str	wzr, [sp, 60]
.L9:
	ldr	w0, [sp, 60]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleEnteringCommentState, .-handleEnteringCommentState
	.align	2
	.global	handleInCommentState
	.type	handleInCommentState, %function
handleInCommentState:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L15
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L16
.L15:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L17
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L16
.L17:
	mov	w0, 1
	str	w0, [sp, 44]
.L16:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleInCommentState, .-handleInCommentState
	.align	2
	.global	handleExitingCommentState
	.type	handleExitingCommentState, %function
handleExitingCommentState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L20
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L21
.L20:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L22
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L21
.L22:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L23
	str	wzr, [sp, 44]
	b	.L21
.L23:
	mov	w0, 1
	str	w0, [sp, 44]
.L21:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleExitingCommentState, .-handleExitingCommentState
	.align	2
	.global	handleInCharLiteral
	.type	handleInCharLiteral, %function
handleInCharLiteral:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L26
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
	b	.L27
.L26:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L28
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	str	w0, [sp, 44]
	b	.L27
.L28:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 7
	str	w0, [sp, 44]
.L27:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleInCharLiteral, .-handleInCharLiteral
	.align	2
	.global	handleInStringLiteral
	.type	handleInStringLiteral, %function
handleInStringLiteral:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L31
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 44]
	b	.L32
.L31:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L33
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
	b	.L32
.L33:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
.L32:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleInStringLiteral, .-handleInStringLiteral
	.align	2
	.global	handleEscapedCharString
	.type	handleEscapedCharString, %function
handleEscapedCharString:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleEscapedCharString, .-handleEscapedCharString
	.align	2
	.global	handleEscapedCharCharecter
	.type	handleEscapedCharCharecter, %function
handleEscapedCharCharecter:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 7
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleEscapedCharCharecter, .-handleEscapedCharCharecter
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	wzr, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 20]
	mov	w0, 1
	str	w0, [sp, 16]
	b	.L40
.L50:
	ldr	w0, [sp, 24]
	cmp	w0, 10
	bne	.L41
	ldr	w0, [sp, 20]
	add	w0, w0, 1
	str	w0, [sp, 20]
.L41:
	ldr	w0, [sp, 28]
	cmp	w0, 7
	beq	.L42
	ldr	w0, [sp, 28]
	cmp	w0, 7
	bhi	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 6
	beq	.L43
	ldr	w0, [sp, 28]
	cmp	w0, 6
	bhi	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 5
	beq	.L44
	ldr	w0, [sp, 28]
	cmp	w0, 5
	bhi	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 4
	beq	.L45
	ldr	w0, [sp, 28]
	cmp	w0, 4
	bhi	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 3
	beq	.L46
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bhi	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L47
	ldr	w0, [sp, 28]
	cmp	w0, 2
	bhi	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 0
	beq	.L48
	ldr	w0, [sp, 28]
	cmp	w0, 1
	beq	.L49
	b	.L40
.L48:
	ldr	w0, [sp, 24]
	bl	handleNormalState
	str	w0, [sp, 28]
	b	.L40
.L47:
	add	x1, sp, 20
	add	x0, sp, 16
	mov	x2, x1
	mov	x1, x0
	ldr	w0, [sp, 24]
	bl	handleEnteringCommentState
	str	w0, [sp, 28]
	b	.L40
.L49:
	ldr	w0, [sp, 24]
	bl	handleInCommentState
	str	w0, [sp, 28]
	b	.L40
.L46:
	ldr	w0, [sp, 24]
	bl	handleExitingCommentState
	str	w0, [sp, 28]
	b	.L40
.L45:
	ldr	w0, [sp, 24]
	bl	handleInStringLiteral
	str	w0, [sp, 28]
	b	.L40
.L44:
	ldr	w0, [sp, 24]
	bl	handleEscapedCharString
	str	w0, [sp, 28]
	b	.L40
.L42:
	ldr	w0, [sp, 24]
	bl	handleInCharLiteral
	str	w0, [sp, 28]
	b	.L40
.L43:
	ldr	w0, [sp, 24]
	bl	handleEscapedCharCharecter
	str	w0, [sp, 28]
	nop
.L40:
	bl	getchar
	str	w0, [sp, 24]
	ldr	w0, [sp, 24]
	cmn	w0, #1
	bne	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 2
	bne	.L51
	mov	w0, 47
	bl	putchar
.L51:
	ldr	w0, [sp, 28]
	cmp	w0, 1
	beq	.L52
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bne	.L53
.L52:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w0, [sp, 16]
	mov	w2, w0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	b	.L55
.L53:
	mov	w0, 0
.L55:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
