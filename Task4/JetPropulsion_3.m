%Задача попадания ракетой в цель.
%Найти угол заупска, при котором ракета попадёт в цель с заданым дельта-расстоянием.
%Реализовать задачу с помощью метода стрельбы.

%Решение задачи
%Система уравнений движения ракеты с учетом сопротивления воздуха и гравитации имеет вид:
%x''(t) + k/m*x'(t) = 0
%y''(t) + k/m*y'(t) + g = 0
%Сведем систему к системе первого порядка:
%x'(t) = v_x(t)
%y'(t) = v_y(t)
%v_x'(t) = -k/m*v_x(t)
%v_y'(t) = -k/m*v_y(t) - g
%Начальные условия:
%x(0) = start_point(1)
%y(0) = start_point(2)
%v_x(0) = v0*cos(alpha)
%v_y(0) = v0*sin(alpha)
%Используем метод стрельбы найдем угол alpha, при котором ракета попадет в цель с заданым дельта-расстоянием.
%Для нахождения угла alpha будем использовать метод Ньютона.

L = 100; %Расстояние до цели
g = 9.81; %ускорение свободного падения
k = 0.5; %коэффициент сопротивления воздуха
m = 1; %масса ракеты
delta = 5; %дельта-расстояние
v0 = 102; %начальная скорость
start_point = [0,0]; %начальная точка
end_point = [L,0]; %конечная точка

%Реализация метода стрельбы
alpha = Alpha(L);

%Рисуем точку цели в виде зеленого флажка
plot(end_point(1), end_point(2), 'g^', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
hold on

for i = 1:length(alpha)
    r = GetTrajectory(start_point, v0, alpha(i), g, k, m);
    %Интерполяция траектории ракеты кривой Безье 3-го порядка
    x_interp = linspace(min(r(:,1)), max(r(:,1)), 1000);
    y_interp = interp1(r(:,1), r(:,2), x_interp, 'spline');
    %Рисуем траекторию полета ракеты толщиной 2
    plot(x_interp, y_interp, 'LineWidth', 2)
    hold on
    %Рисуем точку попадания ракеты в виде крестика
    plot(r(end,1), r(end,2), 'kx', 'MarkerSize', 10, 'LineWidth', 2)
    hold on
    grid on
    %Подписываем оси с помощью LaTeX и задаем размер шрифта 14
    xlabel('$x$, m', 'Interpreter', 'latex', 'FontSize', 14)
    ylabel('$y$, m', 'Interpreter', 'latex', 'FontSize', 14)
    title('Trajectory of the rocket')
    legend('Trajectory', 'Target', 'Hit point', 'Location', 'best')
end


% %Вывод результатов
% if ~is_found
%     disp('Alpha not found, but the closest values:')
% end
% disp(['Alpha = ', num2str(alpha)])
% disp(['Distance from target = ', num2str(distance)])
% disp(['Number of iterations = ', num2str(N)])

% %Рисуем траекторию полета ракеты, но до этого её интерполируем кривой Безье 3-го порядка

% %Интерполяция траектории ракеты кривой Безье 3-го порядка
% x_interp = linspace(min(r(:,1)), max(r(:,1)), 1000);
% y_interp = interp1(r(:,1), r(:,2), x_interp, 'spline');

% %Рисуем траекторию полета ракеты толщиной 2
% plot(x_interp, y_interp, 'LineWidth', 2)
% hold on
% %Рисуем точку цели в виде зеленого флажка
% plot(end_point(1), end_point(2), 'g^', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
% %Рисуем точку попадания ракеты в виде крестика
% plot(r(end,1), r(end,2), 'kx', 'MarkerSize', 10, 'LineWidth', 2)
% grid on
% %Подписываем оси с помощью LaTeX и задаем размер шрифта 14
% xlabel('$x$, m', 'Interpreter', 'latex', 'FontSize', 14)
% ylabel('$y$, m', 'Interpreter', 'latex', 'FontSize', 14)
% title('Trajectory of the rocket')
% legend('Trajectory', 'Target', 'Hit point', 'Location', 'best')