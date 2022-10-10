%Задача попадания ракетой в цель.
%Найти угол заупска, при котором ракета попадёт в цель с заданым дельта-расстоянием.
%Реализовать задачу с помощью метода стрельбы.

%Задание параметров
g = 9.81; %ускорение свободного падения
k = 0.5; %коэффициент сопротивления воздуха
m = 1; %масса ракеты
delta = 1; %дельта-расстояние
L = 150; %расстояние до цели
v0 = 102; %начальная скорость
start_point = [0,0]; %начальная точка
end_point = [L,0]; %конечная точка

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

angles = [];
is_found = false;
rs = [];

%Реализация метода стрельбы
for i = 1:3
    %Зададим начальные значения
    alpha_min = pi/6*(i-1);
    alpha_max = pi/6*i;
    distance = NaN;
    r = [];
    N = 0;

    %Пока не найдем точный угол alpha, будем менять его на alpha_step
    while true
        %Увеличиваем количество итераций
        N=N+1;

        %Находим две траектории ракеты
        r1 = GetTrajectory(start_point, v0, (alpha_max+2*alpha_min)/3, g, k, m);
        r2 = GetTrajectory(start_point, v0, (2*alpha_max+alpha_min)/3, g, k, m);

        %Рисуем траекторию полета ракеты, но до этого её интерполируем кривой Безье 3-го порядка

        %Интерполяция траектории ракеты кривой Безье 3-го порядка
        x_interp = linspace(min(r1(:,1)), max(r1(:,1)), 1000);
        y_interp = interp1(r1(:,1), r1(:,2), x_interp, 'spline');

        %Рисуем траекторию полета ракеты толщиной 2
        plot(x_interp, y_interp, 'LineWidth', 2)
        hold on

        %Интерполяция траектории ракеты кривой Безье 3-го порядка
        x_interp = linspace(min(r2(:,1)), max(r2(:,1)), 1000);
        y_interp = interp1(r2(:,1), r2(:,2), x_interp, 'spline');

        %Рисуем траекторию полета ракеты толщиной 2
        plot(x_interp, y_interp, 'LineWidth', 2)

        %Определение расстояний между конечной точкой и точкой попадания ракеты
        distance1 = abs(r1(end,1) - end_point(1));
        distance2 = abs(r2(end,1) - end_point(1));

        %Если расстояние меньше дельта-расстояния, то угол alpha найден
        if distance1 < delta
            alpha = (alpha_max+2*alpha_min)/3;
            distance = distance1;
            r = r1;
            is_found = true;
            break
        end
        if distance2 < delta
            alpha = (2*alpha_max+alpha_min)/3;
            distance = distance2;
            r = r2;
            is_found = true;
            break
        end

        %Если оба расстояния больше дельта-расстояния, то меняем границы угла alpha
        if distance1 < distance2
            alpha_max = (2*alpha_max+alpha_min)/3;
        else
            alpha_min = (alpha_max+2*alpha_min)/3;
        end

        %Если разница между границами угла alpha меньше заданной точности, то угол alpha не найден
        if abs(alpha_min - alpha_max) < 0.1
            alpha = (alpha_max+alpha_min)/2;
            distance = abs(r1(end,1) - end_point(1));
            r = r1;
            is_found = false;
            break
        end
    end

    if is_found
        angles = [angles, alpha];
        %Рисуем траекторию полета ракеты, но до этого её интерполируем кривой Безье 3-го порядка

        %Интерполяция траектории ракеты кривой Безье 3-го порядка
        x_interp = linspace(min(r(:,1)), max(r(:,1)), 1000);
        y_interp = interp1(r(:,1), r(:,2), x_interp, 'spline');

        %Рисуем траекторию полета ракеты толщиной 2
        plot(x_interp, y_interp, 'LineWidth', 2)
        hold on
        %Рисуем точку цели в виде зеленого флажка
        plot(end_point(1), end_point(2), 'g^', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
        %Рисуем точку попадания ракеты в виде крестика
        plot(r(end,1), r(end,2), 'kx', 'MarkerSize', 10, 'LineWidth', 2)
        grid on
        %Подписываем оси с помощью LaTeX и задаем размер шрифта 14
        xlabel('$x$, m', 'Interpreter', 'latex', 'FontSize', 14)
        ylabel('$y$, m', 'Interpreter', 'latex', 'FontSize', 14)
        title('Trajectory of the rocket')
        legend('Trajectory', 'Target', 'Hit point', 'Location', 'best') 
    end
end

%Вывод результатов
disp(angles)
% disp(['Distance from target = ', num2str(distance)])
% disp(['Number of iterations = ', num2str(N)])