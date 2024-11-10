
% COD PAG 20 DIN LICENTA

H = [0 1/2 1/2 0 0 0;
    0 0 0 0 0 0 ;
    1/3 1/3 0 0 1/3 0;
    0 0 0 0 1/2 1/2;
    0 0 0 1/2 0 1/2;
    0 0 0 1 0 0];
n=length(H);
e=[1, 1, 1, 1, 1, 1].';
a=[0, 1, 0, 0, 0, 0].';
alpha=0.9;
pi=1/n *ones(1,n);
k=0;
while (k < 30 )
    prevpi = pi;
    k = k + 1;
    pi = prevpi * (alpha * (H + 1/6 * a .* e.') + (1 - alpha) * 1/6 * e .* e.');
    % fprintf('Iteratia k = %d -> pi = %s \n', k, num2str(pi));
    % [out, idx] = sort(pi, 'descend');
    % fprintf('Ranking : %s \n', num2str(idx));
    G = alpha * H + (1 - alpha) * (1/n * ones(n, 1) * ones(1, n));
    fprintf('Iteratia k = %d -> pi = %s \n', k, num2str(pi));
    [out, idx] = sort(pi, 'descend');
    fprintf('Ranking : %s \n', num2str(idx));
    disp(['Iteration ', num2str(k), ' - Google Matrix (G):']);
    disp(G);
end

% disp('Final PageRank vector:');
% disp(pi);

