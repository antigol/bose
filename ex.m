clear all;
close all;
clc;

tau = linspace(1e-2, 3, 100);

N = [1, 2, 5, 1e10];

u = zeros(length(N), length(tau));
Nrel = zeros(length(N), length(tau));

for k = 1:length(N),
	[u(k,:), Nrel(k,:)] = bose(tau, N(k));
end

plot(tau, u);
a = axis();
hold on;
plot(tau, -zeta(3/2)^2/(4*pi) * tau.^-2 .* (tau.^(3/2)-1).^2, '--k');
plot(tau, -tau ./(1*(1-tau.^(3/2))), '--k');
plot(tau, -tau ./(2*(1-tau.^(3/2))), '--k');
plot(tau, -tau ./(5*(1-tau.^(3/2))), '--k');
axis(a);
%legendCell = cellstr(num2str(N, 'N = %-d'));
%legend(legendCell);

legend('N=1', 'N=2', 'N=5', 'N=1e10', 'Approximation theorique');

xlabel('temperature')
ylabel('potentiel chimique');
