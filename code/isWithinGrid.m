function ok = isWithinGrid (N, x, y)
    ok = 1;
    if (x == 0 || y == 0 || x == (N+1) || y == (N+1))
        ok = 0;
    end
end
