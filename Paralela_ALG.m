
% Paralela alg

H = [0 1/2 0 1/2 0 0 ;
    1/2 0 1/2 0 0 0 ;
    1/5 1/5 0 1/5 1/5 1/5 ;
    0 0 1/2 0  0 1/2;
    0 0 0 0 0 0;
    0 0 0 0 0 0];

% H = [0 1/2 1/2 0 0 0 ;
%     0 0 0 0 0 0 ;
%     1/3 1/3 0 0 1/3 0 ;
%     0 0 0 0 1/2 1/2;
%     0 0 0 1/2 0 1/2;
%     0 0 0 1 0 0];

n = length(H);
alpha = 0.5;
epsilon = 1e-8;
pi0 = (1/n) * ones(1, n);
[pi_accel, time_accel, numiter_accel] = PageRank_1(pi0, H, n, alpha, epsilon);
[pi_no_accel, time_no_accel, numiter_no_accel] = PageRank_no_acceleration(pi0, H, n, epsilon);

fprintf('Metoda cu accelerare:\n');
fprintf('Număr de iterații: %d\n', numiter_accel);
fprintf('Timp de execuție: %f secunde\n\n', time_accel);
fprintf('Metoda fără accelerare:\n');
fprintf('Număr de iterații: %d\n', numiter_no_accel);
fprintf('Timp de execuție: %f secunde\n\n', time_no_accel);

