function Vout = translateXYZ(v,distanceX,distanceY,distanceZ)
[m,n] = size(v);
Vout = v;
for col = 1:m 
    Vout(col,1) = Vout(col,1) + distanceX;
    Vout(col,2) = Vout(col,2) + distanceY;
    Vout(col,3) = Vout(col,3) + distanceZ;
end 