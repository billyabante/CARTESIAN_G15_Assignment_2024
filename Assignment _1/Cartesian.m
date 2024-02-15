disp('CARTESIAN CEILING')

syms a1 a2 a3 a4 d1 d2 d3

%% Link lengths
a1 = 2;
a2 = 3;
a3 = 3;
a4 = 1;
%% Joint Variables
d1 = 3;
d2 = 3;
d3 = 5;
%% D-H Parameters [theta, d, r, alpha, offset]

H1 = Link([0,0,0,pi/2,1,-a1]);
H1.qlim = [0 0];

H2 = Link([pi/2,0,0,pi/2,1,a2]);
H2.qlim = [0 d1]

H3 = Link([3*pi/2,0,0,pi/2,1,a3]);
H3.qlim = [0 d2];

H4 = Link([0,0,0,0,1,a4]);
H4.qlim = [0 d3];

CARTESIAN = SerialLink([H1 H2 H3 H4], 'name', 'CARTESIAN CEILING');
CARTESIAN.plot([0 0 0 0], 'workspace', [-2 10 -10 0 -10 1 -10 3])
CARTESIAN.teach
