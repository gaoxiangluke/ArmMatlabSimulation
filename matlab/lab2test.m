s = serial('COM18','BaudRate',38400);
fclose(instrfind);
jc = [pi/2,pi/3,0,pi/3,pi/6];
GP = 1.5;

fopen(s);
A = [-555,511,556,521,537,-373];
B = [1370,510,494,706,1484,2425];
%caclulation
Pw = [round(A(1)*jc(1))+B(1)
    round(A(2)*jc(2))+B(2)
    round(A(3)*jc(3))+B(3)
    round(A(4)*jc(4))+B(4)
    round(A(5)*jc(5))+B(5)
    round(A(6)*GP)+B(6)
    ]
Message0 = ['#0p',num2str(Pw(1)),13]
Message1 = ['#1p',num2str(Pw(2)),13]
Message2 = ['#2p',num2str(Pw(3)),13]
Message3 = ['#3p',num2str(Pw(4)),13]
Message4 = ['#4p',num2str(Pw(5)),13]
Message5 = ['#5p',num2str(Pw(6)),13]
fwrite(s,Message0) 
fwrite(s,Message1)
fwrite(s,Message2)
fwrite(s,Message3)
fwrite(s,Message4)
fwrite(s,Message5)