%Функция синуса, определяющаяся из ряда Тейлора
%Принимаемое значение: x - вектор углов в радианах
%Возвращаемое значение: y - вектор значений синуса, iterations - вектор количества итераций
function [y, iterations] = bad_sinus(x)
    L = length(x);
    y = x;
    iterations = ones(1, L);
    for i = 1:L
        term = 1;
        while term ~= 0
            term = (-1)^iterations(i) * (x(i)^(2*iterations(i)+1) / factorial(2*iterations(i)+1));
            y(i) = y(i) + term;
            iterations(i) = iterations(i) + 1;
        end
    end
end

