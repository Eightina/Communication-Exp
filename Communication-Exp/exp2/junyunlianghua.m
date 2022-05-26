function S = junyunlianghua(n)

[t,y] = chouyang([32]);
y = 1024*y;
le = length(n);

for m = 1:le
    subplot(le,1,m);
    a=-1024:2048/n(m):1024;
    S=zeros(1,length(t));

    for i = 1:length(t)
        for j = 1:n(m)
            if (y(i) >=a(j) && y(i) <=a(j+1))
                S(i) = (a(j)+a(j+1))/2;
            end
        end
    end
    T = S - y;
    %stem(t,S,'b','filled')
    scatter(t,y,4,'r')
    hold on ;
    plot(t,T,'b')
    hold on ;
    stairs(t,S,'k');
    axis([0 1 -1024 1024]);
end    
