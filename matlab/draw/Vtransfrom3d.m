%Vtransfrom3d this function caculate the vertices of a matrix object after
%transfrom
function Vout = Vtransfrom3d(v,DH)
 v =  transpose(v);
v(4,:) = 1;
v = DH*v;
v = transpose(v);
Vout = v(:,1:3);
end