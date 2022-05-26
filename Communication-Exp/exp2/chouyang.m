function [t,y] = chouyang(m)
l = length(m);

for i = 1:l
    f = m(i);
    t=0:1/f:1;
    y=cos(2*pi*t);
    subplot(l,1,i);
    stem(t,y,'b','filled');
end





%axis([0 0.1 -1 1]);
