% 主要思想是，在鼓上升的过程中，减小鼓的倾斜角
% 以对称轴为y轴，则各个力位于(4i/pi + bias)的位置
F = [80,80,80,80,80,80,80,80];
activate = [0,0,0,0,0,0,0,0];
bias = 0;
theta = [];
I = 0.0865;
for i = 1:8
    theta(1,i) = pi*i/4 +bias;
end
alpha = 0.14/1.7;
delta = 0;
omega = 0;
% period 1
for i = 1:10000
    M = [0,0,0];
    for j = 1:8
        r = [0.2*sin(theta(1,j))*cos(delta), 0.2*cos(theta(1,j))*cos(delta),0.2*sin(delta)];
        Fj = [F(1,j)*sin(theta(1,j))*cos(alpha), F(1,j)*cos(theta(1,j))*cos(alpha), F(1,j)*sin(alpha)];
        % r
        % Fj
        if activate(1,j)==1
            M = M + cross(r,Fj);   
        end
    end
    delta = delta + omega* 0.1/10000;
    omega = omega + M(1,2)/I * 0.1/10000;
end
"period 1"
["omega","delta";omega,delta]
% period 2
for i = 1:(10000)
    M = [0,0,0];
    for j = 1:8
        r = [0.2*sin(theta(1,j))*cos(delta), 0.2*cos(theta(1,j))*cos(delta),0.2*sin(delta)];
        Fj = [F(1,j)*sin(theta(1,j))*cos(alpha), F(1,j)*cos(theta(1,j))*cos(alpha), F(1,j)*sin(alpha)];
        % r
        % Fj
        M = M + cross(r,Fj); 
    end
    %M
    % ;
    delta = delta + omega* 0.1/10000;
    omega = omega + M(1,2)/I * 0.1/10000;
    
    %omega
    %break;
end
"period 2"
["omega","delta";omega,delta]

% he noticed he was early and dimished his force
F_backup = F;
for i = 1:8
    if activate(1,i) ==1
        F(1,i) = 1.5*F(1,i);
    end
end
% period 3
for i = 1:(10000)
    M = [0,0,0];
    for j = 1:8
        r = [0.2*sin(theta(1,j))*cos(delta), 0.2*cos(theta(1,j))*cos(delta),0.2*sin(delta)];
        Fj = [F(1,j)*sin(theta(1,j))*cos(alpha), F(1,j)*cos(theta(1,j))*cos(alpha), F(1,j)*sin(alpha)];
        M = M + cross(r,Fj); 
        %r
        %Fj
        %cross(r,Fj)
    end
    delta = delta + omega* 0.1/10000;
    omega = omega + M(1,2)/I * 0.1/10000;
end
"period 3"
["omega","delta";omega,delta]

% period 4
F = F_backup;
for i = 1:(20000)
    M = [0,0,0];
    for j = 1:8
        r = [0.2*sin(theta(1,j))*cos(delta), 0.2*cos(theta(1,j))*cos(delta),0.2*sin(delta)];
        Fj = [F(1,j)*sin(theta(1,j))*cos(alpha), F(1,j)*cos(theta(1,j))*cos(alpha), F(1,j)*sin(alpha)];
        M = M + cross(r,Fj); 
    end
    delta = delta + omega* 0.1/10000;
    omega = omega + M(1,2)/I * 0.1/10000;
end
"period 4"
["omega","delta";omega,delta]
