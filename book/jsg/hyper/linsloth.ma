t[x_] := Sqrt[t0^2 + x^2/w - ((-1 + g^2)^2 x^4 (1 + 2 Sqrt[1 - ((-1 + g^2)^2 x^2)/(16 g^2 H^2)]))/
                               (144 g^3 H^2 v^2 (1 +   Sqrt[1 - ((-1 + g^2)^2 x^2)/(16 g^2 H^2)])^2)];
tf[x_] := t0^2 + x^2/w + A x^4/(w^2 (t0^2 + B x^2/w + Sqrt[t0^4 + 2 B t0^2 x^2/w + c x^4/w^2]));
ts[x_] := (-2*A*t0 + Sqrt[t0^2 + ((1 - 2*A)*x^2)/w])^2/(1 - 2*A)^2;
th[x_] := t0^2 + x^2/w;
ta[x_] := t0^2 + x^2/w + (A*x^4)/(w*(2*t0^2*w - (-2 + A)*x^2));
x[g_,t_] := 4 t/Sqrt[-1 + g^2];
{Abs[(Sqrt[th[x]] - t[x])/t[x]],Abs[(Sqrt[ts[x]] - t[x])/t[x]],Abs[(Sqrt[ta[x]] - t[x])/t[x]],Abs[(Sqrt[tf[x]] - t[x])/t[x]]};
% /. {B -> (t0^2 (-P T w + X))/(X (t0^2 - T^2 + P T X)) - (A X^2)/((t0^2 - T^2) w + X^2), 
      c -> (t0^4 (-P T w + X)^2)/(X^2 (t0^2 - T^2 + P T X)^2) + (2 A w t0^2)/((t0^2 - T^2) w + X^2)} /. {X->(4 H)/Sqrt[-1 + g^2],
      P->1/(g*v), T->(4 (2 + g^2) H)/(3 g Sqrt[-1 + g^2] v)} /. {t0 -> (4 (1 + g + g^2) H)/(3 (g + g^2) v), 
      w -> 3 g^2 v^2/(1 + g + g^2), A -> -(-1 + g)^2/(6 g)} /. {H -> 1, v -> 1};
err = 100 % /. {x -> x[g,t]};
eh = ParametricPlot3D[{x[g,t], g, err[[1]]}, {g, 1.001, 4}, {t, 0, 1}, 
 BoxRatios -> {1, 1, 0.4}, PlotLabel -> "(a) Hyperbolic", 
 AxesLabel -> {"x/H", "v(H)/v0", "%"}, 
 PlotRange -> {{0, 4}, {1, 4}, All}];
es = ParametricPlot3D[{x[g,t], g, err[[2]]}, {g, 1.001, 4}, {t, 0, 1}, 
 BoxRatios -> {1, 1, 0.4}, PlotLabel -> "(b) Shifted hyperbola", 
 AxesLabel -> {"x/H", "v(H)/v0", "%"}, 
 PlotRange -> {{0, 4}, {1, 4}, All}];
ea = ParametricPlot3D[{x[g,t], g, err[[3]]}, {g, 1.001, 4}, {t, 0, 1}, 
 BoxRatios -> {1, 1, 0.4}, PlotLabel -> "(c) Alkhalifah-Tsvankin", 
 AxesLabel -> {"x/H", "v(H)/v0", "%"}, 
 PlotRange -> {{0, 4}, {1, 4}, All}];
ef = ParametricPlot3D[{x[g,t], g, err[[4]]}, {g, 1.001, 4}, {t, 0, 1}, 
 BoxRatios -> {1, 1, 0.4}, PlotLabel -> "(d) Generalized", 
 AxesLabel -> {"x/H", "v(H)/v0", "%      "}, 
 PlotRange -> {{0, 4}, All, All}];
GraphicsArray[{{eh, es}, {ea, ef}}];
Export["junk_ma.eps", %, ImageSize -> 600];
