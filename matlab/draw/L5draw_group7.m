function L5draw_group7(jc,grip)
 close;
% Import an STL mesh, returning a PATCH-compatible face-vertex structure
load('robotParts.mat');


%DH Conevntion
sf = 0.103;
d1 = 80*sf;
a2 = 110*sf;
a3 = 140*sf;
d5 = 120;
A1 = DHConvention(jc(1),pi/2,0,d1);
A2 = DHConvention(jc(2),0,a2,0); 
A3 = DHConvention(-jc(3),0,a3,0);

A4 = DHConvention(jc(4),pi/2,0,0);
A5 = DHConvention(jc(5),0,0,d5);
DH1 = A1;
DH2 = A1*A2;
DH3 = A1*A2*A3;
DH4 = A1*A2*A3*A4;
DH5 = A1*A2*A3*A4*A5;

% Base 
v_Wooden_base = ScaleV (v_Wooden_base,sf);
v_Wooden_base = translateXYZ(v_Wooden_base,0,60*sf,0);

v_Electronics_Plate = ScaleV (v_Electronics_Plate,sf);
v_Electronics_Plate = translateXYZ(v_Electronics_Plate,0,88*sf,20*sf);

v_Motherboard = ScaleV (v_Motherboard,sf);
v_Motherboard = translateXYZ(v_Motherboard,0,88*sf,22*sf);
v_Motherboard = RotateGlobal(v_Motherboard,0,0,pi/2);
v_Electronics_Plate = RotateGlobal(v_Electronics_Plate,0,0,pi/2);
v_Wooden_base = RotateGlobal(v_Wooden_base,0,0,pi/2);

v_base = ScaleV (v_base,sf);
v_base = translateXYZ(v_base,0,0,20*sf);
% First Rotate Part
v_Rotating_Top = ScaleV (v_Rotating_Top,sf);
v_Rotating_Top = translateXYZ(v_Rotating_Top,0,0,-18*sf);
v_Rotating_Top = RotateGlobal(v_Rotating_Top,-pi/2,0,0);
v_Rotating_Top = Vtransfrom3d(v_Rotating_Top,DH1);
v_Rotating_Top = RotateGlobal(v_Rotating_Top,0,0,pi/2);

v_Shoulder_Servo = ScaleV (v_Shoulder_Servo,sf);
v_Shoulder_Servo = translateXYZ(v_Shoulder_Servo,20*sf,0,30.5*sf-40*sf);
v_Shoulder_Servo = RotateGlobal(v_Shoulder_Servo,0,-pi/2,-pi/2);
v_Shoulder_Servo =  Vtransfrom3d(v_Shoulder_Servo,DH1);
v_Shoulder_Servo = RotateGlobal(v_Shoulder_Servo,0,0,-pi/2);

v_Shoulder_Plate = ScaleV (v_Shoulder_Plate,sf);
v_Shoulder_Plate =  translateXYZ(v_Shoulder_Plate,20*sf,10.8*sf,28*sf-40*sf);
v_Shoulder_Plate = RotateGlobal(v_Shoulder_Plate,0,-pi/2,-pi/2);
v_Shoulder_Plate =  Vtransfrom3d(v_Shoulder_Plate,DH1);
v_Shoulder_Plate = RotateGlobal(v_Shoulder_Plate,0,0,-pi/2);

%upper arm
v_Upper_Arm  = ScaleV (v_Upper_Arm ,sf);
v_Upper_Arm = translateXYZ(v_Upper_Arm,60*sf - a2,0,-35*sf);
% v_Upper_Arm = translateXYZ(v_Upper_Arm,60,0,-35);
   v_Upper_Arm = Vtransfrom3d(v_Upper_Arm,DH2);
  
 
%

v_Elbow_Servo  = ScaleV (v_Elbow_Servo ,sf);
v_Elbow_Servo = RotateGlobal(v_Elbow_Servo,0,pi,0);
v_Elbow_Servo = translateXYZ( v_Elbow_Servo,-60*sf -a3 ,-2.5*sf,20*sf);
  v_Elbow_Servo = Vtransfrom3d(v_Elbow_Servo,DH3);
 
%  Middle Arm
v_Middle_Arm_Linkage  = ScaleV (v_Middle_Arm_Linkage ,sf);
v_Middle_Arm_Linkage = translateXYZ(v_Middle_Arm_Linkage,-1*sf - a3,4.5*sf,-12*sf);
 v_Middle_Arm_Linkage = Vtransfrom3d(v_Middle_Arm_Linkage,DH3);

%Wrist
v_WristPitchAssem  = ScaleV (v_WristPitchAssem ,sf);
v_WristPitchAssem = translateXYZ(v_WristPitchAssem,54*sf - a3,-35*sf,-20*sf);
v_WristPitchAssem = Vtransfrom3d(v_WristPitchAssem,DH3);

v_WristRollAssem   = ScaleV (v_WristRollAssem  ,sf);
 v_WristRollAssem = RotateGlobal(v_WristRollAssem,-pi/2,-pi/2,0);
  v_WristRollAssem = translateXYZ(v_WristRollAssem,-15*sf,-25*sf,10*sf);
     v_WristRollAssem = Vtransfrom3d(v_WristRollAssem,DH4);

v_Handassem  = ScaleV (v_Handassem  ,sf);
  v_Handassem = RotateGlobal(v_Handassem,0,0,pi);
   v_Handassem = translateXYZ(v_Handassem,10*sf,7*sf,34*sf-d5);
  v_Handassem =  Vtransfrom3d(v_Handassem,DH5);

  v_Claw_L  = ScaleV (v_Claw_L  ,sf);
   v_Claw_L = translateXYZ(v_Claw_L,-5.5*sf - grip/2,3*sf,51*sf - d5);
  v_Claw_L = RotateGlobal(v_Claw_L,0,0,pi/2);
  v_Claw_L = Vtransfrom3d(v_Claw_L,DH5);
  
     v_Claw_R  = ScaleV (v_Claw_R  ,sf);
   v_Claw_R = translateXYZ(v_Claw_R,8.5*sf + grip/2,-2*sf,51*sf - d5);
   v_Claw_R = RotateGlobal(v_Claw_R,0,0,pi/2);
  v_Claw_R = Vtransfrom3d(v_Claw_R,DH5);
 
  
  
%% Render
% The model is rendered with a PATCH graphics object. We also add some
% dynamic 
% lighting, and adjust the material properties to change the specular
% highlighting.
% direction = [1,0,0];
% 
 p1=patch('Faces',f_Wooden_base,'Vertices',v_Wooden_base,'FaceColor',[182/255,155/255,76/255], ...
         'EdgeColor',       'none',        ...
          'FaceLighting',    'gouraud',     ...
          'AmbientStrength', 0.15);
p2=patch('Faces',f_base,'Vertices',v_base,'FaceColor','r', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
     p3=patch('Faces',f_Rotating_Top,'Vertices',v_Rotating_Top,'FaceColor','y', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
 p4=patch('Faces',f_Shoulder_Servo,'Vertices',v_Shoulder_Servo,'FaceColor','c', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'flat',     ...
         'AmbientStrength', 1);
     p5=patch('Faces',f_Shoulder_Plate,'Vertices',v_Shoulder_Plate,'FaceColor','k', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
    p6=patch('Faces',f_Electronics_Plate,'Vertices',v_Electronics_Plate,'FaceColor','k', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
    p7=patch('Faces',f_Motherboard,'Vertices',v_Motherboard,'FaceColor','g', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
       p8=patch('Faces',f_Upper_Arm,'Vertices',v_Upper_Arm,'FaceColor','k', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
       p9=patch('Faces',f_Elbow_Servo,'Vertices',v_Elbow_Servo,'FaceColor','c', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
    p10=patch('Faces',f_Middle_Arm_Linkage,'Vertices',v_Middle_Arm_Linkage,'FaceColor',[192/255,192/255,192/255], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
    p11=patch('Faces',f_WristPitchAssem,'Vertices',v_WristPitchAssem,'FaceColor','c', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
    p12 = patch('Faces',f_WristRollAssem,'Vertices',v_WristRollAssem,'FaceColor','k', ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
       p13 = patch('Faces',f_Handassem,'Vertices',v_Handassem,'FaceColor',[13/255,39/255,75/255], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
       p14 = patch('Faces',f_Claw_L,'Vertices',v_Claw_L,'FaceColor',[169/255,169/255,169/255], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
        p15 = patch('Faces',f_Claw_R,'Vertices',v_Claw_R,'FaceColor',[169/255,169/255,169/255], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
% Add a camera light, and tone down the specular highlighting
camlight('headlight');      
material('dull');
% Fix the axes scaling, and set a nice view angle
axis('image');
xlabel('this is x')
ylabel('this is y')
zlabel('this is z')
view([-60 27]);
end