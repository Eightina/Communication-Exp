
N=400;
fs=50;
Ts=1;%定义符号周期
dt=Ts/fs;%计算采样点间隔
t=0:dt:(N*fs-1)*dt;%定义仿真时间段
d=randi([0,1],1,N)*2-1;%定义符号波形
%在此d为一个1行400列的矩阵   1和-1交替




a_tmp=repmat(d,[fs,1]);
a=a_tmp(:);

n = length(a);
X = fft(a);
f = (0:n-1)*(fs/n); 
power = abs(X).^2/n; 
plot(f,power)
xlabel('f');
delay=20;
t_ht=-delay:dt:delay;
ht1=2.5*sinc(2.5*t_ht/Ts);
rt1=conv(a,ht1);
ht2=sinc(t_ht/Ts);
rt2=conv(a,ht2);
eyediagram(rt1+j*rt2,5*fs,3);
t=2^16;
HT1=fft(ht1,t);
HT2=fft(ht2,t);
f=[0:t-1]/t/dt;
figure;
subplot(2,1,1);
plot(f,abs(HT1));
title('滤波器1的频率响应')
grid on 
xlabel('f(Hz)');
axis([0 4 0 60]);
subplot(2,1,2);
plot(f,abs(HT2));
title('滤波器2的频率响应');
grid on;
xlabel('f(Hz)');
axis([0 4 0 60]);

