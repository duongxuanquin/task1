TITLE TASK1_7A
.MODEL SMALL
.STACK 100h
.DATA
.CODE
MAIN PROC
    MOV   AH,2        ;hien thi ki tu
    MOV   DL,'?'      ;ky tu la "?"
    INT   21H         ;hien thi dau "?"
 ;vao 1 ky tu

    MOV   AH,1        ; ham nhan 1 ky tu tu phim
    INT   21H         ; ky tu duoc luu trong AL
    MOV   BL,AL       ; luu gia tri cua AL trong BL

; tab ra 
    MOV   AH,2        ; ham hien thi 1 ky tu
    MOV   DL,09H      ;cach ra mot dau tab
    INT   21H         ;thuc hien viec cach ra
; hien thi ky tu
    MOV   AH,2
    MOV    DL,BL       ; lay ky tu cua AL luc dau da duoc luu o BL
    INT   21h         ; hien thi no
;tro ve DOS
    MOV   AH,4CH       ;ham thoat ra khoi chuong trinh
    INT   21H          ;thoat ra tro ve DOS
    MAIN  ENDP
END     MAIN



TITLE TASK1_7b
.MODEL SMALL
.STACK 100h
.DATA
TB1 db 'nhap vao 1 chu hoa: $'
TB2 db 09h,'chu cai thuong la:'
char db ?,'$'
.code
main proc
; khoi tao DS
     mov   ax,@data
     mov    ds,ax
;in dong nhac nguoi su dung
     lea    dx,TB1     ; lay dia chi cua TB1 cho dx
     mov    AH,9        ; ham hien thi chuoi, choi do lay tu DX
     int    21h         ;thuc hien no
; vao mot ky tu và doi thanh chu thuong
     mov    ah,1        ;ham doc 1 ky tu
     int    21h         ; bat dau doc va luu no vao AL
     add    al,20h      ;doi chu ha thanh chu thuong
     mov    char,al     ; luu ky tu do vao 
     lea    dx,TB2
     mov    ah,9        ; hien thi chu
     INT    21H         ;ham hien thi TB2 va chu thuong
;tro ve DOS
     mov    ah, 4ch
     int    21h
     main   endp
end          main





TITLE TASK1_8
.MODEL SMALL
.STACK 100h
.DATA
TB1   db    '$'
TB2   db    0dh,0ah,'tong cua 2 so la:$'
char   db    ?
a      dw    ?
b      dw    ?
.code
main proc
;khoi tao data ds
    mov     ax,@data
    mov     ds,ax 
;in dau ?
    mov      ah,2      ; ham xuat 1 ky tu
    mov      dl,'?'    ; ky tu la dau "?"
    int      21h
;in dong nhac
    lea      dx,TB1    ; lay thong bao TB1
    mov      ah,9       ;ham hien thi
    int      21h        ; hien thi thong bao
;vao so dau tien
    mov      ah,1       ; ham vao 1 ky tu
    int      21h        ; doc ky tu do 
    sub      al,30h     ; chuyen chu thanh so
    mov      a,ax       ; gan gia tri do cho a
;vao so thu 2
    mov      ah,1       ; ham vao 1 ky tu
    int      21h        ; nhan ky tu do
    sub      ax,30h     ; chuyen dl thanh so
    mov      b,ax       ; truyen ax cho b  
;hien thi dong 2
    lea      dx,TB2    ; dua TB2 cho dx
    mov      ah,9 
    int      21h 
;cong
    mov      ax,a
    add      ax,b
    MOV      A,Ax
; hien thi tong 2 so
    mov      dx,ax
    add      dl, 30h
    mov      ah,2
    int      21h
; tro ve dos
     mov     ah,4ch
     int     21h
     main       endp
end             main



TITLE TASK1_9
.MODEL SMALL
.STACK 100h
.DATA
TB1 dw 'nhap vao 3 chu cai dau cua ten$'
TB2 db 0dh,0ah,'$' 
a db ?,'$'
b db ?,'$'
c db ?,'$'
.CODE
MAIN PROC
    mov ax,@data
    mov ds,ax
;in dong nhac
    lea dx,TB1 
    mov ah,9 
    int 21h
;nhan vao chu cai
    mov ah,1 ; ham nhan 1 ky tu
    int 21h ;nhan
    mov a,al
    mov ah,1 ;nhan ky tu thu 2
    int 21h  ;nhan
    mov b,al  ; gan no cho b
    mov ah,1
    int 21h 
    mov c,al
; in ra
    lea dx,TB2 
    mov ah,9
    int 21h
;in ky tu 1
    lea dx,a 
    mov ah,9
    int 21h
    lea dx,TB2
    mov ah,9
    int 21h
;in ky tu 2
    lea dx,b
    mov ah,9
    int 21h
    lea dx,TB2
    mov ah,9
    int 21h
;in ky tu 3
    lea dx,c
    mov ah,9
    int 21h
    lea dx,TB2
    mov ah,9
    int 21h
 ;tro ve dos
    mov    ah,4ch
    int 21h
 main   endp
end  main    



TITLE TASK1_10
.MODEL SMALL
.STACK 100h
.DATA
TB1 DB 'NHAP KY TU  (A - F): $'
TB2 DB 0DH,0AH,'SO DO LA: $'
MSG10 DB '10$'
MSG11 DB '11$'
MSG12 DB '12$'
MSG13 DB '13$'
MSG14 DB '14$'
MSG15 DB '15$'
a db ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
;Thong bao nhap
    LEA DX, TB1
    MOV AH,9
    Int 21h
;Nhap
    Mov ah, 1
    int 21h;
    mov a, al
;thong bao xuat
    LEA Dx,TB2
    mov ah,9
    int 21h
;kiemtra
    mov al, a
;
    cmp al, 65
    je In10
;
    cmp al, 66
    je In11
;
    cmp al, 67
    je In12
;
    cmp al, 68
    je In13
;
    cmp al, 69
    je In14
;
    cmp al, 70
    je In15
;IN
    In10:
    LEA dx, msg10
    mov ah,9
    int 21h
    jmp thoat
;
    In11:
    LEA dx, msg11
    mov ah,9
    int 21h
    jmp thoat
;
    In12:
    LEA dx, msg12
    mov ah,9
    int 21h
    jmp thoat
;
    In13:
    LEA dx, msg13
    mov ah,9
    int 21h
    jmp thoat
;
    In14:
    LEA dx, msg14
    mov ah,9
    int 21h
    jmp thoat
;
    In15:
    LEA dx, msg15
    mov ah,9
    int 21h
    jmp thoat
;dos
    thoat:
    mov ah,4ch
    int 21h
main endp
end main










TITLE TASK1_11
.MODEL SMALL
.STACK 100h
.DATA
MSG     Db    0ah,0dh,'**********$'
.code
main proc
    mov      ax,@data      ;khoi tao data
    mov      ds,ax
;khoi tao vong lap =10
     mov     cx,10
     xuat:
     lea     dx,msg
     mov     ah,9
     int     21h
     loop xuat      ; nhan loop se lap voi so lan dc luu trong cx va moi lan cx tru di 1
;tro ve dos
     mov     ah,4ch
     int     21h
;ket thuc
     main endp
end main
