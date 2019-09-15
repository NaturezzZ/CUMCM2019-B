% 以对称轴为y轴，则各个力位于(4i/pi + bias)的位置
F = [80,80,80,80,80,80,80,80];
activate = [0,1,0,0,1,0,0,0];
bias = -3*pi/8;
theta = [];
I = 0.0865;
for i = 1:8
    theta(1,i) = pi*i/4 +bias;
end
alpha = 0.11/1.7;
delta = 0;
omega = 0;
% first period
for i = 1:10000
    M = [0,0,0];
    for j = 1:8
        r = [0.2*sin(theta(1,j))*cos(delta), 0.2*cos(theta(1,j)),-0.2*sin(theta(1,j))*sin(delta)];
        Fj = [F(1,j)*sin(theta(1,j))*cos(alpha), F(1,j)*cos(theta(1,j))*cos(alpha), F(1,j)*sin(alpha)];
        if activate(1,j)==1
            M = M + cross(r,Fj);   
        end
    end
    delta = delta + omega* 0.1/10000;
    omega = omega + M(1,2)/I * 0.1/10000;
end
%second period
for i = 1:(10000)
    M = [0,0,0];
    for j = 1:8
        r = [0.2*sin(theta(1,j))*cos(delta), 0.2*cos(theta(1,j)),-0.2*sin(theta(1,j))*sin(delta)];
        Fj = [F(1,j)*sin(theta(1,j))*cos(alpha), F(1,j)*cos(theta(1,j))*cos(alpha), F(1,j)*sin(alpha)];
        % r
        % Fj
        M = M + cross(r,Fj); 
    end
    delta = delta + omega* 0.1/10000;
    omega = omega + M(1,2)/I * 0.1/10000;
end
omega
delta