% Функция решения системы линейных уравнений Ax=b
% Алгоритм: метод Гаусса

function x = SolveLinearSystem(A, b)
    n = length(b);
    for k = 1:n-1
        for i = k+1:n
            m = A(i,k)/A(k,k);
            for j = k+1:n
                A(i,j) = A(i,j) - m*A(k,j);
            end
            b(i) = b(i) - m*b(k);
        end
    end
    x = zeros(n,1);
    x(n) = b(n)/A(n,n);
    for i = n-1:-1:1
        s = 0;
        for j = i+1:n
            s = s + A(i,j)*x(j);
        end
        x(i) = (b(i) - s)/A(i,i);
    end
end

% Алгоритм: метод Гаусса-Зейделя
% function x = SolveLinearSystem(A, b)
%     n = length(b);
%     x = zeros(n,1);
%     for k = 1:100
%         for i = 1:n
%             s = 0;
%             for j = 1:i-1
%                 s = s + A(i,j)*x(j);
%             end
%             for j = i+1:n
%                 s = s + A(i,j)*x(j);
%             end
%             x(i) = (b(i) - s)/A(i,i);
%         end
%     end
% end

% Алгоритм: метод Якоби
% function x = SolveLinearSystem(A, b)
%     n = length(b);
%     x = zeros(n,1);
%     for k = 1:100
%         x1 = zeros(n,1);
%         for i = 1:n
%             s = 0;
%             for j = 1:i-1
%                 s = s + A(i,j)*x(j);
%             end
%             for j = i+1:n
%                 s = s + A(i,j)*x(j);
%             end
%             x1(i) = (b(i) - s)/A(i,i);
%         end
%         x = x1;
%     end
% end
