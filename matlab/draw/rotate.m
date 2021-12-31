function result = rotate(Theta,Alpha)

 result = [cos(Theta),-sin(Theta)*cos(Alpha),sin(Theta)*sin(Alpha)
     sin(Theta),cos(Theta)*cos(Alpha),-cos(Theta)*sin(Alpha)
     0,sin(Alpha),cos(Alpha)];


end
