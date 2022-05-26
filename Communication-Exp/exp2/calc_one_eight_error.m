y = R.*record;
yy = R./Y.*record;
yy(isnan(yy)) = 0;
x=0:1/8000:1;
disp(sum(abs(y),2)./sum(record,2));
disp(sum(abs(yy),2)./sum(record,2));
for i=1:3
    subplot(3,1,i);
    plot(x,y(i,:));
    axis([0 0.01 -250 250]);
end