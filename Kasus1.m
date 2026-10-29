% Noer Afdila_L0325033
clc; clear; close all;

% Parameter
h0 = 5;
v = 36;
lambda = 12;
x = 10;
t = linspace(0,5,100);

% Nilai eksak
hexact = h0 * (cos(t*v/lambda) + exp(x));

% Nilai pendekatan dengan deret Taylor
n_values = [23 24 25];
galat = zeros(1, length(n_values));

figure;
hold on;

for j = 1:length(n_values)
    n = n_values(j);
    cos_approx = zeros(size(t));
    exp_approx = 0;

    % Deret Taylor cos(x)
    for k = 0:n
        cos_approx = cos_approx + ((-1)^k) .* (t*v/lambda).^(2*k) ./ factorial(2*k);
    end

    % Deret Taylor e^x
    for k = 0:n
        exp_approx = exp_approx + (x^k) / factorial(k);
    end

    % Hitung fungsi hampiran h
    h_approx = h0 .* (cos_approx + exp_approx);

    % Hitung galat mutlak rata-rata
    galat(j) = mean(abs(hexact - h_approx));

    % Plot hasil
    plot(t, h_approx, 'DisplayName', ['Pendekatan n = ', num2str(n)]);
end

% Plot fungsi eksak
plot(t, hexact, 'k', 'LineWidth', 1.5, 'DisplayName', 'Eksak');
xlabel('t');
ylabel('h(t)');
title('Perbandingan Fungsi Eksak dan Pendekatan Deret Taylor');
legend show;
grid on;

% Tampilkan hasil galat
disp('Rerata galat mutlak untuk tiap n:');
for j = 1:length(n_values)
    fprintf('n = %d -> Galat rata-rata = %.6e\n', n_values(j), galat(j));
end

