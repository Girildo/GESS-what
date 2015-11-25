function B = removeZeros(A)
for i=1:size(A,2)
     if (A(1,i) ~= 0)
         B(:,i) = A(:,i);
     end
end
end

