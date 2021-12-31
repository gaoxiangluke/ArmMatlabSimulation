function jc = L5inverse_group7(eec)
d1 = 8.1;
a2 = 12;
a3 = 12.2;
d5 = 9;
%% Caclualte orientation 
x = eec(1);
y = eec(2);
z = eec(3);
psi = eec(4);
phi = eec(5);
% Calculate Theta1
 theta1 = atan2(y,x);
%Calculate R5
R5 = rotate(theta1,pi/2)*rotate(phi,pi/2)*rotate(psi,0);
% Calculate Pc

Pc = [x;y;z] - d5*R5*[0;0;1];
px = Pc(1);
py = Pc(2);
pz = Pc(3);



% Calculate Theta3 (choose + )
D = (px^2 + py^2 + (pz-d1)^2 - a2^2 - a3^2)/(2*a2*a3);
theta3 = atan2(-sqrt(1-(D^2)),D);

% Calculate Theta2
theta2 = atan2(pz-d1,sqrt(px^2 + py^2)) - atan2(a3*sin(theta3),a2+a3*cos(theta3));

%% Caculate Wrist angle
A1 = DHConvention(theta1,pi/2,0,d1);
A2 = DHConvention(theta2,0,a2,0);
A3 = DHConvention(theta3,0,a3,0);

A03 = A1*A2*A3;
R03 = A03(1:3,1:3);
R35 = transpose(R03)*R5;
%caculate theta5
theta5 = atan2(R35(3,1),R35(3,2));%suppose c5 != +- 1
%caculate theta4
theta4 = atan2(R35(1,3),-R35(2,3));

%combine result
jc =[theta1,theta2,theta3,theta4,theta5];

    

end
