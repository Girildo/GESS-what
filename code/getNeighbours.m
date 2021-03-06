function  neighbours  = getNeighbours (grid, N, F, Q, x, y)
%   Returns a matrix (Fx8) containing the traits of all 8 neighbours mapped as
%   [2 1 8]
%   [3 X 7]
%   [4 5 6]

neighbours = zeros(F, 8);
positions = [
        0  +1;
        -1 +1;
        -1 0;
        -1 -1;
        0 -1;
        +1 -1;
        +1 0;
        +1 +1;
    ];

for i = 1:8
    xNew = x + positions(i, 1);
    yNew = y + positions(i, 2);
    
    if( (x>1 && x<N && y > 1 && y < N) ||  isWithinGrid(N, xNew, yNew))
        if(~isEmpty(grid, xNew, yNew))
            % Extract '3rd' dimension from grid and squeezes it
            neighbours(:, i) = squeeze(grid(xNew, yNew, :)); 
        end
    end
end

% Eliminate zero elements (empty cells)
if (isvector(neighbours))
    neighbours = neighbours(neighbours~=0);
else 
    neighbours=neighbours(:,any(neighbours));
end 
end

