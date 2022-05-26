function code = pcmbianma(Amp)

f = 8000;
t=0:1/f:1;
S=Amp*cos(2*pi*450*t);

close all;
    z=sign(S);
MaxS = max(abs(S));
S= abs(S/MaxS);
Q=2048*S;
code = zeros(length(S),8);

N= [0 0 0;0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1];
M= [0 0 0 0; 0 0 0 1; 0 0 1 0; 0 0 1 1; 0 1 0 0 ;0 1 0 1;0 1 1 0; 0 1 1 1;
    1 0 0 0; 1 0 0 1; 1 0 1 0; 1 0 1 1; 1 1 0 0 ;1 1 0 1;1 1 1 0; 1 1 1 1 ];
a=[0,16,32,64,128,256,512,1024,2048];

for i = 1:length(S)
    for j =1:8
        if (Q(i)>=a(j))&&(Q(i)<=a(j+1))
            code(i,(2:4)) = N(j,:);
            c=a(j):(a(j+1)-a(j))/16:a(j+1);
            for k =1:16
                if (Q(i)>=c(k) && Q(i)<= c(k+1))
                    code(i,(5:8)) = M(k,:);
                end
            end
        end
        
        %z(i) = sign(S(i));
        if z(i) >0
            code(i,1) = 1;
        elseif z(i) <0
            code(i,1) = 0; 
        end
    end
end

            