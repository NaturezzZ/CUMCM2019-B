syms t1 t2 v0 v1 v2 a;
e = 0.7;
m = 0.27;
M = 3.6;
h = 0.4;
g = 9.8;
e1 = e*(v0 + v2 + a*t2) + v1 - v0;
e2 = 2*m*v0 + M*v1 - M*(v2 + a*t2);
e3 = 2*v0/g - t1 -t2;
e4 = (v0-v1)*t1 + (v0-v1)^2/(2*(g+a)) - h;
e5 = v1*(t1+t2) + (1/2) * a * t2^2 - 0.5 * g * t1^2 -g*t1*t2;
e6 = v1 - g*t1 -v2;
[t10, t20, v00, v10, v20, a0] = solve(e1,e2,e3,e4,e5,e6,t1,t2,v0,v1,v2,a);
T0 = t10(1,1) + t20(1,1);
double([t10, t20, v00, v10, v20, a0])
yd1f = v10(1,1)*t10 - 0.5*g*t10(1,1)*t10(1,1);
double(yd1f)