x = -0.3:0.001:0.3
for i=1:3
    colors = ['r' 'g' 'b']
    col = colors(i)

    r = 50*i
    a = i/10
    P = 1
    U = 1
    t0 = 50

    // 1a
    f = r*U * sinc(x*r/2)

    // 1b
    //f = r*U * sinc(x*r/2) .* exp(x * (-%i) * (t0 + r/2))

    // 2
    //f = P * (sinc(x*r/4)).^2

    // 3
    //f = U / (a+%i*x)

    // модуль
    subplot(4, 1, 1)
    plot(x, abs(f), col)

    // аргумент
    subplot(4, 1, 2)
    plot(x, atan(-imag(f) ./ real(f)), col)

    //вещественная часть
    subplot(4, 1, 3)
    plot(x, real(f), col)

    //мнимая часть
    subplot(4, 1, 4)
    plot(x, imag(f), col)
end
