% Функция находящая норму матрицы A
function norm = Norm(A)
    norm = 0;
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            norm = norm + A(i,j)^2;
        end
    end
    norm = sqrt(norm);
end