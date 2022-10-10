% Функция находящия число обусловленности матрицы A
function cond_number = Cond(A)
    cond_number = Norm(A) * Norm(Inverse(A));
end
