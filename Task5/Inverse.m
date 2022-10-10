% Функция находящая обратную матрицу
function InvA = Inverse(A)
    n = size(A,1);
    InvA = zeros(n);
    for i = 1:n
        InvA(:,i) = SolveLinearSystem(A,eye(n,i));
    end
end