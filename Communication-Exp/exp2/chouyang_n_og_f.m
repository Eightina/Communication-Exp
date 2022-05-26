function [t,y] = chouyang_n_og_f(m)
l = length(m);

for i = 1:l
    f = m(i);
    t=0:1/10:1;
    t0=0:1/1000:1;
    y=cos((2*pi)/(1/f)*t);
    y0=cos((2*pi)/(1/f)*t0);

    subplot(l,1,i);
    stem(t,y,'b','filled');
    hold on;
    plot(t0,y0)
end





%axis([0 0.1 -1 1]);
