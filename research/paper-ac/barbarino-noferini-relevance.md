# Barbarino–Noferini: relevance to average and smoothed conditioning

14 September 2026. This note distinguishes results in the sources from deductions and possible next steps. It also records the clarification made to the draft's introduction concerning Armentano–Beltrán.

## Sources and models

1. Giovanni Barbarino and Vanni Noferini, *The limit empirical spectral distribution of Gaussian monic complex matrix polynomials*, **Journal of Theoretical Probability 36** (2023), 99–133, [published article](https://doi.org/10.1007/s10959-022-01163-3). Local source: [`2005.07501v2.pdf`](../../papers/2005.07501v2.pdf), arXiv version dated 19 February 2022. The article appeared online in 2022; its volume year is 2023. Below: **BN-monic**.
2. The same authors, *The limit empirical spectral distribution of complex matrix polynomials*, **Random Matrices: Theory and Applications 11**(3) (2022), 2250023, [published article](https://doi.org/10.1142/S201032632250023X), [preprint](https://arxiv.org/abs/2102.02058). Local source: [`2102.02058v3.pdf`](../../papers/2102.02058v3.pdf), arXiv version dated 29 September 2021. Below: **BN-general**. This file is byte-identical to the existing `papers/berberino-noferini.pdf`; both copies have been preserved.

Use $m$ for matrix size and $k$ for degree. These are **polynomials in one scalar variable**, even when $m>1$. Their eigenvalues are the roots of a determinant. Matrix size is not the number of variables in a polynomial system.

| Source | Random input | Principal output |
| --- | --- | --- |
| BN-monic | $P(z)=I_m z^k+\sum_{j<k}C_jz^j$, with independent standard complex Gaussian entries in the $C_j$ | Almost-sure limits of empirical eigenvalue measures as $m$ or $k$ grows; auxiliary singular-value estimates |
| BN-general | $P(z)=\sum_{j=0}^k\alpha_j C_jz^j$, including a random leading matrix; independent entries with specified moments and, for the degree limit, density assumptions | Universal empirical eigenvalue limits governed by the coefficient weights |
| Our companion theorem | All scalar coefficients $a_0,\ldots,a_n$ are independent standard complex Gaussians | The condition number of an eigenvalue under arbitrary perturbations of the induced companion matrix |

BN-general includes our exact scalar input model by taking $m=1$ and all weights equal to one. BN-monic does not: dividing our polynomial by its random leading coefficient produces dependent Gaussian ratios, not independent Gaussian lower coefficients with a fixed leading coefficient.

## The Armentano–Beltrán distinction

Armentano–Beltrán's [*The polynomial eigenvalue problem is well conditioned for random inputs*](https://doi.org/10.1137/17M1139941), Theorem 1.1, concerns the eigenvalue problem for a matrix polynomial $Q(z)=\sum_j B_jz^j$. The perturbable input is the entire tuple of coefficient matrices, with norm $\bigl(\sum_j\|B_j\|_F^2\bigr)^{1/2}$. The random entries in that tuple are independent Gaussians. In matrix size greater than one, this does not mean independently perturbing the scalar coefficients of $\det Q$.

Their Remark 1.4 discusses companion algorithms and both polynomial rootfinding and matrix-polynomial eigenvalue problems. It should not be described as a remark solely about scalar coefficient perturbations. Their scalar specialization, Section 3.1, is nevertheless directly relevant: it gives the draft's displayed exact Fubini–Study condition identity for our scalar ensemble.

Our separate companion problem takes $C_p$ as input and permits arbitrary matrix perturbations. Writing its eigenproblem as $zI-C_p$ does not meet their Gaussian tuple hypothesis: $I$ is fixed, while $C_p$ has fixed entries and dependent coefficient ratios. The distinctions are the input space, perturbation metric, and input probability law. Both problems are legitimately eigenvalue problems. The revised introduction now says this explicitly before the main theorem and in the literature discussion.

## What the spectral-distribution results give

For a regular degree-$k$, size-$m$ polynomial with invertible leading coefficient, define

\[
 \nu_P=\frac1{mk}\sum_{\det P(\lambda)=0}\delta_\lambda,
\]

counting multiplicities. Sampling the input and then a uniform eigenvalue gives marginal law $\mathbb E\nu_P$. Almost-sure weak convergence of $\nu_P$ to a deterministic measure therefore implies weak convergence of this marginal: apply dominated convergence to bounded continuous test functions.

**BN-monic, Theorems 3.1 and 4.1.** At fixed degree $k$, as $m\to\infty$, the measure of the rescaled eigenvalues $\lambda/\sqrt m$ converges to

\[
 \frac{k-1}{k}\delta_0+\frac1k\operatorname{Unif}(\{|z|\le1\}).
\]

At fixed matrix size, as $k\to\infty$, the unscaled empirical measure converges to the uniform measure on the unit circle. The different limits make the asymptotic parameter and scaling essential.

**BN-general, Theorem 1.1.** At fixed degree, as matrix size grows, take the case $\alpha_0\alpha_k\ne0$, which covers our setting. The limiting density is

\[
 f_k$z$=\frac1{4\pi k}\Delta\log S_k$z$,\qquad
 S_k$z$=\sum_{j=0}^k|\alpha_j|^2|z|^{2j},
 \quad\Delta=\partial_x^2+\partial_y^2.
\]

Thus the same kernel geometry appears: $\Delta=4\partial_z\partial_{\bar z}$, so the density is $H/(\pi k)$ in the scalar notation of our draft. The source also allows initial zero weights; the formula above deliberately states the nonvanishing-constant case.

**BN-general, Theorem 1.2.** In the degree limit, with matrix size $m(k)=O(k^P)$, the authors give a universal limit under independent, centered, unit-variance entries with continuous densities uniformly bounded in $k$, together with assumptions on the limiting normalized logarithm of the weight kernel. Equal weights give the uniform unit-circle limit. In particular, the theorem applies to our scalar Gaussian ensemble.

These results do not by themselves give $\mathbb E\Lambda^q$, a condition tail, or a logarithmic condition average. Conditioning involves additional eigenvector data and potentially unbounded functions; weak convergence alone does not control those averages. A simple illustration is

\[
 M_t=\begin{pmatrix}0&t\\0&1\end{pmatrix},\qquad t\ge0.
\]

Its eigenvalues are always $0,1$, whereas the absolute eigenvalue condition at either eigenvalue is $\sqrt{1+t^2}$. Our own $\mathbb E_\star\Lambda^2=2\log n+O(1)$, despite root concentration near the unit circle, demonstrates why this distinction matters in the companion ensemble itself.

## An exact Gaussian connection: an elementary deduction

The following observation is derived here to explain the common kernel; it is not presented as a new result or attributed to BN as a finite-size theorem.

If all $C_j$ are independent standard complex Gaussian matrices and $\alpha_0\alpha_k\ne0$, then **for every matrix size and degree**,

\[
 \mathbb E\nu_P=\frac1{4\pi k}\Delta\log S_k$z$\,dA$z$.
\]

Indeed, at each fixed $z$,

\[
 P$z$\overset{d}=\sqrt{S_k$z$}\,G_m,
 \qquad
 \mathbb E\log|\det P$z$|
 =\frac m2\log S_k$z$+c_m,
\]

where $G_m$ is a standard square complex Gaussian matrix and $c_m=\mathbb E\log|\det G_m|$ is finite. The one-variable distributional identity

\[
 \nu_P=\frac1{2\pi mk}\Delta\log|\det P$z$|
\]

then proves the assertion. Interchanging expectation and distributional differentiation is justified on compact sets: $S_k$ is positive and bounded above and below there, and $\mathbb E|\log|\det G_m||<\infty$. The latter follows, for example, from the Gaussian QR decomposition, in which squared diagonal lengths have gamma distributions.

For equal weights the radial variable $r=|Z|^2$ consequently has density

\[
 \frac1k\left(r\frac{S_k'(r)}{S_k(r)}\right)',
 \qquad S_k(r)=\sum_{j=0}^k r^j,
\]

for every $m$, not just $m=1$. This is a useful exact root-location benchmark for any future block-companion study. Equality of expected measures is weaker than BN's almost-sure limit and universality conclusions.

## Tools that may help with conditioning

The most directly relevant auxiliary result is **BN-monic, Theorem A.5** (local PDF p. 14). For $R=D+G\in\mathbb C^{m\times M}$, $M\ge m$, arbitrary deterministic $D$, and independent $G_{ij}\sim\mathcal{CN}(0,1/m)$, put $q=M-m+1$. Their bound is

\[
 \mathbb P\{\sigma_m(R)\le\tau\}
 \le \frac{(mM e^2)^q}{\sqrt{2\pi}\,q^{2q+1/2}}\tau^{2q}.
\]

It is uniform in the deterministic center, includes square matrices, and extends the cited Bürgisser–Cucker estimates. This makes it a natural ingredient for a smoothed problem after the actual noise covariance and scaling have been identified. It is an ordinary noncentral Gaussian estimate; the Jacobian at a sampled root has an additional determinant weight. In particular, our centered square/rectangular Wishart correspondence cannot simply be asserted for noncentral laws.

A detail to handle carefully if reusing their proof: the unitary step at equation (19) rotates the deterministic mean as well as the Gaussian part. For a fixed nonzero mean the law need not be unitarily invariant. The subsequent estimate is uniform in the mean, which permits the needed bound uniformly over the rotated means; an argument in our notation should formulate that step as a uniform bound. This observation concerns the presentation of the proof, not a counterexample to the theorem.

Their companion estimates also use a deterministic block shift or block circulant plus a Gaussian correction and the Woodbury identity. **Lemma A.11** (local PDF p. 21) gives, for fixed $m$ and fixed $z$ with $|z|\ne1$, an eventual almost-sure bound

\[
 \sigma_{mk}(M_k-zI)\ge t(m,z)k^{-2}.
\]

This controls a resolvent at a fixed point away from the unit circle. Eigenvalue conditioning instead involves its residue:

\[
 \Pi_\lambda=\lim_{z\to\lambda}(z-\lambda)(zI-M)^{-1}
 =\frac{rw^*}{w^*r},\qquad
 \|\Pi_\lambda\|_2=\Lambda(M,\lambda).
\]

One cannot substitute a random eigenvalue for that fixed $z$: the shifted matrix is then singular. A useful extension would control these residues through the same reduced resolvent, with quantitative estimates at the relevant distance from a selected eigenvalue. This is a proposed route, not a consequence already established by Lemma A.11.

## Consequences for the project

The two papers should be cited for root geometry and structured random-matrix tools. Their stated results do not supply our companion moment profile, nor the intended average conditioning theorem for multivariate algebraic rootfinding. This is a comparison with these papers, not a complete priority search.

An intermediate model is a Gaussian matrix polynomial with an explicitly chosen block companion: its root-location marginal is already available, while its companion-overlap moments remain a separate question. That would enlarge the representation case study but still concern one polynomial variable.

For the original multivariate goal, the next decisive step remains an explicitly specified bivariate resultant or multiplication construction, its induced random law, and its perturbation norm. Elimination matrices reuse coefficients, so independent-entry hypotheses cannot be assumed. BN's reductions suggest techniques; any application must prove the required singular-value or residue bounds for those dependent entries. For a smoothed extension, the corresponding determinant-weighted noncentral estimate is another necessary step.

The manuscript now includes the corrected Armentano–Beltrán comparison, both BN citations, and a brief explanation of the resolvent-residue distinction. The main theorem and its proofs are unchanged. The exact Gaussian expected-measure observation above is retained as a research note rather than added to the paper's main claims.
