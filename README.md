## 關於Twitcasting Timeline fixes
近期Twitcasting對M3U8協議進行了升級後，使用IDM、Minyami等下載工具下載的M3U8流再重新拼接成TS或MP4檔案後，會出現**時間軸顯示錯誤**。

如會出現以下詭異的情況
 - 在Windows檔案總管中會顯示16小時以上的時間
 - 在Potplayer中會顯示成十幾分鐘
 - 在VLC中會顯示59分59秒
 - 在FFMPEG中提取音軌只有1小時
 - ...

並且這直接導致無法使用播放器拖動功能。

## 作用
使用本bat能夠將TS、MP4檔恢復正常的時間，並且封裝為MP4檔案。
筆者作業系統為Windows，所以只編寫了Windows的版本，若您有需求請自行更改。

## 需要的程式&準備工作

 - [MKVToolNix – Matroska tools for Linux/Unix and Windows](https://mkvtoolnix.download/)
- [FFmpeg](https://ffmpeg.org/)

您需要將以上兩個程式所在的資料夾路徑加入到您 PATH 系統變數中，儘管並不準確，您可以在[此處](https://www.java.com/zh-TW/download/help/path_zh-tw.html)查閱到相關步驟。

若您不想將以上兩個程式所在的資料夾路徑加入到您 PATH 系統變數中，您可以編輯bat檔案，將兩個程式的完整路徑修改。

    mkvmerge --output "%patha%%%~na.mkv" --language 0:und --fix-bitstream-timing-information 0:1 --language 1:und "%%a" --track-order 0:0,0:1

修改為(此處mkvmerge的完整路徑為D:\path\mkvmerge.exe)

    D:\path\mkvmerge.exe --output "%patha%%%~na.mkv" --language 0:und --fix-bitstream-timing-information 0:1 --language 1:und "%%a" --track-order 0:0,0:1

同理您應當修改FFmpeg的路徑。

至此，直接將檔案拖入bat中，便會自動運行，等待完成後，便會得到一個時間軸正確，正常可拖動的檔案。

## Q&A
Q:請問出現出現以下情況怎麼辦

> F:\home\○.mkv: Invalid argument 找不到
> F:\home\○.mkv

A:這是因為名字中帶了空格導致的mkvmerge無法識別輸入檔案所致，可以先將檔案命名為簡單的數字，處理後再改回。
