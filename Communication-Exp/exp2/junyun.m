function S = junyun(n,dt,yx)
t=0:1/dt:1;
y=feval(yx,t);
%1024*cos(2000*pi*t);
a=min(y):(max(y)-min(y))/n:max(y);
S=zeros(1,dt+1);
for i = 1:dt+1