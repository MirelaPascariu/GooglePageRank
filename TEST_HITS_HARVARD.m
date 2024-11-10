
load harvard500.mat
spy(G)


GG = digraph(G);
L = adjacency(GG);
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

fprintf('Number of iterations %d \n', k);
fprintf('Time elapsed: %f \n', time);
fprintf('Number of iterations %d \n', k);
fprintf('Vectorul x -> %s \n', num2str(x));
fprintf('Vectorul y -> %s \n', num2str(y));
fprintf('Vectorul de autoritate -> %s \n', num2str(idx1));
fprintf('Vectorul de platforme -> %s', num2str(idx2));

alpha = 0.85;

tic
hub_ranks = centrality(GG, 'hubs');
auth_ranks = centrality(GG, 'authorities');

time = toc;

GG = digraph(G,U);
plot(GG,'NodeLabel',{},'NodeColor',[0.93 0.78 0],'Layout','force');
pr = centrality(GG,'pagerank','MaxIterations',200,'FollowProbability',0.85);
GG.Nodes.PageRank = pr;
GG.Nodes.InDegree = indegree(GG);
GG.Nodes.OutDegree = outdegree(GG);
GG.Nodes(1:25,:)

H = subgraph(GG,find(GG.Nodes.PageRank > 0.005));
plot(H,'NodeLabel',{},'NodeCData',H.Nodes.PageRank,'Layout','force');
colorbar

disp(auth_ranks)

