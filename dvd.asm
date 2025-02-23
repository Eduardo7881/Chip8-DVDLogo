; CHIP-8 DVD Bounce Logo
; Autor: Eduardo

; Configuração inicial
LD V0, 2  ; Posição X inicial
LD V1, 2  ; Posição Y inicial

LD V2, 2  ; Velocidade X
LD V3, 1  ; Velocidade Y

; Sprite do logotipo (4x4 pixels)
LD I, sprite

; Loop principal
loop:
    CLS  ; Limpa a tela
    DRW V0, V1, 4  ; Desenha o logotipo
    
    ; Atualiza posição X
    ADD V0, V2
    SE V0, 60  ; Se X >= 60, inverte a direção
    CALL invert_x
    SE V0, 0  ; Se X <= 0, inverte a direção
    CALL invert_x
    
    ; Atualiza posição Y
    ADD V1, V3
    SE V1, 28  ; Se Y >= 28, inverte a direção
    CALL invert_y
    SE V1, 0  ; Se Y <= 0, inverte a direção
    CALL invert_y
    
    ; Delay e loop
    LD DT, V2  ; Usar registrador para delay
    JP loop

; Sub-rotinas para inversão de velocidade
invert_x:
    LD V4, V2  ; Copia V2 para V4
    XOR V4, V4 ; Zera V4
    SUB V4, V2 ; V4 = -V2
    LD V2, V4  ; Armazena de volta em V2
    RET

invert_y:
    LD V4, V3  ; Copia V3 para V4
    XOR V4, V4 ; Zera V4
    SUB V4, V3 ; V4 = -V3
    LD V3, V4  ; Armazena de volta em V3
    RET

sprite:
    DB #F0  ; ####
    DB #90  ; #  #
    DB #90  ; #  #
    DB #F0  ; ####
