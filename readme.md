# Assembly_MidtermProject


如題，僅供參考

但如果想零分ㄉ話
歡迎抄襲；)

# 112-1 組合語言與嵌入式系統 Midterm Project 作業說明
## 【Project 目的】
使用 GCC、GAS、GDB 與 Code::Blocks，撰寫 ARM 組合語言程式，並在包含 ARM 處
理器之電腦環境中驗證執行。
ARM 組合語言程式撰寫請參考以下資料：
1. 組合語言與嵌入式系統課程講義。
2. 教科書：Modern Assembly Language Programming with the ARM Processor。
3. 參考資料：ARMv5 Architecture Reference Manual。

## 【Project 基本說明】
本 Project 之程式 MAIN 包含兩個函數：NAME, ID，共同構成一個能列印組別、組員名字、
與學號，並完成加總運算的 Assembly Program。所有程式均需以 ARM Assembly 完成。
* 程式需符合「Project 基本要求」：
1. 需撰寫 3 個 Function：NAME, ID, 與 MAIN，並分成三個組合語言檔案 name.s, id.s, 
與 main.s。
2. 需使用 Load/Store 指令中，10 種定址模式當中的 3 種以上不同模式。
3. 需使用 Data Processing 指令中，13 種 Operand2 格式的當中 4 種以上不同格式。
4. 程式中需包含 4 道以上不同的非 Branch 指令的 Conditional Execution (不包含 al 條
件)。
5. 在 id.s 程式的第 6 道實體指令須為一道一定要執行的指令：adds lr, pc, r0。
## 【Project 功能說明】
### NAME 函數功能說明：

(1) 功能：
印出組別與組員名單。

(2) 程式設計：

(a) 規劃 4 個記憶體區塊，分別存放組別與組員的英文姓名。
    (b) 組別與組員名單已事先填入所屬之記憶體區塊。
    (c) 撰寫程式，印出組別與組員姓名。
        
(3) 預期輸出結果範例：假設第 1 組組員有(1) Peter Huang、(2) Mary Sue、(3) Tom Smith。
```
*****Print Name*****
Team 01
Peter Huang
Mary Sue
Tom Smith
*****End Print*****
```

(4) 程式要求：

(a) 所有程式須以 ARM Assembly 完成，並可順利執行。

(b) 組別與組員需分行印出。
    
(c) 若組員不足 3 位，請重複填入已有的組員姓名即可，直到用完 3 個記憶體區塊為止。
    
(d) 報告除了程式說明外，需以 Code::Block 中，Debug 功能的顯示 Memory dump 的方式，印出儲存組別與組員資料的記憶體區塊內容，並以螢幕截圖，貼在報告上並說明其起始與結束記憶體位址。
### ID 函數功能說明：
    
(1) 功能：
    輸入組員的學號，並印出組員學號與學號總和。

(2) 程式設計：
    
(a) 規劃 4 個記憶體位址，作為之後輸入組員學號與總和的緩衝區

(b) 請以輸入的方式，輸入三個組員的學號，並記錄於先前規劃的記憶體位址。

(c) 學號輸入完後，將 3 組輸入學號加總成一個數值，記錄於第 4 個記憶體區塊。

(d) 輸入完 3 組學號後，按下 p 鍵，即分行印出完整的組員學號與學號總和。
(3) 預期輸出結果範例：假設第 1 組組員所輸入的學號分別是(1) 10027001、(2) 10027002、(3) 10027003。
```
*****Input ID*****
** Please Enter Member 1 ID:**
    10027001
** Please Enter Member 2 ID:**
10027002
** Please Enter Member 3 ID:**
10027003
** Please Enter Command **
p
*****Print Team Member ID and ID Summation*****
10027001
10027002
10027003
ID Summation = 30081006
*****End Print*****
```
(4) 程式要求：
        
(a) 所有程式須以 ARM Assembly 完成，並可順利執行。

(b) 組員學號需分行印出。

(c) 若組員不足 3 位，請重複填入已有的組員學號即可，直到用完 3 個記憶體區塊為止。

(d) 報告除了程式說明外，需以 Code::Block 中，Debug 功能的顯示 Memory dump 的方式，印出儲存組員學號與總和的記憶體區塊內容，並以螢幕截圖，貼在報告上並說明其起始與結束記憶體位址。

(e) 在 id.s 程式的第 6 道實體指令須為一道一定要執行的指令：adds lr, pc, r0。
### MAIN 函數功能說明：

(1) 功能：
    整合前述兩個函數的功能，除了各函數原始的功能外，最後印出整合組別、學號、姓名、與總和的完整資料。

(2) 程式設計：

(a) 在 MAIN 中呼叫 NAME 與 ID 函數，分別達成前兩支函數的分項功能。

(b) 應用 NAME 與 ID 函數所記錄的資料，輸出完整的組別、組員資訊、與組員學號數值計算結果。
    
(3) 預期輸出結果範例：假設第 1 組組員有(1) Peter Huang、(2) Mary Sue、(3) Tom Smith，且輸入的學號分別是(1) 10027001、(2) 10027002、(3) 10027003。

    ```
    Function1: Name
    *****Print Name*****
    Team 01
    Peter Huang
    Mary Sue
    4
    Tom Smith
    *****End Print*****
    Function2: ID
    **** *Input ID*****
    **Please Enter Member 1 ID:**
    10027001
    ** Please Enter Member 2 ID:**
    10027002
    ** Please Enter Member 3 ID:**
    10027003
    ** Please Enter Command **
    p
    *****Print Team Member ID and ID Summation*****
    10027001
    10027002
    10027003
    ID Summation = 30081006
    *****End Print*****
    Main Function:
    *****Print All*****
    Team 01
    10027001 Peter Huang
    10027002 Mary Sue
    10027003 Tom Smith
    ID Summation = 30081006
    *****End Print*****
    ```
### (4) 程式要求：

(a) 所有程式須以 ARM Assembly 完成，並可順利執行。
    
(b) 需設計一個主程式 MAIN，呼叫前述 NAME 與 ID 兩個函數。主程式需以函數呼叫完成，請勿將前述函數之程式碼直接複製至主程式。
    
(c) 在 MAIN 中呼叫 NAME 與 ID 函數，分別達成前兩支函數的分項功能。
    
(d) 在 MAIN 中使用 NAME 與 ID 所記錄的資料，輸出完整的組別、組員姓名、與組員學號數值計算結果。
    
(e) 報告除了程式說明外，需以 Code::Block 中，Debug 功能的顯示 Memory dump 與 CPU Register 的方式，印出 NAME 與 ID 函數的所在位址與返回位址(Return Address)，並以螢幕截圖，貼在報告上並說明前述記憶體位址與其內容。

4. 設計注意事項： 
(1) 程式需包含前述之「Project 基本要求」。並於報告中完整說明符合基本要求之指令與功能。
(2) 程式需分檔案，一個 Function 一個檔案，並以 Function 名稱命名，所有程式不可寫在同一 Function 裡。
(3) 程式須以 ARM Assembly 設計完成，並在包含 ARM 處理器之電腦環境中驗證執行。
請完整理解所有指令之功能。助教機測將詢問指令功能與作用。無法通過測試者，依
通過之功能部份給分。