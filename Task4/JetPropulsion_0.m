%Задача попадания ракетой в цель.
%Построение графика зависимости расстояния полёта от угла заупска.

%Задание параметров
g=9.81; %ускорение свободного падения
v0=10; %начальная скорость
start_point=[0,0]; %начальная точка
k=linspace(0, 10, 50); %коэффициент сопротивления
m=1; %масса ракеты
alpha=linspace(0, pi/2, 20); %угол запуска
L = zeros(length(alpha)); %Определение вектора расстояний

for n = 1:length(k)
    for i=1:length(alpha)
        %Получение траектории полёта
        r = GetTrajectory(start_point, v0, alpha(i), g, k(n), m);
        %Получение расстояния полёта
        L(i) = r(end, 1);
    end

    %Интерполяция кубическим сплайном L(alpha)
    alpha_int = linspace(0, pi/2, 1000);
    L_spline = interp1(alpha, L, alpha_int, 'spline');

    %Построение графика и точки максимального расстояния на нём
    plot(alpha_int, L_spline);
    hold on;
    [maxL, maxL_index] = max(L_spline);
    plot(alpha_int(maxL_index), maxL, 'r.', 'MarkerSize', 20);
    xlabel('Angle, rad', 'Interpreter', 'latex', 'FontSize', 14);
    ylabel('Distance, m', 'Interpreter', 'latex', 'FontSize', 14);
    hold on;
end



