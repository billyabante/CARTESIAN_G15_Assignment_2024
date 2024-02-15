disp('SCARA_V2')

syms a1 a2 a3 a4 a5

%% Link lengths

a1 = 10;
a2 = 10;
a3 = 5;
a4 = 5;
a5 = 5;

%% D-H Parameters [theta, d, r, alpha, offset]

H1 = Link([0,a1,a3,0,1,a2]);
H1.qlim = [0 5];

H2 = Link([0,0,a4,0,0]);
H2.qlim = [-pi/2 pi/2];

H3 = Link([0,0,a5,0,0]);
H3.qlim = [-pi/2 pi/2];

SCARA_2 = SerialLink([H1 H2 H3], 'name', 'SCARA_V2');

SCARA_2.plot([0 0 0], 'workspace', [-5 25 -20 20 0 20 -20 20])

SCARA_2.teach

