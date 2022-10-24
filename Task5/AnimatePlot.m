% Построение анимационного графика уравнения atan(sqrt(1-w^2)*cos(w*t)/w/cosh(sqrt(1-w^2)*x))
% x - переменная, t - время
% w - входной параметр < 1
% x лежит в диапазоне [-10,10]
% t лежит в диапазоне [0,2*pi]

function AnimatePlot(w)
    if w >= 1
        error('w must be less than 1');
    end
    % Построение анимации в каждый момент времени t c сохранением в gif-файл
    % Параметры анимации
    t = 0:0.01:2*pi;
    x = -10:0.1:10;
    
    % Параметры анимации
    fps = 30; % Количество кадров в секунду
    delay = 1/fps; % Задержка между кадрами
    filename = 'atan.gif'; % Имя файла для сохранения анимации
    
    % Построение анимации
    for i = 1:length(t)
        y = atan(sqrt(1-w^2)*cos(w*t(i))./w./cosh(sqrt(1-w^2)*x));
        plot(x,y);
        axis([-10 10 -1.5 1.5]);
        title(['t = ', num2str(t(i))]);
        drawnow;
        frame = getframe(1);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1
            imwrite(imind,cm,filename,'gif','Loopcount',inf,'DelayTime',delay);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',delay);
        end
    end
end