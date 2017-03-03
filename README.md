# BÁO CÁO TASK 1 (GIỚI THIỆU HỢP NGỮ CHO IBM PC)
>Nguồn tham khảo :[Giao trinh Assembly](http://tailieu.vn/doc/chuong-4-gioi-thieu-hop-ngu-cho-ibm-pc-203738.html)
>Người thực hiện: **DƯƠNG XUÂN QUIN**
---
##MỤC LỤC 
>[**I. Cú pháp của Hợp ngữ.** ](#I)
><ul><li>[**1 Trường tên.**](#I.1)</li>
><li>[**2 Trường toán tử.**](#I.2)</li>
><li>[**3 Trường toán hạng.**](#I.3)</li>
><li>[**4 Trường lời giải thích.**](#I.4)</li></ul>
>[**II.Dữ liệu chương trình.**](#II)
>[**III.Các biến.**](#III)
><ul><li>[**1 Các biến kiểu byte.**](#III.1)</li>
><li>[**2 Các biến kiểu word.**](#III.2)</li>
><li>[**3 Các mảng.**](#III.3)</li></ul>
>[**IV. Các hằng có tên.**](#IV)
>[**V. Vài lệnh cơ bản**](#V)
><ul><li>[**1. MOV và XCBG.**](#V.1)</li> 
><li>[**2. Các chỉ thị ADD, SUB, INC và DEC.**](#V.2)</li>
><li>[**3. NEG.**](#V.3)</li></ul>
>[**VI. Dịch từ ngôn ngữ bậc cao sang Hợp ngữ.**](#VI)
>[**VII Cấu trúc chương trình.**](#VII)
><ul><li>[**1.Các chế độ bộ nhớ .**](#VII.1) </li>
><li>[**2. Đoạn dữ liệu(Data segment).**](#VII.2)</li>
><li>[**3. Đoạn ngăn sắp xếp(Stack segment)**](#VII.3)</li>
><li>[**4. Đoạn mã(Code segment).**](#VII.4)</li>
><li>[**5. Tổng hợp lại.**](#VII.5)</li></ul>
>[**VIII. Lệnh vào ra.**](#VIII)
><ul><li>[**1. Ngắt 21h**](#VIII.1)</li></ul>
>[**VIIII.Chương trình đầu tiên.**](#VIIII)
>[**X. Hiển thị một chuổi.**](#X)
>[**XI. Tổng kết**](#XI)
----
<a name="I"></a>
## I. Cú pháp của Hợp ngữ
###Các dòng lệnh.
 >+ Các chương trình bao gồm các dòng lệnh, mỗi dòng lệnh trên 1 dòng. 1 dòng lệnh là 1 lệnh mà trình biên dịch sẽ dịch ra mã máy hay là 1 hướng dẫn biên dịch để chỉ dẫn cho trình biên dịch thực hiện 1 vài nhiệm vụ đặc biệt nào đó, chẳng hạn dành chỗ cho 1 biến nhớ hay khai báo 1 chương trình con. 

  >+ Mỗi lệnh hay hướng dẫn biên dịch thường có 4 trường:
            Tên     Toán tử         Toán hạng        Lời bình
            
  + *Ví dụ 1 lệnh:*

           START:       MOV        CX,5             ;khởi tạo bộ đếm.
           
    Trong ví dụ này, trường tên là nhãn **START**, toán tử là **MOV**, toán hạng là **CX và 5**, lời bình là **‘khởi tạo bộ đếm’**
  
  + *Ví dụ về bộ đếm biên dịch:*

           MAIN       PROC
           
###1.    TRƯỜNG TÊN<a name="I.1"></a>
 
  >- Trường tên được sử dụng làm nhãn lệnh, các tên thủ tục và các tên biến. Chương trình biên dịch sẽ chuyển các tên thành các địa chỉ bộ nhớ.
  >- Các tên có thể có chiều dài từ 1 đến 31 kí tự, có thể chứa các chữ cái, chữ số và các kí tự đặc biệt (? . @ _ $ %).

  **Ví dụ các tên hợp lệ:** **COUNTER1**, **@character**, **SUM_OF_DIGITS** , **$1000**, **DONE?**, **.TEST**

  ***Ví dụ các tên không hợp lệ:***  TOW      WORD  (chứa 1 khoảng trống),   2abc   (bắt đầu bằng 1 chữ số), A45.28 (dấu chấm không phải là kí tự đầu tiên),  YOU&ME    (chứa 1 kí tự không hợp lệ  ).

###2. TRƯỜNG TOÁN TỬ<a name="I.2"></a>

+ Trong 1 lệnh, trưởng toán tử chứa mã lệnh dạng tượng trưng. Chương trình biên dịch sẽ chuyển mã lệnh dạng tượng trưng sang mã lệnh của ngôn ngữ máy. Tượng trưng của mả lệnh thường biểu thị chức năng của các thao tác. 

+ *Ví dụ* như : **MOD**, **ADD**, **SUB** .

###3 Trường toán hạng.<a name="I.3"></a>

                  NOP                           không toán hạng, không làm gì cả
                  INC      AX                   một toán hạng, cộng 1 vào nội dung AX
                  ADD     WORD1,2             hai toán hạng, cộng 2 vào từ nhớ WORD1

  Trong 1 chỉ thị 2 toán hạng, toán hạng đầu tiên gọi là toán hạng đích. Nó có thể là 1 thanh ghi hoặc 1 ô nhớ, là nơi chứa kết quả (lưu ý 1 số chỉ thị không lưu giữ kết quả). Toán hạng thứ 2 là toán hạng nguồn. Các chỉ thị thường không làm thay đổi toán hạng nguồn.

###4 Trường lời giải thích.<a name="I.4"></a>

Người lập trình thường sử dụng trường lời giải thích của 1 dòng lệnh để giải thích dòng lệnh đó làm cái gì. Mở đầu trường này là 1 dấu chấm phẩy (;) và trường biên dịch bỏ qua mọi cái được đánh vào sau dấu chấm phẩy này. Lời giải thích có thể tùy ý (có hoặc không) nhưng vì hợp ngữ là ngôn ngữ bậc thấp cho nên ta hầu như không thể hiểu được 1 chương trình viết bằng Hợp ngữ khi không có lời bình.


                  MOV           CX,0            ;CX đếm số vòng lặp, khởi tạo 0
                  
##II. DỮ LIỆU CHƯƠNG TRÌNH<a name="II"></a> 
** CÁC SỐ**

>- Một số nhị phân được viết như là 1 chuỗi các bit kết thúc bằng chữ cái ‘B’ hay ‘b’.

>- Một số thập phân là chuỗi các chữ số thập phân kết thúc bằng chữ cái ‘D’ hay ‘d’ (hoặc không có).

>- Một số hex phải bắt đầu bằng 1 chữ số thập phân và kết thúc bằng chữ cái ‘H’ hay ‘h’.


                     Số                      Kiểu
                    1100                  thập phân 
                    1100b                 nhị phân
                    12345                 thập phân
                    -3568D              thập phân
                    1,234                 không hợp lệ, chúa kí tự không là chữ số
                    1B4DH                 số hex
                    1B4D                  số hex không hợp lệ, không kết thúc là ‘h’
                    FFFFH                 số hex không hợp lệ, không bắt đầu bằng chữ số thập phân
                    0FFFFh              số hex
**CÁC KÝ TỰ.**

+ Các kí tự và chuỗi các kí tự phải được bao trong dấu nháy đơn hoặc nháy kép. 

            Toán tử giả               Biểu diễn
                DB                    Định nghĩa byte 
                DW                    Định nghĩa word
                DD                    Định nghĩa từ kép
                DQ                    Định nghĩa 4 word (4 từ liên tiếp)
                DT                    Định nghĩa 10 byte (10 byte liên tiếp)
                
##III. Các biến.<a name="III"></a>

Trong hợp ngữ, các biến có vai trò giống như trong các ngôn ngữ bậc cao. Mỗi biến có 1 kiểu dữ liệu và được chương trình gán cho 1 địa chỉ bộ nhớ. Mỗi toán tử giả có thể được dùng để thiết lập 1 hay nhiều dữ liệu của kiểu đã được đưa ra.

###1. Các biến kiểu byte.<a name="III.1"></a>

- Dẫn hướng định nghĩa 1 biến kiểu byte của trình biên dịch có dạng như sau:

            Tên       DB            giá_trị_khởi_tạo
**Ví dụ:**

            ALPHA       DB                4
            
+ Một dấu chấm hỏi (?) đặt ở vị trí của giá trị khởi tạo sẽ tạo nên 1 byte không được khởi tạo. 

***Ví dụ:***

            BYTE         DB                   ? 
            
###2. Các biến kiểu word.<a name="III.2"></a>

- Dẫn hướng định nghĩa 1 biến kiểu word của trình biên dịch có dạng sau đây:

            Tên         DW              giá_trị_khởi_tạo
            
- Toán tử giả DW có nghĩa là **“định nghĩa word”**.

**Ví dụ:**

            WRD         DW                      -2
            
- Giống như với biến kiểu byte, 1 dấu chấm hỏi ở vị trí giá trị khởi tạo có nghĩa là word không được khởi tạo giá trị đầu.
##3. CÁC MẢNG<a name="III.3"></a>

+ Trong ngôn ngữ hợp ngữ, mảng chỉ là 1 chuỗi các byte nhớ hay từ nhớ. Ví dụ để định nghĩa mảng 3 byte có tên B_ARRAY với các giá trị khởi tạo là 10h, 20h, 30h chúng ta có thể viết:

              B_ARRAY         DB                  10h,20h,30h
            
+ Nếu như trình biên dịch gán địa chỉ offset 0200h cho B_ARRAY thì bộ nhớ sẽ như sau:

            Phần tử           Địa chỉ                 Nội dung
            
            B_ARRAY             0200h                 10h
            
            B_ARRAY+1             0201h               20h
            
            B_ARRAY+2             0202h               30h
            
+ Mảng các word có thể định nghĩa 1 cách tương tự.

              W_ARRAY                 DW                1000,356,248,13
              
sẽ tạo nên 1 mảng có 4 phần tử với các giá trị khởi tạo là 1000,356,248,13. Từ đầu tiên được gán với tên W_ARRAY, từ tiếp theo gán với  W_ARRAY+2, rồi đến W_ARRAY+4 v.v. Nếu mảng bắt đầu tại 0300h thì bộ nhớ sẽ như sau:

              Phần tử           Địa chỉ             Nội dung
              
              W_ARRAY                 0300h             1000d
              
              W_ARRAY   +2          0302h               356d
              
              W_ARRAY   +4          0304h               248d
              
              W_ARRAY   +6          0306h               13d
              
**Các chuỗi ký tự.**

- Một chuỗi ký tự có thể được khởi tạo bằng mảng các mã ASCII

***Ví dụ:***

                  LETTER             DB                   ‘ABC’
                  
- Tương đương với:

                  LETTER            DB                  41h,42h,43h
                  
- Trong một chuỗi , trình biên dich phân biệt các chữ hoa và chữ thường.

- Cũng có thể kết hợp các ký tự và các số trong định nghĩa.

***Ví dụ:***

                    MSG               DB                  ‘HELLO’, 0ah, 0Dh, ’S’
                    
***Tương đương với:***

                    MSG               DB                   48h,45h,4Ch,4Ch,4Fh,0Ah,0Dh,24h

##IV.Các hằng có tên.<a name="IV"></a>

- Để tạo ra các mã lệnh Hợp ngữ dễ hiểu, ngta thường dùng các tên tượng trưng để biểu diễn các hằng số **EQU**

- Để gán tên cho hằng, chúng ta có thể sử dụng toán tử giả **EQU**.

***Cú pháp :***

                    Tên             EQU                 hằng _ số
                    
***VÍ DỤ:***
    
                      LF                  EQU                     0Ah
                      
- Phần tử EQU cũng có thể là một chuỗi

***VÍ DỤ:***

                    PROMPT              EQU               ‘TYPE YOUR NAME’’
                    
- Sau đó thay vì:    

                     MSG                    DB                  “TYPE YOUR NAME”
                     
- Ta có thể viết :  
    
                      MSG                     DB                        PROMPT
                      
##V.VÀI LỆNH CƠ BẢN:<a name="V"></a>

###1.MOV và XCHG.<a name="V.1"></a>

-Lệnh MOV được sử dụng để chuyển dữ liệu giữa các thanh ghi , giữa một thanh ghi và một ô nhớ or chuyển trực tiếp một số vào một thanh ghi hay ô nhớ

***Cú pháp:***

                        MOV           đích, nguồn
                        
 **Ví dụ:**     
 
                        MOV             AX,WORD
                        
                              MOV               AX,BX
                        
-Lệnh XCHG (hoán chuyển) được dùng để hoán chuyển nội dung của hai thanh ghi , thanh ghi và một bộ nhớ. 

***Cú pháp:***

                         XCHG             đích, nguồn
                         
***Ví dụ:***

                        XCHG                  AH,BL
                        
                            XCHG                  AX,WORD1
                        
-Các hạn chế của **MOV** và **XCHG**: Các chỉ thị MOV và XCHG không hợp lệ trong trường hopẹ hai toán hạng cùng là các ô nhớ

***VÍ DỤ:***

                        MOV         WORD1,WORD2     ;không hợp lệ
                        
###2.Các chỉ thị ADD,SUB, INC và DEC.<a name="V.2"></a>

- Các chỉ thị ADD và SUB được sử dụng để cộng or trừ nội dung của hai thanh ghi , một thanh ghi và một bộ nhớ hoặc cộng (trừ) một số vào một thanh ghi hay một ô nhớ.

    ***Cú pháp:***
          
                        ADD               đích, nguồn
                        
                            SUB               đích , nguồn
                        
***VÍ DỤ***: 

                        ADD               WORD1,AX
                        
                          SUB               AX,DX
                        
                        ADD                 BL, 5
                        
- Cũng giống như trường hợp MOV và SUB . Phép trừ hay phép cộng trực tiếp giữa các ô nhớ là không hợp lệ

***VÍ DỤ*** 

                        ADD               BYTE1,BYTE2             ;không hợp lệ
                        
- **INC**(INCrement) được dùng để cộng 1 vào nội dung của một thanh ghi hay ô nhớ, DEC(DECrement) trừ 1 vào nội dung của 1 thanh ghi hay ô nhớ

***Cú pháp:***

                          INC             đích
                          
                              DEC             đích
                          
***VÍ DỤ*** : 

                          INC             WORD1
                          
                          DEC             BYTE1
                          
###3. NEG<a name="V.3"></a>

- **NEG** dùng để phủ định nội dung của toán hạng đích. DEC sẽ thay thế nội dung bởi phần bù 2 của nó. 

    ***Cú pháp:***
  
                          NEG               đích
                          
- Toán hạng đích có thể là một thanh ô nhớ.

***VÍ DỤ***

                          NEG                 BX
                          
- Kiểu quy ước các toán hạng: Các toán hạng của các lệnh hai toán hạng đã nêu phải có cùng kiểu, tức là cùng là byte or word. 
    
                          MOV                 AX,BYTE1          ;không hợp lệ
                          
- Trình biên dịch cấp nhận cả hai lệnh sau:

                          MOV                   AH,’A’
                          
                          MOV                   AX,’A’
                          
##VI.Dich từ ngôn ngữ bậc cao sang Hợp ngữ.<a name="VI"></a>

                Dòng lệnh               Dịch
                
                B=A                   MOV       AX,A        ;chuyển A vào AX
                
                      MOV       B,AX        ;rồi sang B

                A=5-A           MOV         AX,5        ;chuyển 5 vào AX
                
                                SUB     AX,A        ;AX chứa 5-A
                          
                                MOV     A,AX        ;rồi đứa nó vào A
                          
                A=B-2*A     MOV         AX,B        ;chuyển B vào AX
                
                                SUB     AX,A        ;AX chứa B-A
                          
                                SUB     AX,A        ;AX chứa B-2*A
                          
                                MOV     A,AX        ;rồi đứa nó vào A
                          
##VII.Cấu trúc chương trình<a name="VII"></a>

###1.Các chế độ bộ nhớ<a name="VII.1"></a>

- Kích thước của đoạn mã và dữ liệu trong một chương trình có thể được xác đinh bằng cách chỉ ra chế độ bộ nhớ nhờ sử dụng dẫn hương biên dịch  **.MODEL**

    **Cú pháp:**
  
                  .MODEL          kiểu_bộ_nhớ
                  
- Các chế độ bộ nhớ thường sử dụng nhất là : SMALL,MEDIUM,COMPACT và LARGE. Dẫn hướng biên dịch  .MODEL phải được đưa vào trước bất kỳ một định nghĩa đoạn nào.

**Bảng các kiểu bộ nhớ**

          Kiểu                          Miêu tả
          SMALL               Mã lệnh trong một đoạn
                                  Dữ liệu trong một đoạn

          MEDIUM                Mã lệnh chiếm nhiều hơn một đoạn
                                  Dữ liệu trong một đoạn

          COMPACT               Mã lệnh trong một đoạn
                                  Dữ liệu chiếm nhiều hơn một đoạn

          LARGE               Mã lệnh chiếm nhìu hơn một đoạn
                                  Dữ liệu chiếm nhiều hơn một đoạn
                                  Không có mảng nào lớn hơn 64Kbyte

          HUGE                  Mã lệnh chiếm nhìu hơn một đoạn
                                  Dữ liệu chiếm nhiều hơn một đoạn
                                  Các mảng có thể lớn hơn 64 Kbyte
                        
###2. Đoạn dữ liệu (Data segment)<a name="VII.2"></a>

- Đoạn dữ liệu của 1 chương trình chưa tất cả các định nghĩa biến. Để khai báo một đoạn dữ liệu chúng sử dụng dẫn hướng biên dịch .DATA, theo sau là các khai báo biến hay hằng. 
***Ví dụ:***

          .DATA
          WORD1     DW        2
          WORD2     DW      5
          MSG           DB      ‘THIS IS A MESSAGE’
          WASK      EQU     10010010B
          
###3.Đoạn ngăn xếp (Stack seg ment)<a name="VII.3"></a>

- Mục đích của khai báo ngăn xếp là tạo ra một khối bộ nhớ (vùng ngăn xếp ) để chứa ngăn xếp. Vùng có thể đủ lớn để chứa ngăn xếp với kích thước lớn nhất của nó.

***Cú pháp :***             .STACK      kích_thước

***VD:***                   .STACK          100h

- Nếu kích thước bị bỏ qua, 1 Kbyte sẽ được thiết lập cho vùng ngăn xếp.

###4. Đoạn mã (Code segment)<a name="VII.4"></a>

- Đoạn mã chứa các lệnh của chương trình.

***Cú pháp:***              .CODE   tên

- Bên trong đoạn mã, các lệnh được tổ chức như các thủ tục.

                  Tên_thủ_tục           PROC        ;thân của thủ tục
                  Tên_thủ_tục       ENPC
****VÍ DỤ:***

                  .CODE
                  MAIN              PROC        ;các lệnh của chương trình chính
                  MAIN              ENDP        ;các thủ tục khác
                  
###5.Tổng hợp lại.<a name="VII.5"></a>

                  .MODEL    SMALL
                  .STACK    100H
                  .DATA     
                  ;Các định nghĩa số liệu ở đây
                  .CODE
                  MAIN PROC
                  ;Các lệnh ở đây
                  MAIN ENDP
                  ;Các thủ tục khác ở đây
                  END   MAIN
                  
##VIII. CÁC LỆNH VÀO RA<a name="VIII"></a>

** Lệnh INT**

- Lệnh INT được dùng để gọi các chương trình ngắt của **DOS**  và **BIOS**

                  INT số _hiệu_ngắt
                
***VÍ DỤ***

                INT         16
                
###1.Ngắt 21h<a name="VIII.1"></a>

- Dùng để gọi rất nhiều hàm của DOS. Mỗi hàm được gọi bằng các đặt số hàm vào trong thanh ghi AH và gọi INT 21h

              Số hiệu hàM              Chương trình
                    1                   Vào một phím
                    2               Đưa ra một ký tự màn hình
                    9                 Đưa ra một chuỗi ký tự
                    
- Các hàm của ngắt 21h nhận dữ liệu trong các thanh ghi nào đó và trả về kết quả trong các thanh ghi khác . 

**Hàm 1: Vào một phím**

            Vào :           AH=1
            Ra:         AL=Mã ASCII nếu một phím ký tự được ấn       
                          = 0 Nếu một phím điều khiển hay chức năng được nhấn
                              
- Để gọi phục vụ, thực hiện các lệnh:

            MOV               AH,1          ;hàm vào một phím
            INT               21h           ;mã ASCII trong AL
            
**Hàm 2: Hiển thị một ký tự hay thi hành một chức năng điều khiển**

            Vào :          AH=2
                       DL=mã ASCII của ký tự hiển thị hay ký tự điều khiển
                 
            Ra :       AL= mã ASCII của ký tự hiển thị hay ký tự điều khiển.
            
- Để dùng hàm này hiển thị một ký tự, ta đặt mã ASCII của nó trong DL.

***VÍ DỤ:***
Lệnh sẽ làm xuất hiện dấu chấm hỏi trên màn hình:

                  MOV                   AH,2
                  MOV                 DL,’?’
                  INT                   21h
          
**BẢNG Mã ASCII(HEx)**

                Mã ASCII(HEx)             Ký hiệu                 Chức năng
                    7                   BEL               phát tiếng bíp (beep)
                    8                       BS                lùi lại một vị trí
                    9                   HT                      tab
                    A                       LF                  xuống dòng
                    D                       CR              xuống dòng và về đầu dòng.
                    
##VIIII. Chương trình đầu tiên.<a name="VIIII"></a>

- Đọc một ký tự từ bàn phím và hiển thị nó ở đầu dòng tiếp theo

                  MOV                     AH,2          ;hàm hiển thị ký tự
                  MOV                     DL,’?’        ;ký tự là “?”
                  INT                     21h       ;hiện thị ký tự
                  
- Tiếp theo đọc một ký tự:

                  MOV                     AH,1      ;hàm đọc một ký tự
                  
                  INT                     21h       ;ký tự trong AL
                  
- Ký tự phải được cất vào một thanh ghi khác

                  MOV                     BL,AL     ;cất ký tự vào trong BL
                  
- Dịch chuyển con trỏ màn hình đến vị trí đầu dòng tiếp theo

                    MOV               AH,2              ;hàm hiển thị ký tự
                    MOV               DL,0Dh            ;về đầu dòng
                    INT                21h              ;thực hiện về đầu dòng
                    MOV                DL,0Ah           ;xuống dòng
                    INT                    21h              ;thực hiện xuống dòng
                    
- Sẵn sàng hiển tự ký tự:

                    MOV               DL,BL             ;lấy ký tự
                    INT               21h               ;và hiển thị nó
                    
##X. Hiển thị một chuỗi.<a name="X"></a>

- Ngắt 21h, **Hàm 9: Hiển thị một chuỗi**

            Vào: DX=địa chỉ tương đối (offset) của chuỗi
              Chuỗi phải kết thúc bằng ký tự ‘$’
            
***VÍ DỤ:***

                      MSG                     DB                “HELLO!$”

- **Lệnh LEA**

**Hàm 9 của ngắt 21h yêu cầu địa chỉ tương đối của chuỗi ký tự chứa trong DX**

                      LEA               đích, nguồn
                      
***VÍ DỤ***

                      LED                   DX,MSG
                      
**Đoạn mở đầu của chương trình**

- Một chương trình chứa đoạn dữ liệu sẽ được bắt đầu với hai lệnh sau:

                      MOV           AX,DATA
                      MOV           DS,AX

                      LEA       DX,MSG              ;lấy thông báo
                      MOV       AH,9            ;hàm hiển thị chuỗi
                      INT       21h         ;hiển thị chuỗi
                      
**Chương trình PGM4_2.ASM**

              TITLE     PGM4_2: Chương trình in chuỗi ký tự.
              .MODEL        SMALL
              .STACK        100H
              .DATA     
              MSG       DB      “HELLO!$”
              .CODE
              MAIN      PROC
              ;khởi tạo DS
                  MOV       AX,@DATA
                  MOV       DS,AX
              ;hiển thị thông báo
                  LEA       DX,MSG              ;lấy thông báo
                  MOV       AH,9            ;hàm hiển thị chuỗi
                  INT       21h         ;hiển thị chuỗi
              ;trở về DOS
              MOV       AH,4CH
              INT       21H
              MAIN      ENDP    
                  END       MAIN

## XI.Tổng kết.<a name="XI"></a>
- Các chương trình bằng Hợp ngữ được tạo nên từ các dòng lệnh. Mỗi dòng lệnh có thể là một lệnh sẽ được máy tính thi hành hay một dẫn hướng cho chương trình biên dịch.
- Các dòng lện bao gồm các trường tên, toán tử, (các) toán hạng và trường lời bình.
- Một tên chứa 31 ký tự.Các ký tự có thể là các chữ cái, chữ số hay các ký hiệu đặc biệc nào đó.
- Các số có thể được viết ở dạng nhị phân, thập phân hay hex.
- Các ký tự và chuỗi ký tự phải được bao bọc bởi dấu ngoặc đơn hay ngoạc kép.
- Các dẫn hướng DB và DW được dùng để định nghĩa các biến byte và các biến word. SQU sử dụng khi muốn gán tên cho hằng.
- Nói chung một chương trình chứa một đoạn mã, một đoạn dữ liệu và một đoạn ngăn xếp.
- MOV và XCHG được dùng để chuyển số liệu. Có một vài hạn chế khi sử dụng các lệnh này, ví dụ chúng không thể thao tác trực tiếp giữa các ô nhớ.
- ADD , SUB, INC, DEC và NEG là các số học cơ bản .
- Có hai cách xuất và nhập dữ liệu đối với IBM PC : liên lạc trực tiếp với các thiết bị ngoại vi thông qua cổng và sử dụng các phục vụ ngắt cảu DOS và BIOS.
- Phương pháp trực tiếp khó lập trình và phụ thuộc vào các vi mạch phần cứng nhất định.
- Xuất và nhập các ký tự hay các chuỗi có thể thực hiện nhờ phục vụ ngắt 21h của DOS.
- Hàm 1 của ngắt : 21h đọc một ký tự từ bàn phím vào thanh ghi Al.
- Hàm 2 của ngắt 21h hiển thị ký tự có mã ASCII chứa trong thanh ghi DL.Nếu DL chứa mã ASCII của một ký tự điều khiển thì chức năng điều khiển sẽ được hình thành.
- Hàm 9 của ngắt 21h hiển thị chuỗi có địa chỉ tương đối trong DX. Chuỗi phải được kết thúc bằng ký tuwh '$'.


Bài viết còn nhiều thiếu sót, mong được sự thông cảm của mọi người để các bài viết sau được cải thiện hơn


Contact: https://www.google.com.vn/
Nickname:MH


              
