function [x, y, time, numiter] = accelerated_hits2(L, x0, n, epsilon, xi)
    if ~issparse(L)
        L = sparse(L);
    end
    nee = ones(n, 1);
    A = xi * L' * L + (1 - xi) / (nee' * nee);
    B = xi * L * L' + (1 - xi) / (nee' * nee);
    k = 0;
    residual = 1;
    x = x0;
    tic;
    while (residual >= epsilon)
        prevx = x;
        k = k + 1;
        x = x * A;
        x = x / sum(x);
        residual = norm(x - prevx, 1);
    end
    y = x * B';
    y = y / sum(y);
    numiter = k;
    time = toc;
    disp(['Algoritmul HITS converge după ', num2str(numiter), ' iterații.']);
end
