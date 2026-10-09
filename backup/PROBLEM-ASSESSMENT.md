# The main open problem and an assessment of the approach

*An outside reading of `main.tex` and `main_clean_under_construction.tex` (state: July 2026).*

## 1. The problem the notes attempt to solve

**Is the numerical instability of resultant-based rootfinding methods typical, or only a
worst-case phenomenon?**

Background: Noferini–Townsend (SINUM 2016, `[NT]`) showed that resultant methods
(Cayley, Sylvester) for multidimensional rootfinding are unstable in the worst case: the
condition number of the eigenvalue problem the method actually solves can exceed the intrinsic
condition number of the root by a factor that grows exponentially in the dimension `d`.
Graf–Townsend (`[GT]`) established the analogous result for normal-form (Möller–Stetter)
methods, with the adversarial family $x_i^2 + \sigma x_{i+1} = 0$ giving amplification
$\sigma^{-d}$. These are worst-case constructions. The notes ask the natural follow-up, stated
implicitly in the introduction of the clean draft ("How about random systems? Can we say
*anything* about them?", `main_clean_under_construction.tex:143-146`):

> For a **random** polynomial system, what is the distribution of the condition-number
> amplification of resultant / normal-form methods? In particular, does the amplification stay
> bounded (or grow slowly) with high probability, so that the worst-case instability is atypical?

This is an average-case / smoothed-analysis question in the tradition of Shub–Smale and
Bürgisser–Cucker (`[BC]`), but applied to the *ratio* $\kappa_{\text{eig}}/\kappa_{\text{root}}$
(instability of the algorithm) rather than to the intrinsic condition number of the problem.

### The central quantity

All method-specific condition numbers in play share the same denominator. For the Cayley
resultant ($\kappa \ge \|V\|\|W\| / \det J(x^*)$), Sylvester in 2D, and normal-form methods
($\kappa = \|[\det Q]_\mathcal{B}\| \, \|\mathcal{B}(x^*)\| \,(1+|\lambda|)/|\det J(x^*)|$),
the amplification is governed by

$$ \frac{1}{\|J^{-1}\|_2 \, |\det J(x^*)|} = \frac{1}{\sigma_1 \cdots \sigma_{d-1}(J)}, $$

the reciprocal of the product of the top $d-1$ singular values of the Jacobian at the root
(`main.tex:461-467`, `main_clean_under_construction.tex:150`). The program therefore decomposes
into three sub-problems:

1. **Denominator.** Lower-tail control of $T = \sigma_1 \cdots \sigma_{d-1}(J)$ for a random
   Jacobian (Sections "Smarter lower bounds", "Product/Ratio of positive random variables",
   "Application").
2. **Where the roots are.** The law of $J$ at a root depends on the root's location, so one
   needs the root distribution of random systems (Section "Random systems of polynomials":
   limit measures via logarithmic potentials, building on Barbarino–Noferini `[BN]`).
3. **Numerator.** The eigenvector / basis terms, e.g. $\|[\det Q]_\mathcal{B}\|$ for
   normal-form methods (Section "Sampling", model $\operatorname{diag}(x^2) + Gx$).

The April 2026 section (Bombieri basis / Gaussian homogeneous polynomials) is a reboot of
sub-problems 1–2 in the Kostlan model, where unitary invariance makes both tractable at once.

## 2. What the approach gets right

**The interlacing trick is genuinely good — and stronger than what the notes record.**
Cauchy interlacing applied to $PA$ (one-sided projection, not $PAQ$) gives, *pointwise almost
surely*,

$$ T = \prod_{i=1}^{d-1}\sigma_i(A) \;\ge\; \prod_{i=1}^{d-1}\mu_i(PA), $$

and $PA$ is unitarily equivalent to a $(d-1)\times d$ Gaussian, so $\prod \mu_i$ is an
*explicit* product of independent chi variables with $2d, 2d-2, \dots, 4$ degrees of freedom
(`main.tex:100-125`). The notes only extract $\mathbb{E}[T] \gtrsim \sqrt{d!}$ from this, but
the pointwise domination gives full **stochastic domination**: $\Pr[T \le t] \le
\Pr[\prod\chi \le t]$ for every $t$. That is exactly the small-ball / lower-tail bound needed
to control $\kappa \propto 1/T$ with high probability — and it makes the laborious exact
integration attempts for $d=3$ (the $\mathrm{Ei}_k$ bookkeeping in `main.tex:524-577`) largely
unnecessary. This is the single most useful observation in the notes and deserves to be
promoted from a corollary about expectations to the tail-bound statement.

**The Kostlan/Bombieri model (April 2026 section) is the right framework.** Gaussian
coefficients in the Bombieri basis give unitary invariance (`main.tex:729-771`), which
simultaneously (i) pins down the root distribution exactly — uniform on the projective sphere,
with the affine density $f(X) = d!/(\pi^d(1+\|X\|^2)^{d+1})$ cross-checked two ways
(`main.tex:815-831`) matching Edelman–Kostlan — and (ii) resolves the dependence problem that
blocks the earlier sections: the Jacobian factors as $J = G C^{1/2}$ with $G$ i.i.d. Gaussian
and $C = aI + bXX^*$ explicit (`main.tex:786-812`), so
$\sigma_i(J) \ge \sqrt{n}(1+\|X\|^2)^{(n-1)/2}\sigma_i(G)$ reduces everything to the i.i.d.
case where the interlacing bound applies. This connects the project to the well-developed
machinery of `[BC]` Ch. 16–18 rather than fighting non-i.i.d. structure by hand.

**The numerics point at a positive answer.** The sampled histograms
(Figures for $d = 2,\dots,7$ and bivariate degrees $n=2,\dots,6$) plus the expectation
computation $\mathbb{E}[\log(\|[\det Q]_\mathcal{B}\|/B)] \lesssim -\frac{d-2}{2}\log 2$
(`main.tex:641-666`) consistently suggest the amplification ratio *improves* with dimension in
the Gaussian model — i.e., the emerging main claim is that the Noferini–Townsend instability
is atypical. That would be a publishable and somewhat surprising counterpoint to the
worst-case results.

**The root-distribution results are plausible and the conditional log-potential computations
are clean.** Uniform on the torus $(S^1)^d$ for the max-degree model, and the
$\max(\log|x_*|, \log|z|)$ potential computation for total degree
(`main_clean_under_construction.tex:226-270`) look correct as computations.

## 3. Gaps and weaknesses

Ordered roughly by how much they threaten the program.

1. **The limit theorem for root measures is not actually proved.** The argument computes the
   conditional limit of $x_1$ given $x_2,\dots,x_d$ and then assembles the joint limit. As VN's
   own comment admits (`main.tex:172-176`), this shows only *"if there is a limit, it must be
   this"* — convergence of the random measure itself is never established, and the
   limit–integral exchange marked $(*)$ (`main.tex:277-307`,
   `main_clean_under_construction.tex:263-268`) is exactly the unjustified step (EL flags it
   too). There is also a subtler modelling issue: "conditioning on the other coordinates of the
   root" is not the same as fixing generic values of $x_2,\dots,x_d$, because at a root those
   coordinates are functions of the same random coefficients. The proposed fix (extend
   `[BN]` Lemma B.1, dominate the integrand by
   $C\mathbf{1}_{\|t-\mathbf{1}\|\le K} + f_k g_k \mathbf{1}_{\|t-\mathbf{1}\|>K}$) is a
   reasonable sketch but is still a sketch. **For the Kostlan model this entire difficulty
   disappears** (root distribution is exact at every finite degree by invariance), which is
   another argument for making that model the backbone.
   *Update (July 2026): resolved.* `convergence.tex` replaces the conditional-slice argument
   with a potential-theoretic proof (normalized zero currents + telescoping) that gives
   convergence in probability to the torus measure for both degree models, with rate
   $O(\log n/n)$, under bounded-density (not necessarily Gaussian) coefficients.

2. **An expectation bound is used where a tail/reciprocal bound is needed.** The Example in
   the clean draft concludes $\mathbb{E}[\kappa] \le C^{d-1}(1+|\lambda|)/\sqrt{d!}$ from
   $\mathbb{E}[T] \ge \sqrt{d!}$ (`main_clean_under_construction.tex:179-195`). This is
   invalid: $\mathbb{E}[1/T] \ge 1/\mathbb{E}[T]$ by Jensen — the inequality goes the wrong
   way, and EL's comment ("not formal") flags it. The fix is available in-house: use the
   stochastic domination from item 2 above to bound $\mathbb{E}[1/T]$ or
   $\Pr[1/T \ge s]$ directly via the chi-product (whose negative moments and log-moments are
   explicit: $\mathbb{E}[\log\chi_{2k}]$ is already computed as $f_k$ in `main.tex:656`).
   Working with $\mathbb{E}[\log \kappa]$ throughout, as the VN comment at
   `main.tex:653-665` starts to do, is the cleaner formulation.

3. **The finite-degree tail-bound thread is stuck, and knows it.** The largest-root bound
   $\Pr_t \le 1 - t^{2n}/(1+t^2)^n$ tends to 1, not 0, as $n\to\infty$ (`main.tex:380-398`),
   and the Rouché variant reproduces the same bound (`main.tex:415-431`). VN's diagnosis is
   right: the largest root is the wrong statistic. The annulus statistic (expected fraction of
   roots in $1\pm\delta$) is the right replacement but is currently only a suggestion. For the
   Kostlan model, finite-degree root densities are already available in the notes
   (`main.tex:833-840`), which again supersedes this thread.

4. **The Sylvester/resultant route is blocked.** Applying `[BN]` Theorem 1.2 to
   $\det S(x)$ fails because the coefficients of the Sylvester matrix are not i.i.d.
   (`main.tex:156`). No progress is recorded past this observation. Similarly, the `[PY15]`
   route for the resultant's coefficients is self-annotated as probably false in general
   ("update 5.11, this is actually false") (`main.tex:370-376`). These are honest dead ends;
   neither is load-bearing if the log-potential / Kostlan threads succeed.

5. **The numerator analysis covers only one very special model.** $\|[\det Q]_\mathcal{B}\|$
   is computed for $\operatorname{diag}(x^2) + Gx$ with the root pinned at the origin, where
   $Q = \operatorname{diag}(x) + G$ and the monomial basis is orthonormal
   (`main.tex:617-666`). EL's comment (`main_clean_under_construction.tex:274-278`) raises the
   right worry: real applications don't have roots on the unit circle or at the origin — do
   results about this model say anything about the methods in the wild? The generic-root
   version requires understanding $Q$ and the quotient basis $\mathcal{B}$ for generic random
   systems, where the notes' own Gröbner-basis experiments were numerically unreliable
   (`main.tex:690-703`). This is the least-developed of the three sub-problems.

6. **A conditioning step in the Kostlan section needs care.** The covariance formula
   $\mathbb{E}[J_{ij}J_{ik}^*]$ (`main.tex:786-800`) is *unconditional*, but the program calls
   for the law of $J$ *given that $X$ is a root* (`main.tex:815-817`). $J$ and $P(X)$ are
   jointly Gaussian and correlated for general $X$, so conditioning on $P(X)=0$ modifies the
   covariance. At the invariant point $X=0$ the correlation vanishes and the argument is fine —
   and by unitary invariance the root can be moved there in *projective* coordinates — but the
   affine quantities being averaged (the $(1+\|X\|^2)$ factors) are chart-dependent, so the
   bookkeeping of "move root to a reference point, then integrate over the root density" must
   be done once, carefully. This is standard Shub–Smale/Kac–Rice machinery (`[BC]` Ch. 17 has
   it), so it is a gap in the write-up rather than a hole in the idea.

## 4. Overall assessment

The problem is well-chosen: worst-case instability of resultant methods is established, the
average-case question is open, natural, and of clear interest to both the numerical algebraic
geometry and the probabilistic condition-analysis communities. The notes contain the two
ingredients a solution most likely needs — the interlacing/stochastic-domination bound on
$\sigma_1\cdots\sigma_{d-1}$, and the unitarily invariant Kostlan model with its explicit
$J = GC^{1/2}$ factorization and exact root density. The most promising consolidation is:

- make the Kostlan model the primary setting (it dissolves gaps 1, 3, and much of 6);
- restate the interlacing corollary as stochastic domination and work with tails / log-moments
  of $\kappa$, never with $\mathbb{E}[T]$ (fixes gap 2, retires the $d=3$ integration thread);
- treat the monomial-basis limit theorems (torus distribution) as motivation or a secondary
  result, unless the dominated-convergence argument is completed;
- the genuinely open technical frontier is then the numerator (gap 5): eigenvector norms /
  $\|[\det Q]_\mathcal{B}\|$ at a generic root of a Kostlan-random system.

The evidence so far (both analytic and numerical) consistently points to the conclusion that
random systems are well-conditioned for these methods — i.e., the worst-case instability of
`[NT]`/`[GT]` is atypical — and no result in the notes contradicts it.
