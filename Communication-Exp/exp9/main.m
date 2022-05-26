clear all;
clc;
N = 400;
fs = 50;
Ts = 1;
dt = Ts / fs;
t = 0:dt:(N*fs-1)*dt;
d = randi([0,1],1,N)*2-1;
a_tmp = repmat(d, [fs, 1]);
a = a_tmp(:);
delay = 20;
t_ht = -delay:dt:delay;
ht1 = 2.5*sinc(2.5*t_ht/Ts);

rt1 = conv(a, ht1);
ht2 = sinc(t_ht/Ts);
rt2 = conv(a, ht2);


eyediagram(rt1+j*rt2,5*fs,3);
t = 2^16;

HT0 = fft(a,t);
HT1 =fft(ht1,t);
HT2 =fft(ht2,t);
f = [0:t-1]/t/dt;
plot(f,abs(HT0));
figure;

subplot(2,1,1);
plot(f, abs(HT1));
title("滤波器1的频率响应");
grid on;
xlabel('f(Hz)');
axis([0 4 0 60]);
subplot(2,1,2);
plot(f,abs(HT2));
title('滤波器2的频率响应');
grid on;
xlabel('f(Hz)');
axis([0 4 0 60]);
