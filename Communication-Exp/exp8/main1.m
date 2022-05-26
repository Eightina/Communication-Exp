

close all;
clear all;
clc

k=input('采样点数N=2^k，请输入k的值，默认为14');
if isempty(k)
    k=14;
end

L=input('请输入每码元的采样数，要求必须为2的阶乘，默认为64');
if isempty(L)
    L=64;
end
pwm_1=50;
pwm_2=100;
Rb_1=1;
Rb_2=2;
M=2^k/L;
S=round(rand(1,M)); 

[brz,brz_EP,t,f]=brz_trans(k,L,Rb_1,pwm_1,S);
figure(1);
subplot(3,1,2);
plot(t,brz);  
axis([-10,10,min(brz)-0.1,max(brz)+0.1]);
title('双极性归零码(Rb=1,占空比=0.5)');
xlabel('t(ms)');
ylabel('rz(t)');
subplot(3,1,3);
PB=30+10*log10(brz_EP+eps); 
plot(f,PB) ;
title('双极性归零码功率谱密度图(Rb=1，占空比=0.5)');
xlabel('f(kHz)');
ylabel('P(f)');

figure(2);
[brz,brz_EP,t,f]=brz_trans(k,L,Rb_2,pwm_1,S);
subplot(3,1,2);
plot(t,brz);  
axis([-10,10,min(brz)-0.1,max(brz)+0.1]);
title('双极性归零码(Rb=2,占空比=0.5)');
xlabel('t(ms)');
ylabel('rz(t)');
subplot(3,1,3);
PB=30+10*log10(brz_EP+eps); 
plot(f,PB) ;
title('双极性归零码功率谱密度图(Rb=2，占空比=0.5)');
xlabel('f(kHz)');
ylabel('P(f)');

figure(3);
[brz,brz_EP,t,f]=brz_trans(k,L,Rb_1,pwm_2,S);
subplot(3,1,2);
plot(t,brz);
axis([-10,10,min(brz)-0.1,max(brz)+0.1]);
title('双极性归零码(Rb=1,占空比=1)');
xlabel('t(ms)');
ylabel('rz(t)');
subplot(3,1,3);
PB=30+10+log10(brz_EP+eps); 
plot(f,PB);  
title('双极性归零码功率谱密度图(Rb=1,占空比=1)');

figure(4);
[brz,brz_EP,t,f]=brz_trans(k,L,Rb_2,pwm_2,S);
subplot(3,1,2);
plot(t,brz);
axis([-10,10,min(brz)-0.1,max(brz)+0.1]);
title('双极性归零码(Rb=2,占空比=1)');
xlabel('t(ms)');
ylabel('rz(t)');
subplot(3,1,3);
PB=30+10+log10(brz_EP+eps); 
plot(f,PB);  
title('双极性归零码功率谱密度图(Rb=2,占空比=1)');