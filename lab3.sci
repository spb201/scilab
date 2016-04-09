x = [-0.2:0.001:0.2]
y = [-0.5:0.001:0.5]
z = [-2:0.01:2]

function [result]=t1a(r, U, vec)
    result = r * U * sinc(vec * r / 2)
endfunction

function [result]=t1b(r, U, vec, t0)
    for i=1:length(vec)
        vec(i) = r * U * sinc(vec(i) * r / 2) * exp(-%i * vec(i) * (t0-r/2))
    end
    result = vec
endfunction

function [result]=t2(r, P, vec)
    result = sinc(vec * r / 4) ^ 2 * P
endfunction

function [result]=t3(U, a, vec)
    result = U/(a+%i*vec)
endfunction

colors = ['r', 'g', 'b']

// task 1A
for r=50:50:150
    subplot(2, 2, 1)
    xtitle('real')
    plot(y, real(t1a(r, 1, y)), colors(r/50))
    subplot(2, 2, 2)
    xtitle('imag')
    plot(y, imag(t1a(r, 1, y)), colors(r/50))
    subplot(2, 2, 3)
    xtitle('abs')
    plot(y, abs(t1a(r, 1, y)), colors(r/50))
    subplot(2, 2, 4)
    //xtitle('arg')
    //plot(atan(imag(t1a(r, 1, y)), real(t1a(r, 1, y))), colors(r/50))
end

// task 1B
for r=50:50:150
    subplot(2, 2, 1)
    xtitle('real')
    plot(y, real(t1b(r, 1, y, 50)), colors(r/50))
    subplot(2, 2, 2)
    xtitle('imag')
    plot(y, imag(t1b(r, 1, y, 50)), colors(r/50))
    subplot(2, 2, 3)
    xtitle('abs')
    plot(y, abs(t1b(r, 1, y, 50)), colors(r/50))
    subplot(2, 2, 4)
end

// task 2
for r=50:50:150
    subplot(2, 2, 1)
    xtitle('real')
    plot(y, real(t2(r, 1, y)), colors(r/50))
    subplot(2, 2, 2)
    xtitle('imag')
    plot(y, imag(t2(r, 1, y)), colors(r/50))
    subplot(2, 2, 3)
    xtitle('abs')
    plot(y, abs(t2(r, 1, y)), colors(r/50))
    subplot(2, 2, 4)
end

// task 3
for a=0.1:0.1:0.3
    subplot(2, 2, 1)
    xtitle('real')
    plot(y, real(t3(1, a, y)), colors(int(a*10)))
    subplot(2, 2, 2)
    xtitle('imag')
    plot(y, imag(t3(1, a, y)), colors(int(a*10)))
    subplot(2, 2, 3)
    xtitle('abs')
    plot(y, abs(t3(1, a, y)), colors(int(a*10)))
    subplot(2, 2, 4)
end

//task4
xrange = [0:0.001:1]
plot(xrange, sin(2 * %pi * 8 * xrange))

plot(xrange, sin(2 * %pi * (-2) * xrange), 'g')

xrange1 = [0:0.1:1]
plot(xrange1, sin(2 * %pi * 8 * xrange1), 'ro')
