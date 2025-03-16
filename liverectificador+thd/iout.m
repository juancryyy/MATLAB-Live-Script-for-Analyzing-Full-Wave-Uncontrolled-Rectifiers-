%% Definir valores
syms wt

% Solicitar valores al usuario
vp = input('Ingrese el valor de vp: ');
R = input('Ingrese el valor de R: ');
L = input('Ingrese el valor de L: ');
f = input('Ingrese el valor de freq: ');
E = input('Ingrese el valor de la fuerza elec: ');
alpha = input('Ingrese el valor de alpha (en radianes): ');

%% Definición de constantes
w = 2 * pi * f;               % Frecuencia angular
z = sqrt(R^2 + (w * L)^2);     % Impedancia total
phi = atan(w * L / R);         % Ángulo de desfase debido a la inductancia
m = E / vp;

%% Ecuación

res = (vp / z) * (sin(wt - phi) - (m / cos(phi)) + ((2 * sin(alpha - phi)) / (1 - exp(-pi / tan(phi)))) * exp(-(wt - alpha + pi) / tan(phi)));
res2 = (vp / z) * (sin((wt + pi) - phi) - (m / cos(phi)) + ((2 * sin(alpha - phi)) / (1 - exp(-pi / tan(phi)))) * exp(-((wt + pi) - alpha + pi) / tan(phi)));

%% PLOTS    
% Graficar solo la parte negativa de res
fplot(@(wt) double(subs(res, wt)) .* (double(subs(res, wt)) < 0), [alpha, 12*pi], 'b');  % Graficar solo la parte inferior de res en azul
hold on;
fplot(@(wt) double(subs(res2, wt)) .* (double(subs(res2, wt)) < 0), [alpha, 12*pi], 'r'); % Graficar solo la parte inferior de res2 en rojo

% Personalización de la gráfica
title('Gráfica de la parte inferior de I_o(\omega t) y I_o(\omega t) desfase \pi');
xlabel('\omega t (radianes)');
ylabel('I_o(\omega t)');
legend('Parte inferior de I_o(\omega t)', 'Parte inferior de I_o(\omega t) desfase \pi');
grid on;
hold off;