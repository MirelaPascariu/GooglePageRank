function [pi, time, numiter] = PageRank_no_acceleration(pi0, H, n, epsilon)
%PAGERANK_NO_ACCELERATION computes the PageRank vector for an n-by-n Markov 
% matrix H with starting vector pi0 (a row vector) without acceleration. 
%
% EXAMPLE: [pi, time, numiter] = PageRank_no_acceleration(pi0, H, 1000, le-8); 
%
% INPUT: 
%     pi0 = starting vector at iteration 0 (a row vector) 
%     H = row-normalized hyperlink matrix (n-by-n sparse matrix) 
%     n = size of H matrix (scalar) 
%     epsilon = convergence tolerance (scalar, e.g. le-8) 
% OUTPUT: 
%     pi = PageRank vector 
%     time = time required to compute PageRank vector 
%     numiter = number of iterations until convergence 

k = 0; 
residual = 1;
pi = pi0;
tic;
while (residual >= epsilon)
    prevpi = pi;
    k = k + 1;    
    pi = pi * H;
    residual = norm(pi - prevpi, 1);
    fprintf('Iteration %d -> pi = %s \n', k, num2str(pi));
    [out, idx] = sort(pi, 'descend');
    fprintf('Ranking : %s \n', num2str(idx));
end

numiter = k;
time = toc; 
end
