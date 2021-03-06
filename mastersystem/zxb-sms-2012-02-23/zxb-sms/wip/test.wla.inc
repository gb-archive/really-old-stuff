

.section "ZX Basic code" free
zb__START_PROGRAM:
    	ld hl, 3
	ld (zb_x), hl
	push hl
	ld hl, 2
	pop de
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL1
	ld hl, (zb_x)
	inc hl
	ld (zb_x), hl
zb__LABEL1:
zb__LABEL2:
	ld hl, 0
	ld (zb_x), hl
	jp zb__LABEL4
zb__LABEL8:
	ld hl, (zb_x)
	ld b, 2
zb__LABEL10:
	sra h
	rr l
	djnz zb__LABEL10
	ld a, l
	push af
	ld hl, (zb_x)
	inc hl
	inc hl
	ld a, l
	push af
	ld hl, (zb_x)
	inc hl
	ld a, l
	push af
	xor a
	call zb_SetSprite
	call zb_WaitForVBlankNoInt
	call zb_UpdateSprites
zb__LABEL9:
	ld hl, (zb_x)
	inc hl
	ld (zb_x), hl
zb__LABEL4:
	ld hl, (zb_x)
	push hl
	ld hl, 128
	pop de
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL8
zb__LABEL7:
	jp zb__LABEL2
zb__LABEL3:
zb_UpdateSprites:
;#line 1
		jp UpdateSprites
;#line 2
zb_UpdateSprites__leave:
	ret
zb_WaitForVBlankNoInt:
;#line 8
		jp WaitForVBlankNoInt
;#line 9
zb_WaitForVBlankNoInt__leave:
	ret
zb_SetSprite:
;#line 15
		exx
		pop hl
		exx
		ld d, 0
		ld e, a
		pop bc
		ld hl, hw_sprites_y
		add hl, de
		pop af
		ld (hl), a
		ld hl, hw_sprites_xc
		add hl, de
		add hl, de
		ld (hl), b
		inc hl
		pop af
		ld (hl), a
		exx
		push hl
		exx
;#line 35
zb_SetSprite__leave:
	ret

    ret
.ends

.section "ZXB variable init values" free
ZXBASIC_USER_DATA_VALUES:
    ; zb_x
	.db 00, 00
; zb_a
	.dw 0000h
	.db 01h
	.db 00h
	.db 00h
	.db 00h
	.db 00h
	.db 00h
	.db 00h
	.db 00h
	.db 00h
	.db 00h
	.db 00h    
ZXBASIC_USER_DATA_VALUES_END:
.ends


.ramsection "ZXBasic Variables" slot 3
ZXBASIC_USER_DATA ds 0
    	zb_x ds 2
	zb_a ds 13
ZXBASIC_USER_DATA_END ds 0    
.ends

