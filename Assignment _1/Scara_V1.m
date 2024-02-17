disp('SCARA_V1')

syms a1 a2 a3 a4 

%% Link lengths

a1 = 10;
a2 = 3;
a3 = 3;
a4 = 3;

%% Joint Variables

d1 = 7;

%% D-H Parameters [theta, d, r, alpha, offset]
% if prismatic joint: theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0, after offset put the value of theta

H1 = Link([0,0,0,0,1,a1]);
H1.qlim = [0 d1];

H2 = Link([0,0,a2,0,0]);
H2.qlim = [0 0];

H3 = Link([0,0,a3,0,0]);
H3.qlim = [-pi/2 pi/2];

H4 = Link([0,0,a4,0,0]);
H4.qlim = [-pi/2 pi/2];

SCARA_1 = SerialLink([H1 H2 H3 H4], 'name', 'SPRR');
SCARA_1.plot([0 0 0 0], 'workspace', [-5 20 -10 10 -5 20 -20 20])
SCARA_1.teach
