disp('Spherical_1')
syms a1 a2 a3 

%% Link lengths
a1 = 10;
a2 = 5;
a3 = 2;

%% D-H Parameters [theta, d, r, alpha, offset]
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,a1,0,pi/2,0,0]);
H0_1.qlim = pi/180*[-180 180];

H1_2 = Link([0,0,a2,pi/2,0,pi/2]);
H1_2.qlim = pi/180*[-90 90];

H2_3 = Link([0,0,0,0,1,a3]);
H2_3.qlim = [0 5];

Spherical_1 = SerialLink([H0_1 H1_2 H2_3], 'name', 'Spherical_1')
Spherical_1.plot([0 0 0], 'workspace', [-8 15 -15 15 0 20])
Spherical_1.teach

%% Forward Kinemtics
%syntax: FK = robot_variable.fkine(joint_variables)

Af = ([5,pi/2,pi/2]); %joint_variables FK = Spherical_Manipulator_Modern_Variant.fkine(Af)
