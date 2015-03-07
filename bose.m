function U = bose(TAU, N)

c = 2 / (sqrt(pi) * zeta(3/2));

function z = f(x, u, tau) 
	z = x.^0.5 ./ (exp((x - u) / tau) - 1);
end

U = zeros(size(TAU));

for i=1:length(TAU),
	tau = TAU(i);
	
	[U(i), ignore, info] = ...
		fminbnd(@(u) ...
			abs(1 - 1/N / (exp(-u/tau)-1) - c * integral(@(x) f(x, u, tau), 0, Inf)), ...
		-10, 0, optimset('TolX',1e-5));
	
	if info~=1,
		display('error');
	end
end

end
