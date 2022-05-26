function R=amps(Amps)
lenamp = length(Amps);
t=0:1/8000:1;
P=zeros(lenamp,length(t));
R=zeros(lenamp,length(t));
record=zeros(lenamp,length(t));

for cnt=1:lenamp
    code=pcmbianma(Amps(cnt));
    
    y=Amps(cnt)*cos(900*pi*t);

    A=[0 0 0;0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1];
    B=[0,16,32,64,128,256,512,1024,2048];
    C=[0 0 0 0; 0 0 0 1; 0 0 1 0; 0 0 1 1; 0 1 0 0 ;0 1 0 1;0 1 1 0; 0 1 1 1;
        1 0 0 0; 1 0 0 1; 1 0 1 0; 1 0 1 1; 1 1 0 0 ;1 1 0 1;1 1 1 0; 1 1 1 1 ];
    D=[1,1,2,4,8,16,32,64];

    for i =1:size(code,1)
        disp(i/length(code));
        for j =1:8
            if (code(i,(2:4))) == A(j,:)
                if j==1
                    record(cnt,i)=1;
                end
                P(cnt,i) = B(j);
                for k =1:16
                    if (code(i,(5:8)) == C(k,:))
                        P(cnt,i)=P(cnt,i)+D(j)*(k-1);
                    end
                end
            end
        end
        if (code(i,1) == 0)
            P(cnt, i)=0-P(cnt, i);
        end
    end
    
    P=P*Amps(cnt)/2048;
    R(cnt,:)=P(cnt,:)-y;

    subplot(3,1,cnt)
    scatter(t,R(cnt,:));
    axis([0 0.01 -512 512]);
    

end



        