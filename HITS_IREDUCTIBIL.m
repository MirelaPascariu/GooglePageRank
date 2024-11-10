L = [0 0 1 0 1 0;
    1 0 0 0 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 0;
    0 0 1 1 0 0;
    0 0 0 0 1 0];
n = length(L);
x0 = ones(1, n) / n; 
epsilon = 1e-8;
xi = 0.95;

[x, y, time, numiter] = accelerated_hits2(L, x0, n, epsilon, xi);

% Afișarea scorurilor și rankingurilor
disp('Scorurile de Autoritate HITS:');
disp(x);
disp('Scorurile de Hub HITS:');
disp(y);
disp(['Timpul până la convergență: ', num2str(time), ' secunde']);
disp(['Numărul de iterații până la convergență: ', num2str(numiter)]);

% Calculul și afișarea rankingurilor
[~, authority_rank] = sort(x, 'descend');
[~, hub_rank] = sort(y, 'descend');

disp('Ranking Autoritate:');
disp(authority_rank);
disp('Ranking Hub:');
disp(hub_rank);
