% Noer Afdila_L0325033

% Matriks koefisien (semua dalam kg)
A = [2.5  1.5  5.0  0.5;
     4.0  0.75 1.0  2.0;
     2.0  1.5  0.5  6.0;  % <-- tepung = 0.5 kg (50 dag)
     1.0  4.25 2.0  0.9];

% Vektor hasil (total harga per orang)
B = [161000; 149000; 251500; 173000];

% Matriks augmented
Aug = [A B];
n = length(B);

% Gauss-Jordan
for i = 1:n
    pivot = Aug(i,i);
    Aug(i,:) = Aug(i,:) / pivot;
    for j = 1:n
        if j ~= i
            factor = Aug(j,i);
            Aug(j,:) = Aug(j,:) - factor .* Aug(i,:);
        end
    end
end

% Solusi (harga per kg)
x = Aug(:,end);

disp('=== Hasil Penyelesaian SPL (Harga per kg) ===');
fprintf('Beras  = Rp %.2f\n', x(1));
fprintf('Telur  = Rp %.2f\n', x(2));
fprintf('Tepung = Rp %.2f\n', x(3));
fprintf('Ayam   = Rp %.2f\n', x(4));

