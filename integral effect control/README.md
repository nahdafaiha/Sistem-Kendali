mendeklarasikan variable variable yang dibutuhkan dalam integral effect control, seperti T, sys(fungsi transfer), Kp, Ki untuk mencari gain dalam fungsi feedback. 
    s = tf('s')
    T = 1;

    num = 1;
    den = [T T/16 1];

    Kp = 1;
    Ki = 9;

    sys = tf(num, den);

Didapatkan fungsi gain = (Kps + Ki)/s
Kp Ki merupakan pembilang sedangkan  s dapat dituliskan 1,0 dikarenakan merupakan orde q 

    sys_c = tf([Kp, Ki], [1, 0]);

Kemudian fungsi feedback didapatkan dari perhitungan fungsi transfer dikaliakan gain. 

    fungsi = feedback(sys*sys_c, 1);

Untuk menganalisis respon dari input ramp, impulse, dan step dapat menggunakan fungsi dibawah ini:

    figure
    subplot(311), step(fungsi*s);   % Impulse reponse
    stepinfo(fungsi*s)
    subplot(312), step(fungsi);      % Step Response
    stepinfo(fungsi)
    subplot(313), step(fungsi / s);  % Ramp response 
    stepinfo(fungsi/s)

Berikut merupakan respon dengan menggunakan kp = 1 dan Ki = 1
[alt text](ki1.png)

Berikut merupakan respon dengan menggunakan kp = 1 dan Ki = 3
[alt text](ki3.png)

Berikut merupakan respon dengan menggunakan kp = 1 dan Ki = 5
[alt text](ki5.png)

Berikut merupakan respon dengan menggunakan kp = 1 dan Ki = 7
[alt text](ki7.png)

Berikut merupakan respon dengan menggunakan kp = 1 dan Ki = 9
[alt text](ki9.png)

Berikut merupakan analysis dari respon diatas
[alt text](analysis.png)