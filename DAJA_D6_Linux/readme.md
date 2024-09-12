My colleague lend me his Daja laser engraver. To my surprise, there is no App Downloads on the manufactureres site. Also the Android app is not existent anymore on the Google Play store. In a YouTube comment, the manufacturer wrote to use the "engraver" App. But this did not work. Also the iPad App did not work via Wifi direct. Gladly my colleague had a folder with the Mac and Windows Installation files. Since the App on Windows is Java based, it can also run on Linux. I found a walkthrough on the web which had all information needed. I will link to that article. Here is a rundown ho to set it up. Also i uploaded the need files for archiving purposes.
<br>
<br>
I tested it on Manjaro Linux -> <br>
Prerequsistes: <br>
Java JDK (probably Java JRE schould also work) <br>
I did not test OpenJDK <br>
sudo usermod -a -G dialout <your_username> <br>
if no dialout group exists <br>
or sudo usermod -a -G uucp <your_username> <br>
or sudo usermod -a -G lock <your_username> <br>
or sudo usermod -a -G tty <your_username> <br>
<br>
<br>
To run the DAJA engraver app you need to type: <br>
java -jar diao.jar <br>
<br>
<br>
Source: <br>
https://www.summet.com/blog/2022/02/26/using-the-daja-dj6-laser-engraver-under-ubuntu-linux/
<br>
<br>
Archive: <br>
https://github.com/jayp76/docs/raw/main/DAJA_D6_Linux/DAJA_DJ6_Linux.zip

