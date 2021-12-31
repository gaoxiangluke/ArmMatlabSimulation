%DHConvention this function caculate the DH convention for a 4*4 matrix
function DH = DHConvention(Theta,Alpha,A,D)
     DH = [cos(Theta),-sin(Theta)*cos(Alpha),sin(Theta)*sin(Alpha),A*cos(Theta)
     sin(Theta),cos(Theta)*cos(Alpha),-cos(Theta)*sin(Alpha),A*sin(Theta)
     0,sin(Alpha),cos(Alpha),D
          0,0,0,1];
      
end 