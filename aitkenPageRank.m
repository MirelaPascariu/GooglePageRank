function [pi, time, numiter] = aitkenPageRank(piO, H, v, n, alpha, epsilon, l)
    rowsumvector = ones(1, n) * H';
    nonzerorows = find(rowsumvector);
    zerorows = setdiff(1:n, nonzerorows);
    l = length(zerorows);
    a = sparse(zerorows, ones(1, l), ones(1, l), n, 1);
    k = 0;
    residual = 1;
    pi = piO;
    tic;
    while (residual >= epsilon)
        prevpi = pi;
        k = k + 1;
        pi = alpha * pi * H + (alpha * (pi * a) + (1 - alpha)) * v;
        residual = norm(pi - prevpi, 1);
        if (mod(k, l) == 0)
            nextpi = alpha * pi * H + (alpha * (pi * a) + (1 - alpha)) * v;
            g = (pi - prevpi) .^ 2;
            h = nextpi - 2 * pi + prevpi;
            nextpi = prevpi - (g ./ h);
            if (any(nextpi == -Inf) == 1)
                pi = pi;
            else
                pi = nextpi;
            end
        end
    end
    numiter = k;
    time = toc;
end
