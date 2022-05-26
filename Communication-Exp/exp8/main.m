close all
clear all
clc

k = input('samples N=2^k, please input k, default 14');
if  isempty(k)
    k = 14;
end

L = input('samples num of each(2^), default=64');
if isempty(L)
    L = 64;
end

emp_rate_1 = 50;
emp_rate_2 = 100;

Rb_1 = 1;
Rb_2 = 2;

M = 2^k/L;
a = round(rand(1,M));
[rz, rz_EP, t, f] = rz_trans(k, L, Rb_1, emp_rate_1, a);
figure(1);
subplot(2,1,1);
plot(t,rz);
axis([-10, 10, min(rz)-0.1, max(rz)+0.1]);
title('uni polar(Rb=1, emp_rate=0.5)');
xlabel('t(ms)');
ylabel('rz(t)');
subplot(2,1,2);
PB = 30+10+log10(rz_EP+eps);
plot(f,PB);
title('unipolar power spectrum density map(Rb=1, emp_rate=0.5)');
xlabel('f(kHz)');
ylabel('P(f)');

[rz, rz_EP, t, f] = rz_trans(k, L, Rb_2, emp_rate_1, a);
figure(2);


[rz, rz_EP, t, f] = rz_trans(k, L, Rb_2, emp_rate_2, a);
figure(4);
subplot(2,1,1);
plot(t,rz);
axis([-10, 10, min(rz)-0.1, max(rz)+0.1]);
xlabel('t(ms)');
ylabel('rz(t)');
subplot(2,1,2);
PB = 30+10+log10(rz_EP+eps);
plot(f,PB);
title('unipolar power spectrum density map(Rb=2, emp_rate=1)');



