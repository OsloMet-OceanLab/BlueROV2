clear
clc
close all

e1 = [1 0 0]';                    %Body frame unit vector along x
e2 = [0 1 0]';                    %Body frame unit vector along y
e3 = [0 0 1]';                    %Body frame unit vector along z

I3 = eye(3);                      %Identity matrix (3x3)

%% Masses

m_t = 11.5;                      %BlueROV mass [Kg]
W = 112.8;                       %Weight [N]
B = 114.8;                       %Boyancy [N]
r_cb = [0 0 0]';                 %Center of boyancy wrt. center of origin [m]
r_cg = [0 0 0.02]';              %Center of gravity wrt. center of origin [m]

I = diag([0.16 0.16 0.16]);       %Dyadyic inertia


%% Added mass (hydrodynamic derivatives)

X_udot = -5.5;   % [kg] 
Y_vdot = -12.7;  % [kg]
Z_wdot = -14.57; % [kg]
K_pdot = -0.12;  % [kg m^2/rad]
M_qdot = -0.12;  % [kg m^2/rad]
N_rdot = -0.12;  % [kg m^2/rad]
   
%% Hydrodynamic linear and quadratic damping coefficients

Xu = -4.03;      % [Ns/m]
Yv = -6.22;      % [Ns/m]
Zw = -5.18;      % [Ns/m]
Kp = -0.07;      % [Ns/rad]
Mq = -0.07;      % [Ns/rad]
Nr = -0.07;      % [Ns/rad]

Xuu = -18.18;    % [Ns^2/m^2]
Yvv = -21.66;    % [Ns^2/m^2]
Zww = -36.99;    % [Ns^2/m^2]
Kpp = -1.55;     % [Ns^2/rad^2]
Mqq = -1.55;     % [Ns^2/rad^2]
Nrr = -1.55;     % [Ns^2/rad^2]


%% Thruster configuration matrix
tau_k = [0.707 0.707 -0.707 -0.707 0 0 0 0;
        -0.707 0.707 -0.707 0.707 0 0 0 0;
         0 0 0 0 -1 1 1 -1;
         0.06 -0.06 0.06 -0.06 -0.218 -0.218 0.218 0.218;
         0.06 0.06 -0.06 -0.06 0.120 -0.120 0.120 -0.120;
         -0.1888 0.1888 0.1888 -0.1888 0 0 0 0];
     
     

