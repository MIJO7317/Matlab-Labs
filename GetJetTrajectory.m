%Функция, возвращающая траекторию ракеты
function r = GetJetTrajectory(start_point, v0, angle, M0, F_jet, FCR, g, k, m)
    %Если угол равен 0, то траектория будет точкой
    if angle == 0
        r = start_point;
        return;
    end

    %Инициализация траектории
    r = [];

    %Инициализация времени
    T = 0;

    %Цикл по времени, который считает траекторию и заканчивается, когда ракета упадет
    while true
        %Решение системы дифференциальных уравнений
        [~, rvM] = ode45(@(t, rvM) ...
            [rvM(3); rvM(4); (F_jet*rvM(3)/norm([rvM(3), rvM(4)])-k*rvM(3))/(m+rvM(5)); (F_jet*rvM(4)/norm([rvM(3), rvM(4)])-k*rvM(4))/(m+rvM(5))-g; -FCR*heaviside(rvM(5))], ...
            [T,T+0.1] , [start_point(1), start_point(2), v0*cos(angle), v0*sin(angle), M0]);
        r = [r; rvM(:,1:2)];
        if rvM(end,2) < 0
            break;
        end
        start_point = rvM(end,1:2);
        angle = atan2(rvM(end,4), rvM(end,3));
        v0 = norm(rvM(end,3:4));
        M0 = rvM(end,5);
        T = T + 0.1;
    end

    %Определение точки пересечения траектории с осью OX
    for i = 1:length(r)-1
        if r(i,2)*r(i+1,2) < 0
            %Определение координаты точки пересечения
            x_cross = r(i,1) + (r(i+1,1)-r(i,1))*abs(r(i,2))/(abs(r(i,2))+abs(r(i+1,2)));
            r = [r(1:i,:); [x_cross, 0]];
            break
        end
    end
end