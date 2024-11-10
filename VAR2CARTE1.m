T = readtable('book1.csv');
disp(T)
Numar_de_noduri= height(T)
nodesnames = unique([T.Source; T.Target]); 
s = [];
t = [];
weights = [];
for i = 1:height(T)
    if strcmp(T.Type{i}, 'Undirected')
        s(end + 1) = find(strcmp(nodesnames, T.Source{i}));
        t(end + 1) = find(strcmp(nodesnames, T.Target{i}));    
        weights(end + 1) = T.weight(i);
        s(end + 1) = find(strcmp(nodesnames, T.Target{i}));
        t(end + 1) = find(strcmp(nodesnames, T.Source{i}));    
        weights(end + 1) = T.weight(i);
    else
        s(end + 1) = find(strcmp(nodesnames, T.Source{i}));
        t(end + 1) = find(strcmp(nodesnames, T.Target{i}));    
        weights(end + 1) = T.weight(i);
    end
end

G = digraph(s, t, weights, nodesnames);
totalDegree = indegree(G) + outdegree(G);
nodeSizes = 5 + 40 * (totalDegree - min(totalDegree)) / (max(totalDegree) - min(totalDegree));
numNodes = numnodes(G);
x = rand(numNodes, 1);
y = rand(numNodes, 1);
h = plot(G,'XData',x,'YData',y,'NodeLabel',{},'MarkerSize',nodeSizes,'NodeColor','red');
pr = centrality(G, 'pagerank', 'Importance', double(weights));
[sortedPR, idx] = sort(pr, 'descend');
topNodes = idx(1:6);

for i = 1:length(topNodes)
    text(x(topNodes(i)), y(topNodes(i)), nodesnames{topNodes(i)}, 'FontSize', ...
        9, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
end

maxiter = 10;
tic
pr = centrality(G, 'pagerank', 'MaxIterations', maxiter, 'Importance', double(weights));
G.Nodes.PageRank = pr;
G.Nodes.InDegree = indegree(G);
G.Nodes.OutDegree = outdegree(G);
time = toc;
fprintf('Centrality function - PageRank vector pi = %s \n', num2str(pr'));
fprintf('Time elapsed: %f \n', time);
[out, idx] = sort(pr, 'descend');
fprintf('Rankurile finale ale personajelor sunt -> %s \n', num2str(flipud(idx)));
