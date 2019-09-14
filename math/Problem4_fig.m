r = 10;
a = [];
b = [];
a(1,1) = 100;
b(1,1) = 100;
theta = 0;
for i = 2:11
    a(1,i) = a(1,i-1) + r*cos(theta);
    b(1,i) = b(1,i-1) - r*sin(theta);
    theta = theta + pi/5;
end
theta = theta - 2*pi/5;
m = 0.895;
a1 = [a(1,9) + 0.5*r*cos(theta), a(1,9) + 0.5*r*cos(theta) + m*r*cos(theta + pi/5)];
b1 = [b(1,9) - 0.5*r*sin(theta), b(1,9) - 0.5*r*sin(theta) - m*r*sin(theta + pi/5)];
c = [100-40*sin(24/360 * 2*pi), 100+20*sin(24/360 * 2*pi)];
d = [100-40*cos(24/360 * 2*pi), 100+20*cos(24/360 * 2*pi)];
[a1;b1];
plot(a,b,'-*b',c,d,'-or', a1,b1,'-*b')

