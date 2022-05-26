function code = bianmay()
S=junyunlianghua(16);
close all ;
z=sign(S);
MaxS=max(abs(S));
S=abs(S/MaxS);
Q=16*S;
code=zeros(length(S),4);


N=[0 0 0;0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1];
a=[0,2,4,6,8,10,12,14,16];

for i=1:length(S)
    for j =1:8
        if (Q(i)>=a(j)) && (Q(i)<=a(j+1))
            code(i,(2:4)) = N(j,:);
        end
    end
    if z(i)>0
        code(i,1)=1;
    elseif z(i)<0
        code(i,1)=0;
    end
end

code_value = (length(S)-1)*4*1;
disp(code_value);

    