
;==============================================================
; WLA-DX banking setup
;==============================================================
.memorymap
	defaultslot     0
	; rom area
	slotsize        $4000
	slot            0       $0000
	slot            1       $4000
	slot            2       $8000
	; ram area
	slotsize        $2000
	slot            3       $C000
	slot            4       $E000
.endme

.rombankmap
	bankstotal 2
	banksize $4000
	banks 2
.endro

;==============================================================
; SDSC tag and SMS rom header
;==============================================================
.sdsctag 0.0,"ZX Basic program","Generated by zxb2wla 0.03 alpha","Haroldo"
.smstag


.include "..\lib\wla\boot.inc"


;==============================================================
; Includes
;==============================================================
.include "..\lib\wla\Useful functions.inc"
.include "..\lib\wla\BBC Micro font.inc"
.include "..\lib\wla\sprite.inc"



.section "ZX Basic code" free
zb__START_PROGRAM:
    	ld hl, 256
	ld (zb_ballSpdX), hl
	ld hl, 256
	ld (zb_ballSpdY), hl
zb__LABEL0:
	call zb_ReadJoypad1
	ld (zb_joy), a
	ld hl, 4
	push hl
	ld a, (zb_joy)
	ld l, a
	ld h, 0
	call zb_AndW
	ld a, h
	or l
	jp z, zb__LABEL2
	ld hl, (zb_padSpdX)
	ld de, -64
	add hl, de
	ld (zb_padSpdX), hl
	push hl
	ld de, 65024
	pop hl
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL5
	ld hl, 65024
	ld (zb_padSpdX), hl
zb__LABEL5:
	jp zb__LABEL3
zb__LABEL2:
	ld hl, 8
	push hl
	ld a, (zb_joy)
	ld l, a
	ld h, 0
	call zb_AndW
	ld a, h
	or l
	jp z, zb__LABEL6
	ld hl, (zb_padSpdX)
	ld de, 64
	add hl, de
	ld (zb_padSpdX), hl
	push hl
	ld hl, 512
	pop de
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL9
	ld hl, 512
	ld (zb_padSpdX), hl
zb__LABEL9:
	jp zb__LABEL7
zb__LABEL6:
	ld hl, (zb_padSpdX)
	push hl
	ld de, 0
	pop hl
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL12
	ld hl, (zb_padSpdX)
	call zb__NEGHL
	srl h
	rr l
	call zb__NEGHL
	ld (zb_padSpdX), hl
	jp zb__LABEL13
zb__LABEL12:
	ld hl, (zb_padSpdX)
	srl h
	rr l
	ld (zb_padSpdX), hl
zb__LABEL13:
zb__LABEL11:
zb__LABEL7:
zb__LABEL3:
	ld hl, (zb_padX)
	push hl
	ld hl, (zb_padSpdX)
	ex de, hl
	pop hl
	add hl, de
	ld (zb_padX), hl
	push hl
	ld de, 0
	pop hl
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL14
	ld hl, 0
	ld (zb_padX), hl
	jp zb__LABEL15
zb__LABEL14:
	ld hl, (zb_padX)
	push hl
	ld hl, 13312
	pop de
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL17
	ld hl, 13312
	ld (zb_padX), hl
zb__LABEL17:
zb__LABEL15:
	ld hl, (zb_ballX)
	push hl
	ld hl, (zb_ballSpdX)
	ex de, hl
	pop hl
	add hl, de
	ld (zb_ballX), hl
	ld hl, (zb_ballY)
	push hl
	ld hl, (zb_ballSpdY)
	ex de, hl
	pop hl
	add hl, de
	ld (zb_ballY), hl
	ld hl, (zb_ballX)
	push hl
	ld de, 0
	pop hl
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL18
	ld hl, 0
	ld (zb_ballX), hl
	ld hl, (zb_ballSpdX)
	call zb__NEGHL
	ld (zb_ballSpdX), hl
	jp zb__LABEL19
zb__LABEL18:
	ld hl, (zb_ballX)
	push hl
	ld hl, 15872
	pop de
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL21
	ld hl, 15872
	ld (zb_ballX), hl
	ld hl, (zb_ballSpdX)
	call zb__NEGHL
	ld (zb_ballSpdX), hl
zb__LABEL21:
zb__LABEL19:
	ld hl, (zb_ballY)
	push hl
	ld de, 0
	pop hl
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL22
	ld hl, 0
	ld (zb_ballY), hl
	ld hl, (zb_ballSpdY)
	call zb__NEGHL
	ld (zb_ballSpdY), hl
	jp zb__LABEL23
zb__LABEL22:
	ld hl, (zb_ballY)
	push hl
	ld hl, 11776
	pop de
	or a
	sbc hl, de
	add hl, hl
	jp nc, zb__LABEL25
	ld hl, 11776
	ld (zb_ballY), hl
	ld hl, (zb_ballSpdY)
	call zb__NEGHL
	ld (zb_ballSpdY), hl
zb__LABEL25:
zb__LABEL23:
	call zb_DrawPad
	ld a, 10
	push af
	ld hl, (zb_ballY)
	ld b, 6
zb__LABEL32:
	sra h
	rr l
	djnz zb__LABEL32
	ld a, l
	push af
	ld hl, (zb_ballX)
	ld b, 6
zb__LABEL33:
	sra h
	rr l
	djnz zb__LABEL33
	ld a, l
	push af
	ld a, 6
	call zb_SetSprite
	call zb_WaitForVBlankNoInt
	call zb_UpdateSprites
	jp zb__LABEL0
zb__LABEL1:
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
zb_ReadJoypad1:
;#line 52
		in	a, ($dc)
		cpl
;#line 54
zb_ReadJoypad1__leave:
	ret
zb_ReadJoypad2:
;#line 59
		in	a, ($dc)
		cpl
		rla
		rla
		rla
		and	$03
		ld	l, a
		in	a, ($dd)
		cpl
		add	a, a
		add	a, a
		or	l
;#line 71
zb_ReadJoypad2__leave:
	ret
zb_AndW:
;#line 76
		pop bc
		pop de
		ld a, l
		and e
		ld l, a
		ld a, h
		and d
		ld h, a
		push bc
;#line 85
zb_AndW__leave:
	ret
zb_DrawPad:
	push ix
	ld ix, 0
	add ix, sp
	ld hl, 0
	push hl
	ld hl, (zb_padX)
	ld b, 6
zb__LABEL34:
	sra h
	rr l
	djnz zb__LABEL34
	ld a, l
	ld (ix-2), a
	ld a, 28
	push af
	ld a, 160
	push af
	ld a, (ix-2)
	push af
	xor a
	call zb_SetSprite
	ld a, (ix-2)
	add a, 8
	ld (ix-2), a
	ld (ix-1), 1
	jp zb__LABEL26
zb__LABEL30:
	ld a, 29
	push af
	ld a, 160
	push af
	ld a, (ix-2)
	push af
	ld a, (ix-1)
	call zb_SetSprite
	ld a, (ix-2)
	add a, 8
	ld (ix-2), a
zb__LABEL31:
	ld a, (ix-1)
	inc a
	ld (ix-1), a
zb__LABEL26:
	ld a, (ix-1)
	push af
	ld a, 4
	pop hl
	cp h
	jp nc, zb__LABEL30
zb__LABEL29:
	ld a, 30
	push af
	ld a, 160
	push af
	ld a, (ix-2)
	push af
	ld a, (ix-1)
	call zb_SetSprite
zb_DrawPad__leave:
	ld sp, ix
	pop ix
	ret
;#line 1 "neg16.asm"
	; Negates HL value (16 bit)
zb__ABS16:
		bit 7, h
		ret z

zb__NEGHL:
		ld a, l			; HL = -HL
		cpl
		ld l, a
		ld a, h
		cpl
		ld h, a
		inc hl
		ret

;#line 366 "test.zxb"

    ret
.ends

.section "ZXB variable init values" free
ZXBASIC_USER_DATA_VALUES:
    ; zb_ballSpdX
	.db 00, 00
; zb_padX
	.db 00, 00
; zb_ballX
	.db 00, 00
; zb_ballY
	.db 00, 00
; zb_ballSpdY
	.db 00, 00
; zb_padSpdX
	.db 00, 00
; zb_joy
	.db 00    
ZXBASIC_USER_DATA_VALUES_END:
.ends


.ramsection "ZXBasic Variables" slot 3
ZXBASIC_USER_DATA ds 0
    	zb_ballSpdX ds 2
	zb_padX ds 2
	zb_ballX ds 2
	zb_ballY ds 2
	zb_ballSpdY ds 2
	zb_padSpdX ds 2
	zb_joy ds 1
ZXBASIC_USER_DATA_END ds 0    
.ends


