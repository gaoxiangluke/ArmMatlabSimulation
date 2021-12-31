function eec = L5forward_group7(jc)
 d1 = 8.1;
 a2 = 12;
 a3 = 12.2;
 d5 = 9;

A1 = DHConvention(jc(1),pi/2,0,d1);
A2 = DHConvention(jc(2),0,a2,0);
A3 = DHConvention(jc(3),0,a3,0);
A4 = DHConvention(jc(4),pi/2,0,0);
A5 = DHConvention(jc(5),0,0,d5);


T = A1*A2*A3*A4*A5;
eec = [T(1,4),T(2,4),T(3,4),jc(5),jc(2)+jc(3)+jc(4)];
end