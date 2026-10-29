% Noer Afdila_L0325033

clc; clear; close all;

% Diketahui
V = 300;                    % Volume bagian luar bola (cm^3)
f = @(r) (20/3)*pi*r.^3 - V; % Persamaan nonlinier f(r) = 0

% Tebakan awal (r) - diasumsikan kecil, misal 2 cm
r0 = 2;

% Gunakan metode numerik untuk mencari akar (f(r)=0)
r_sol = fzero(f, r0);

% Hitung volume bola dan tabung
V_bola = (4/3)*pi*r_sol^3;
V_tabung = 8*pi*r_sol^3;

% Tampilkan hasil
fprintf('=== Hasil Penyelesaian Persamaan Nonlinier ===\n');
fprintf('Jari-jari bola (r)         = %.4f cm\n', r_sol);
fprintf('Volume bola (V_bola)       = %.4f cm^3\n', V_bola);
fprintf('Volume tabung (V_tabung)   = %.4f cm^3\n', V_tabung);
fprintf('Volume di luar bola        = %.4f cm^3\n', V_tabung - V_bola);

% Visualisasi hasil
r = linspace(0, 5, 100);
plot(r, f(r), 'b', 'LineWidth', 1.5);
hold on;
plot(r_sol, 0, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('r (cm)');
ylabel('f(r)');
title('Grafik Persamaan Nonlinier: f(r) = (20/3)\pi r^3 - 300');
grid on;
legend('f(r)', 'Akar solusi r');

