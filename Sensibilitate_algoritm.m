
% Sensibiltate algoritm

H = [0 1/2 0 1/2 0 0 ;
    1/2 0 1/2 0 0 0 ;
    1/5 1/5 0 1/5 1/5 1/5 ;
    0 0 1/2 0  0 1/2;
    0 0 0 0 0 0;
    0 0 0 0 0 0];

n = length(H);
G = digraph(H);
nodenames = (1:n)';
G.Nodes.Name = cellstr(num2str(nodenames));
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
plot(G,'Layout','force','LineWidth',LWidths);
title('Simple web with 6 pages')
hold on

 pi0 = 1/n*ones(1,n); 
 % pi0 = sparse(zeros(1,n));
 % pi0(1) = 1;
 alpha = 0.1;%modificare prob
 %vedem comportamentul algoritmului 
 e = ones(n,1);
 rowsumvector = sum(H');
 nonzerorows = find(rowsumvector); % nu dangling 
 zerorows = find(~rowsumvector);   % dangling 
 
 a = sparse(zeros(n,1));
 a(zerorows) = 1; % dangling
 epsilon = 1e-5; 

 [pi, time, numiter] = PageRank_1(pi0, H, n, alpha, epsilon);

 fprintf('PageRank vector pi = %s \n', num2str(pi));
 fprintf('Time elapsed: %f \n', time);
 fprintf('Number of iterations %d \n', numiter);
 [out, idx] = sort(pi, 'descend');
 fprintf('Ranking : %s \n\n\n', num2str(flipud(idx)));
