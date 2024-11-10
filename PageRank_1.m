function [pi, time, numiter] = PageRank_1(pi0, H, n, alpha, epsilon)
%PAGERANK_1 computes the PageRank vector for an n-by-n Markov 
% matrix H with starting vector piO (a row vector) 
% and scaling parameter alpha (scalar). Uses Power Method. 
%
% EXAMPLE: [pi, time,numiter] = PageRank(piO,H,lOOO, .9,le-8); 
%
% INPUT: 
%     pi0 = starting vector at iteration 0 (a row vector) 
%     H = row-normalized hyperlink matrix (n-by-n sparse matrix) 
%     n = size of H matrix (scalar) 
%     alpha = scaling parameter in PageRank model (scalar) 
%     epsilon = convergence tolerance (scalar, e.g. le-8) 
% OUTPUT: 
%     pi = PageRank vector 
%     time = time required to compute PageRank vector 
%     numiter = number of iterations until convergence 
% 
% The starting vector is usually set to the uniform vector, 
%     piO = l/n*ones(l,n)
% 
% NOTE: Matlab stores sparse matrices by columns, so it is faster 
%     to do some operations on H', the transpose of H. 
%     get "a", the dangling node vector, where a(i)=l, if node l 
%     is dangling node and 0 otherwise. 


%Avem functia PageRank_1 cu 5 parametri de intrare:
%- pi0 vector initial
%- H matrice Markov
%- n dimensiunea matricei
%- alpha parametru scalare
%- epsilon toleranta de convergenta
%Se returneaza:
%- pi vector PageRank
%- time timpulpentru calcul
%- numiter nr de iteratii pana are loc convergenta

rowsumvector = ones(1,n)*H' ; % vector sumelor pe linii a transpusei H hyperlink
%folosim pt a identifica noduri dangling

nonzerorows = find(rowsumvector) ;
zerorows = setdiff(1:n, nonzerorows); 
% gasim indicii randurilor nenule(adica nu avem dangling) si calculam
% indicii randurilor anume adica nod dangling
l = length(zerorows); % nr de noduri dangling
a = sparse (zerorows,ones(l, 1) ,ones(l,1) ,n, 1); % vector contruit folosind nodurile dangling 
v = 1/n * ones(1, n);%privit ca o distributie uniforma de prob pt toate nodurile
  
k = 0;
residual = 1;
pi = pi0;
tic;
while (residual >=  epsilon)
    prevpi = pi;
    k = k+1;    
    pi = alpha*pi*H + (alpha*(pi*a)+1-alpha)*v;
    residual = norm(pi-prevpi, 1) ;
    
    G = alpha * H + (1 - alpha) * (1/n * ones(n, 1) * ones(1, n));

    % aisarea matricei Google
    % disp('Google Matrix (G):');
    % disp(G);
    % disp(['Iteration ', num2str(k), ' - Google Matrix (G):']);
    % disp(G);
    fprintf('Iteratia k = %d -> pi = %s \n', k, num2str(pi));
    [out, idx] = sort(pi, 'descend');
    fprintf('Ranking : %s \n', num2str(idx));
end
%actualizare iterativa pt vectorul PageRank pana cand val reziduala scade
%sub toleranta de convergenta eps
numiter = k; 
time = toc; 

end