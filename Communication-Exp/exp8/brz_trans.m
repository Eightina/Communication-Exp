function[brz,brz_EP,t,f]=brz_trans(k,L,Rb,pwm,S)
N=2^k;
M=N/L;  
Ts=1/Rb;  
dt=Ts/L; 
T=N*dt;  
df=1.0/(N*dt); 
Bs=N*df/2; 
t=linspace(-T/2,T/2,N); 
f=linspace(-Bs,Bs,N);   
EP=zeros(size(f));
gt = [ones(1, pwm/100*L), zeros(1, (1-pwm/100)*L)];  

for x =1:20
    brz=[];
    for i =1:M
        if S(i)==1
            brz=[brz gt];
        else
            brz=[brz -1*gt];
        end
    end
   
    BRZ=t2f(brz,dt);
    P=BRZ.*conj(BRZ)/T;
    
    brz_EP=(EP*(x-1)+P)/x;
end

A=1; 
N=10^6; 
a=A*sign(randn(1,N));
Snr_A_sigma_dB=0:12;  
Snr_A_sigma=10.^(Snr_A_sigma_dB/20); 
sigma=A./Snr_A_sigma;
ber=zeros(size(sigma));

for n =1:length(sigma)
   rk=a+sigma(n)*randn(1,N);
   dec_a=sign(rk); 
   ber(n)=length(find(dec_a~=a))/N;
end
ber_Theory=1/2*erfc(sqrt(Snr_A_sigma.^2/2)); 
subplot(3,1,1)
semilogy(Snr_A_sigma_dB,ber,'b-',Snr_A_sigma_dB,ber_Theory,'k-*');

grid on  
xlabel('A/\sigma');
ylabel('ber');
legend('ber','ber\_Theory');
title('A/\sigma和误码率之间的性能曲线');


