
% Definir parámetros numéricos
clear
clc
tic
vp = 170;    % Valor de vp
W = 2 * pi * 60;  % Frecuencia en rad/s (60 Hz)

R = 10;      % Valor de R (resistencia)
E = 50;       % Valor de E
L = 0.01;    % Valor de L (inductancia)
z = sqrt(R^2 + (W*L)^2);  % Impedancia total (Z)
m = E / vp;   % Relación de E y vp
phi = atan(W*L / R);  % Ángulo phi derivado de R, L y W
IminDeseado=0.001;

% 1. Resolver para theta usando la ecuación 1

n=0;
while 1
 syms theta;
syms wt;
n=n+0.01;
    alpha = n*pi/180;  % Ajustar valor de alpha
io=@(wt)(vp/z)*(sin(wt - phi) - (m / cos(phi)) + ...
    (((2 * sin(alpha - phi)) / (1 - exp(-pi / tan(phi)))) * exp(-(wt - alpha + pi) / tan(phi))));

% Definir la ecuación 1
eq1 = (vp/z)*(cos(wt - phi) + ...
    (((2 * sin(alpha - phi)) / (tan(phi)*(1 - exp(-pi / tan(phi))))) * exp(-(wt - alpha + pi) / tan(phi))));

% Resolver la ecuación para theta
theta_value = vpasolve(eq1, theta,[alpha+pi alpha+2*pi]);


ang_Imin=fminbnd(io, alpha+pi, alpha+2*pi);

%alpha=ang_Imin
%corriente a la que se acerca MCD
Imin=double((vp / z) * sin(ang_Imin - phi) * ((1 + exp(-pi/tan(phi))) / (1 - exp(-pi/tan(phi))))) - ...
    (E / R);

if Imin < IminDeseado
        break
end
end

%valor corriente al que se llegó
Imin

%ANGULO DONDE CONVIERTE IMIN
ang_Imin*180/pi

%Alpha que logra eso
alpha*180/pi
toc