
% L = sparse([0 1 1 0; 1 0 1 0; 0 1 0 1; 0 1 0 0]);% pag 116

L=sparse([0 0 1 0 1 0;
    1 0 0 0 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 0;
    0 0 1 1 0 0;
    0 0 0 0 1 0]);

n = length(L);
x0 = ones(1, n) / n;
epsilon = 1e-8;
[x, y, time, numiter] = hits_algorithm(L, x0, n, epsilon);

disp('HITS Authority Vector:');
disp(x);
[~, authority_rank] = sort(x, 'descend');
disp('Ranking based on Authority Scores:');
disp(authority_rank);
disp('HITS Hub Vector:');
disp(y);
[~, hub_rank] = sort(y, 'descend');
disp('Ranking based on Hub Scores:');
disp(hub_rank);
disp(['Time until convergence: ', num2str(time), ' seconds']);
disp(['Number of iterations until convergence: ', num2str(numiter)]);

