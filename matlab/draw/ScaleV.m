

function Vout = ScaleV(v,sf)
[m,n] = size(v);
Vout = v;
for col = 1:m 
    Vout(col,1) = Vout(col,1)*sf;
    Vout(col,2) = Vout(col,2)*sf;
    Vout(col,3) = Vout(col,3)*sf;
end 
end