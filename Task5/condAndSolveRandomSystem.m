% Функция строющая случайную матрицу nxn и вектор b nx1
% вычисляющая число обусловленности матрицы A
% и решающая СЛАУ Ax=b методом Гаусса
function [cond_number, x] = condAndSolveRandomSystem(n)
    % Создание случайной матрицы nxn
    A = rand(n);
    % % Хорошо обусловленнная матрица
    % A = A + 1000*eye(n);
    % Создание случайного вектора b nx1
    b = rand(n, 1);
    % Вычисление числа обусловленности матрицы A
    cond_number = Cond(A);
    cond_number_matlab = cond(A);
    % Вывести число обусловленности матрицы A подсчитанное нами и подсчитанное встроенной функцией
    disp('My condition number:');
    disp(cond_number);
    disp('Matlab condition number:');
    disp(cond_number_matlab);
    % Решение СЛАУ методом Гаусса
    x = SolveLinearSystem(A, b);
    x_matlab = A\b;
    % Вывести решение СЛАУ подсчитанное нами и подсчитанное встроенной функцией
    disp('My solution:');
    disp(x);
    disp('Matlab solution:');
    disp(x_matlab);
    % Вывести невязку решений
    disp('My residual:');
    disp(A*x - b);
    disp('Matlab residual:');
    disp(A*x_matlab - b);
end
