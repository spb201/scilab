x = [-0.2:0.001:0.2]
y = [-0.5:0.001:0.5]

function [result]=t1a(r, U, vec)
    result=r * U * sinc(vec * r / 2)
endfunction

function [result]=t1b(r, U, vec, t0)
    for i=1:length(vec)
        vec(i)=r * U * sinc(vec(i) * r / 2) * exp(-%i * vec(i) * (t0-r/2))
    end
    result=vec
endfunction

function [result]=t2(r, P, vec)
    result = sinc(vec * r / 4) ^ 2 * P
endfunction

plot(x, t1a(150, 1, x))
plot(x, t1a(100, 1, x))
plot(x, t1a(50, 1, x))

plot(y, real(t1b(50, 1, y, 50)))
plot(y, imag(t1b(50, 1, y, 50)), 'r')

plot(x, t2(150, 1, x))
plot(x, t2(100, 1, x))
plot(x, t2(50, 1, x))

