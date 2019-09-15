theta = 0.5/180 * pi;
g = 9.8;
h = 0.6;
I = 0.0865;
T = 2*sqrt(2*h/g);
syms t1 t2 a v1f y1f y2f v2f;
e1 = t1+t2+0.1-T;
e2 = v1f+g*t1;
e3 = y1f+0.5*g*t1^2;
e4 = y1f +v1f *t2+0.5*a*t2^2-y2f;
e5 = v2f-v1f-a*t2;
e6 = y2f + 0.1*v2f;
e7 = v2f -0.5;
[t10, t20, a0, v1f0, v2f0, y1f0, y2f0] = solve(e1,e2,e3,e4,e5,e6,e7,t1, t2, a, v1f, v2f, y1f, y2f);
eval([t10, t20, a0, v1f0, v2f0, y1f0, y2f0])