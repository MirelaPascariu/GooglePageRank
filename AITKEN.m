
H = [0.96 0.04; 0 1]; 
% H = [0 1/2 0 1/2 0 0 ;
%     1/2 0 1/2 0 0 0 ;
%     1/5 1/5 0 1/5 1/5 1/5 ;
%     0 0 1/2 0  0 1/2;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0];

% H = [0 1/2 1/2 0 0 0 ;
%     0 0 0 0 0 0 ;
%     1/3 1/3 0 0 1/3 0 ;
%     0 0 0 0 1/2 1/2;
%     0 0 0 1/2 0 1/2;
%     0 0 0 1 0 0];

n = length(H);
pi0 = ones(1, n) / n; 
v=[0.5, 0.5];
% v = [1/6, 1/6, 1/6, 1/6, 1/6,1/6]; 
alpha = 0.5; 
epsilon = 1e-8; 
l = 10; 
[pi, time, numiter] = aitkenPageRank(pi0, H, v, n, alpha, epsilon, l);
disp('Vectorul PageRank:');
disp(pi);
disp(['Timpul până la convergență: ', num2str(time), ' secunde']);
disp(['Numărul de iterații până la convergență: ', num2str(numiter)]);
