
load mathworks100.mat
spy(A)
G = digraph(A);
L = adjacency(G);
[m, n] = size(L);

k = 0;
residual = 1;
epsilon = 1e-8;
x = 1/n * ones(1, n);
y = 1/n * ones(1, n);
tic;

while (residual >= epsilon)
    prevx = x;
    prevy = y;
    k = k + 1;
    x = x * L.';
    x = x * L;
    x = x / sum(x);
    y = y * L;
    y = y * L.';
    y = y / sum(y);
    residual = norm(x - prevx, 1);
    k = k + 1;
end
time = toc;
[out1, idx1] = sort(x, 'descend');
[out2, idx2] = sort(y, 'descend');

fprintf('Numar de iteratii %d \n', k);
fprintf('timp: %f \n', time);
% fprintf('Number of iterations %d \n', k);
fprintf('Vectorul x -> %s \n', num2str(x));
fprintf('Vectorul y -> %s \n', num2str(y));


alpha = 0.85;
tic
hub_ranks = centrality(G, 'hubs');
auth_ranks = centrality(G, 'authorities');
figure(1)
G = digraph(A,U);
plot(G,'NodeLabel',{},'NodeColor',[0.93 0.78 0],'Layout','force');
pr = centrality(G,'pagerank','MaxIterations',200,'FollowProbability',0.85);
G.Nodes.PageRank = pr;
G.Nodes.InDegree = indegree(G);
G.Nodes.OutDegree = outdegree(G);
G.Nodes(1:25,:)
% H = subgraph(G,find(G.Nodes.PageRank > 0.005));
% plot(H,'NodeLabel',{},'NodeCData',H.Nodes.PageRank,'Layout','force');
% colorbar
% disp(auth_ranks)
% time = toc;
fprintf('Timp pentru PageRank %f \n', time);