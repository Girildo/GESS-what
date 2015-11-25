function  C  = customColormap(n)

% % color map with red and blue on the edges
% C = [1 0 0; 0 0 1];
% % convert to HSV for interpolation
% C_HSV = rgb2hsv(C);
% % interpolate hue value
% C_HSV_interp = interp1([0 n], C_HSV(:, 1), 1:n);
% % compose full HSV colormap
% C_HSV = [C_HSV_interp(:), repmat(C_HSV(2:3), n, 1)];
% % convert back to RGB
% C = hsv2rgb(C_HSV);
% % set colormap
% C = [C; 1 1 1];

C_HSV = [0 0 .8; 0 1 .8];
Column1 = C_HSV(1, 1) * ones(n, 1);
Column3 = C_HSV(1, 3) * ones(n, 1);
Column2 = interp1([0 n], C_HSV(:, 2), 1:n)';
C_HSV = [Column1 Column2 Column3];
C = [hsv2rgb(C_HSV);[1 1 1]];

end

