function Vout = RotateGlobal(v,angleX,angleY,angleZ)
R = [cos(angleZ)*cos(angleY),-sin(angleZ)*cos(angleX) + cos(angleZ)*sin(angleY)*sin(angleX),sin(angleZ)*sin(angleX) + cos(angleZ)*sin(angleY)*cos(angleX)
    sin(angleZ)*cos(angleY),cos(angleZ)*cos(angleX) + sin(angleZ)*sin(angleY)*sin(angleX),-cos(angleZ)*sin(angleX) + sin(angleZ)*sin(angleY)*cos(angleX)
    -sin(angleY),cos(angleY)*sin(angleX),cos(angleY)*cos(angleX)];
v =  transpose(v);
v = R*v;
v = transpose(v);
Vout = v(:,1:3);
end
