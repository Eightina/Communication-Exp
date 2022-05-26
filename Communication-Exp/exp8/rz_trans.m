function [rz, rz_EP, t, f] = rz_trans(k, L, Rb, emp_rate, a)
    N = 2^k;
    M = N/L;
    Ts = 1/Rb;
    dt = Ts/L;
    T = N*dt;
    df = 1.0/(N*dt);
    Bs = N*df/2;
    t = linspace(-T/2, T/2, N);
    f = linspace(-Bs, Bs, N);
    EP = zeros(size(f));
    for x =1:20
        rz = zeros(L,M);
        
            for i=1:M
                if a(i)==1
                    rz(1:emp_rate/100*L/2,i)=1;
                else
                    rz(1:emp_rate/100*L/2,i)=0;
                end
            end
    
        rz = reshape(rz,1,N);
        RZ = t2f(rz,dt);
        P = RZ.*conj(RZ)/T;
        
        rz_EP = (EP*(x-1)+P)/x;
        
end