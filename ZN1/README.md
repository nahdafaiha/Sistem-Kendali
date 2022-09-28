Mendeklarasikan variable yang akan digunakan 
         J = 0.01;
          b = 0.1;
          K = 0.01
          R = 1;
          L = 0.5;
          s = tf('s');

Mendeklarasikan sistem yang akan digunakan
         num = K;
         den = [J*L,((b*L)+(J*R)),((b*R)+(K*K))];
         sys = tf(num,den)/s

Mendeklarasikan tunning variable
            use_p = 1;
            use_i = 1;
            use_d = 1;

Mendeklarasikan time delay dan time constant
         delay_t = 1;
         constant_t = 10;



Proses tunning ZN untuk mendapatkan nilai KI,KP,KD 
        if(use_p)
            if(use_i)
                if(use_d)
                     %%PID
                    kp = constant_t/delay_t*1.2;
                    Ti = delay_t*2;
                    Td = 0.5*delay_t;
                else
                %%PI
                kp = constant_t/delay_t*0.9;
                Ti = delay_t/0.3;
                Td = 0
                end
            else 
                %%P
                kp = delay_t/constant_t;
                Ti = inf;
                 Td = 0
            end
        end



Kemudian membuat fungsi sistem kontrol berdasarkan KP dan KD yanng telah ditentukan dan juga fungsi feedback 
            sys_c = tf([kd,kp,ki],[1 0])
            complate = feedback(sys*sys_c,1)

Untuk menampilkan grafik fungsi untuk melihat respon sistem

        figure(1)
        step(complate); 
        legend('step kd(1)')
        stepinfo(complate)