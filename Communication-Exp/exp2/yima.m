function P=yima()
code=pcmbianma(512);
t=0:1/8000:1;
y=512*cos(900*pi*t);

A=[0 0 0;0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1];
B=[0,16,32,64,128,256,512,1024,2048];
C=[0 0 0 0; 0 0 0 1; 0 0 1 0; 0 0 1 1; 0 1 0 0 ;0 1 0 1;0 1 1 0; 0 1 1 1;
    1 0 0 0; 1 0 0 1; 1 0 1 0; 1 0 1 1; 1 1 0 0 ;1 1 0 1;1 1 1 0; 1 1 1 1 ];
D=[1,1,2,4,8,16,32,64];
P=zeros(1,length(code));

for i =1:size(code,1)
    disp(i/length(code));
    for j =1:8
        if (code(i,(2:4))) == A(j,:)
            P(i) = B(j);
        for k =1:16
            if (code(i,(5:8)) == C(k,:))
                P(i)=P(i)+D(j)*(k-1);
            end
        end
        end
    end
    if (code(i,1) == 0)
        P(i)=0-P(i);
    end
end
subplot(2,1,1);
P=P*512/2048;
plot(t,y,'r');
hold on ;
stairs(t,P,'k');
axis([0 0.01 -1024 1024]);
title('tP')
    
R=P-y;
subplot(2,1,2);
plot(t,R,'b');
axis([0 0.01 -512 512]);
title('tR')




        