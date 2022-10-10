% Построение анимационного графика уравнения atan(sqrt(1-w^2)*cos(w*t)/w/cosh(sqrt(1-w^2)*x))
% x - переменная, t - время
% w - входной параметр < 1
% x лежит в диапазоне [-10,10]
% t лежит в диапазоне [0,2*pi]

function AnimatePlot(w)
    if w >= 1
        error('w must be less than 1');
    end
    % Построение анимации в каждый момент времени t
    for t = 0:0.1:2*pi
        % Построение графика в момент времени t
        x = -10:0.01:10;
        u = atan(sqrt(1-w^2)*cos(w*t)./w./cosh(sqrt(1-w^2)*x));
        plot(x,u);
        % Установка масштаба осей
        axis([-10 10 -1.5 1.5]);
        % Установка названия графика
        title('Equation sin-Gordon');
        % Установка подписей осей
        xlabel('x');
        ylabel('y');
        % Установка подписи времени
        text(-9,1.3,['t = ',num2str(t)]);
        % Пауза для просмотра анимации
        pause(0.1);
    end
end