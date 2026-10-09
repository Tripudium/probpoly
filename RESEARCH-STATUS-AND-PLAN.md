# Research status and proposed theorem program

12 September 2026. Assessment of the sources currently in this directory, with targeted checks of the primary literature. This is a research audit and plan, not a certification of the manuscript. Existing drafts have been preserved.

## 1. Assessment

The project has a sound and useful mathematical core: Gaussian conditioning, marked Kac–Rice, the determinant-weighted law at a randomly selected root, and the interpretation of normal-form eigenvalue conditioning as interpolation conditioning. The current manuscript is substantially ahead of `PROBLEM-ASSESSMENT.md`, which primarily describes the archived notes. Its strongest advertised conclusions, however, are ahead of its proofs.

The immediate problem is not a lack of formulas. It is that several different perturbation models, quotient bases, compactifications, and meanings of “typical” have been combined. These distinctions affect leading terms, particularly because the manuscript correctly identifies contributions from roots outside the unit polydisk. The conclusions that Cayley is relatively neutral, that the normal-form overlap is proved bounded in two variables, and that rational univariate representation is the unique exponentially penalized method should not currently be presented as established results.

I recommend a narrower first paper: **local root geometry versus the additional conditioning of an explicitly specified algebraic representation**. Use the Gaussian box model for concrete algebraic constructions, and its kernel metric to formulate the local theory. The Kostlan model should be an invariant comparison and consistency check. A complete univariate overlap theorem and one rigorous bivariate result would make a much stronger foundation than a partly justified classification of every method.

Several useful improvements emerged during this audit. There is an elementary route to the univariate bounded-overlap theorem through a tridiagonal Gram matrix; the normalized Jacobian admits a sharp fourth-power inverse-norm tail; the Cayley Frobenius second moment has an exact all-dimensional formula; and averaging the projection direction gives an exact elimination-energy identity for every fixed root configuration. These are developed below, with their status distinguished from conjectures.

## 2. What is in the project

| Material | Current role and status |
|---|---|
| `main.tex`, `sections/*.tex` | The most developed manuscript. The abstract is unfinished; its introduction and conclusion overstate several later arguments. |
| `probpoly.tex` | An alternative, much shorter restart. It stops in an unfinished Kac–Rice theorem. It is not the most complete paper. |
| `survey.tex`, `survey.bib` | A useful map of the algebraic methods, with some exact algebraic corrections needed. It also repeats conclusions from the research manuscript that are not yet secure. |
| `old/main.tex`, `old/main_clean_under_construction.tex` | Brainstorming on random Jacobians, root measures, and a planted-root quadratic model. Several computations and interpretations require correction. |
| `old/convergence.tex` | A substantially better potential-theoretic approach to root-measure convergence than the earlier conditional-slice arguments. Its assumptions and technical proof steps still need an explicit audit trail. |
| `PROBLEM-ASSESSMENT.md`, `CLAUDE.md` | Historically useful but outdated descriptions of the files and mathematical state. In particular, the current main file does include a bibliography and the root Palm weight. |
| `figs/`, numerical tables embedded in the TeX | Exploratory evidence. The repository did not contain the scripts, seeds, or raw datasets needed to reproduce the current tables. |

There is no Git repository at this directory level. The small checks added for this assessment are listed in Section 8; they do not reproduce the manuscript's full numerical experiments.

### Mathematical status by component

| Component | Assessment |
|---|---|
| Idempotent identity and Wilkinson overlap, `sections/reduction1.tex` | Correct and conceptually valuable. Closely related statements already occur in Graf–Townsend; the novelty must be in the probabilistic consequences. |
| Conditional covariance, intensity, marked Kac–Rice, rectangular Wishart tilt | Sound backbone; consolidate notation and hypotheses. Use a consistent complex covariance convention. |
| Exact Gaussian box root density and radial symmetry | Correct. Several consequences can be proved more simply than in the draft. |
| Fixed-dimension local logarithmic asymptotics | Leading terms are credible and can be established with elementary uniform bounds. Some displayed proofs use false pointwise tail bounds or incompletely justified limit exchanges. |
| Closed-form constants in `sections/local.tex` | Some integral evaluations are described as “certified numerically.” Numerical agreement is not an analytic evaluation. Keep the constants as conjectural until derived. |
| Finite logarithmic normal-form overlap for a fixed generic basis | The rational trace-form argument is credible. Its quantitative polynomial-in-degree claim needs explicit degree, size, and normalization bounds. |
| Bounded overlap in one variable | A good theorem to complete now. A direct repair is supplied below. |
| Bounded overlap in two variables | Open as written. The proof invokes a finite numerical grid for a uniform estimate and changes from an unspecified monomial basis to a particular Bézout companion basis. |
| Cayley signed log average of the displayed local expression | Substantial, plausibly recoverable mathematics. Its interpretation as an actual condition comparison needs the perturbation domain fixed. |
| Cayley relative neutrality | Not proved: the necessary operator-norm estimate is not established by a Frobenius moment or sampled exponents. |
| Elimination/RUR asymptotics and relative classification | Incomplete: require genuine two-point control, integrability of logarithmic singularities, and correct coefficient norms. |
| Total-degree extension, MEP, Macaulay | Separate research extensions. The manuscript currently mixes degree models and, in places, incompatible regularity hypotheses. |
| Smoothed analysis | No completed smoothed theorem for an algebraic method appears in the current draft. |

The prior worst-case results remain the motivation: [Noferini–Townsend](https://arxiv.org/abs/1507.00272) for hidden-variable resultants and [Graf–Townsend](https://arxiv.org/html/2408.02805v1) for further algebraic methods. The latter is now published in *Linear Algebra and its Applications* 729 (2026), 308–336. The targeted literature check did not find an existing theorem settling this project's proposed average-case classification; that is not an exhaustive novelty claim.

## 3. Corrections that change the research conclusions

### 3.1 Fix the perturbation space first

Write

\[
p_i(z)=c_i^T\phi(z),\qquad S(z)=\|\phi(z)\|_2^2.
\]

For Euclidean perturbations of the full coefficient array and Euclidean error in the root, the exact absolute condition number is

\[
\boxed{\kappa_{\mathrm{coeff}}(P,z)=\sqrt{S(z)}\,\|J(z)^{-1}\|_2.}
\]

Indeed, \(\delta z=-J^{-1}E_z\delta c\), and \(E_zE_z^*=S I_d\). The draft's \(\|J^{-1}\|\) measures perturbations to the **equation values**. This is a legitimate residual condition number, but it is not automatically the coefficient condition number.

Similarly, for an eliminant in a specified perturbable basis \(\psi\),

\[
\kappa_{\mathrm{coeff}}(f,\lambda)=\frac{\|\psi(\lambda)\|_2}{|f'(\lambda)|}.
\]

If the leading coefficient is fixed, omit its basis vector from \(\psi\). Multiplying \(1/|f'|\) by a coefficient norm does not supply the missing evaluation factor.

There is also a domain issue in `sections/family.tex:15–32` and `sections/relative.tex:18–27`. A degree-m polynomial bounded by one on the unit disk can have value \(|\lambda|^m\) outside it. Its evaluation norm is \(\max(1,|\lambda|)^m\). For box-degree-n polynomials the analogous factor is \(\prod_l\max(1,|z_l|)^n\). Thus fixed-polydisk formulas cannot be applied unchanged to all roots. This matters at leading order, not only on a negligible set.

An ordinary matrix eigenvalue condition is \(\Lambda\); the factor \(1+|\lambda|\) corresponds to a particular two-matrix pencil perturbation model. State which intermediate problem the algorithm solves. For a single recovered coordinate \(g(z)\), the matching coefficient condition is \(\sqrt S\,\|Dg(z)J^{-1}\|_2\), rather than the full-root condition unless that comparison is explicitly intended.

Relative conditioning must be derived from these absolute derivatives using the same input and output spaces. It is invariant under appropriate scalar rescalings; it is not invariant under arbitrary nonunitary changes of variables or quotient basis.

### 3.2 An intermediate condition number is not an algorithmic error bound

Keep three maps separate:

\[
c\ \longmapsto\ D(c)\ \longmapsto\ \text{spectral/scalar solution}\ \longmapsto\ z.
\]

The exact composite derivative is always \(-J^{-1}E_z\). Consequently coefficient-induced perturbations of an exact algebraic representation recover the original sensitivity. Amplification enters when the intermediate solve admits additional perturbation directions, or through inaccurate construction and recovery. A favorable condition number for the intermediate eigenproblem alone does not prove forward or backward stability of the whole method.

A useful eventual result would quantify how backward errors of a specified construction/solver/recovery pipeline translate to coefficient backward errors. That is a stronger and different task from the present signed logarithmic averages.

### 3.3 Several proof gaps are substantive

* **Overlap:** `sections/structural.tex:139–195` does not prove the stated all-n, all-root bivariate envelope. A grid at n=40 cannot establish it. The univariate conditional formula also has an extra factor \(1/\pi\): the prefactor should be \(1/(2\pi)\), not \(1/(2\pi^2)\). At n=1 the overlap is identically one, while the printed formula gives \(1/\pi\).
* **Basis:** the bivariate argument concerns \(\{x_1^i x_2^j:0\le i<n,\ 0\le j<2n\}\), associated with a particular Bézout companion construction. It does not prove a result for an arbitrary Gröbner staircase or an adaptive numerical basis. Arbitrary rescaling of a basis can make overlaps arbitrarily bad; a Lagrange basis makes them one but requires knowing the roots.
* **Adjugate:** `sections/family.tex:377` incorrectly infers that a simple zero of \(\det S(\lambda)\) makes zero a simple matrix eigenvalue of \(S(\lambda)\). For example,
  \[
  S(x)=\begin{pmatrix}1&-1\\1&x-1\end{pmatrix},\qquad\det S(x)=x,
  \]
  yet \(S(0)\) is nonzero nilpotent. Use its nonzero singular values when expressing \(\|\operatorname{adj}S\|\).
* **Eliminant norm:** `sections/relative.tex:63–75` effectively replaces a coefficient norm by Mahler measure. These can differ exponentially: \((t-1)^N\) has Mahler measure one and coefficient 2-norm \(\sqrt{\binom{2N}{N}}\). Nearby polynomials with distinct roots retain the discrepancy. A separate norm theorem is necessary.
* **MEP:** the absolute condition is for an operator-determinant generalized eigenproblem, whereas the relative conversion uses a coefficient-block norm. These are different data spaces. The same discussion also switches between total and separate degree.
* **Statistics:** a close-pair mechanism gives a lower bound on overlap, not an upper bound on all overlap events. Integrability of pair collisions does not control collective near-dependence of evaluation vectors. One-point root convergence likewise does not establish a singular two-point logarithmic-energy limit.

The detailed audit also contains a useful repair for the Sylvester Palm expectation: logarithms of nonzero Gaussian quadratic norms change by at most \(O_d(1)\) under the normalized Jacobian-determinant tilt. This removes an independence assumption without asserting independence; see the supporting main-theorem audit.

### 3.4 The algebraic geometry must match the ensemble

Generic box systems have no boundary roots in their toric compactification \((\mathbb P^1)^d\). Their ordinary homogenizations to degree dn **do** have roots at infinity: all top homogeneous parts are multiples of \((x_1\cdots x_d)^n\). A dense projective Macaulay argument requiring no roots at infinity therefore cannot be imported unchanged. Specify a toric/multihomogeneous construction or the saturation and deflation being used.

The survey also needs two short exact corrections. Its Barnett product has the wrong order for its companion convention; the correct form is \(B(q_1,q_2)=q_2(C_{q_1})B(q_1,1)\). Its Macaulay row selection cannot retain all polynomial-multiple rows once they contain syzygies. More conceptually, Bézoutian duality uses the residue pairing

\[
\operatorname{Res}(fg)=\sum_j\frac{f(z_j)g(z_j)}{\det J(z_j)},
\]

which differs from the ordinary trace pairing by the Jacobian class. This distinction should explain the determinant cancellation, rather than being hidden in notation.

### 3.5 “Typical” and the asymptotic regime need explicit meanings

The current main statistic is the expectation of a signed logarithm at a uniformly chosen root, averaged over systems. It is neither a median nor a high-probability guarantee, and outer roots can change its leading coefficient. It also does not control the worst root of a sampled system. A claim that bad conditioning is a tail event should be backed by a bound on \(\log^+\) or a fractional moment/tail, not just a possibly negative signed mean.

Almost all current asymptotics fix d and let n grow. The motivating exponential worst cases emphasize growth in d. Bounds \(O_d(1)\) do not resolve that question. Even polynomial growth in \(N=d!n^d\) may be exponential in d. A joint dimension/degree statement is a distinct later milestone.

## 4. A coherent framework

Take d independent, centered, circular complex Gaussian components, expanded in a common orthonormal coefficient basis with independent \(\mathcal{CN}(0,1)\) coordinates. Use that same coefficient norm when defining \(\kappa_{\mathrm{coeff}}\). The components share kernel K; put \(S(z)=K(z,z)\). Define the positive Hermitian matrix H by

\[
\mathbb E[Dp(z)^*Dp(z)\mid p(z)=0]=S(z)H(z).
\]

With column-vector conventions, \(H_{jk}=\partial_{\bar z_j}\partial_{z_k}\log S\). This definition avoids transpose ambiguities in complex covariance notation. H is the pullback Fubini–Study metric of the coefficient evaluation map.

Select a system and then one of its N simple roots uniformly, assuming N is almost surely fixed. Denote this probability law by \(\mathbb P_*\). It is the probability law encoded by the normalized marked Kac–Rice formula. Distinguish it from merely conditioning on \(P(z)=0\), and from planting a root by fixing the constant coefficient.

Define

\[
A(z)=S(z)^{-1/2}J(z)H(z)^{-1/2}.
\]

The local coefficient-to-root condition, when root displacements are measured in H, is exactly \(\|A^{-1}\|_2\). This normalization has a geometric meaning and does not require choosing an unspecified random scalar \(h_\bullet\).

For the representation term, retain the deterministic identity

\[
[\det Q]=\det J(z_j)[\ell_j],\qquad
\Lambda_j=\|V^{-T}e_j\|\,\|Ve_j\|.
\]

Equivalently, for \(G_V=V^*V\),

\[
\Lambda_j^2=(G_V)_{jj}(G_V^{-1})_{jj}
=\frac{\|v_j\|^2}{\operatorname{dist}(v_j,\operatorname{span}_{k\ne j}v_k)^2}.
\]

Thus the remaining normal-form question is a precise question about interpolation angles in a specified normed polynomial space. The idempotent interpretation is already implicit in [Graf–Townsend, Section 6](https://arxiv.org/html/2408.02805v1); its clean separation from the Gaussian local law is the useful research direction.

## 5. Proposed theorem statements, ordered by readiness

### A. Universal local law and a sharp tail

**Status: direct consequence of the sound Kac–Rice machinery and classical Wishart formulas; ready to write carefully, not a claim of a new random-matrix law.**

Assume the common-kernel Gaussian model above, \(H(z)>0\), almost surely N simple roots, and the usual marked Kac–Rice hypotheses. Under \(\mathbb P_*\), the root location has density

\[
\frac{d!}{N\pi^d}\det H(z),
\]

and A is independent of the location, with density

\[
\frac{|\det A|^2e^{-\|A\|_F^2}}{d!\pi^{d^2}}\,dA.
\]

In particular \(A^*A\) has the same law as \(B^*B\), where B is \((d+1)\times d\) standard complex Gaussian. The full A law is an induced Ginibre law, not an ordinary Ginibre law; see [Fischmann et al.](https://arxiv.org/abs/1107.5019).

For \(\kappa_H=\|A^{-1}\|_2\),

\[
\boxed{\mathbb P_*(\kappa_H>t)\le
\min\left(1,\frac{d(d+1)}{4t^4}\right),\qquad t>0,}
\]

and the fraction on the right is asymptotically exact as \(t\to\infty\) for fixed d. Consequently \(\mathbb E_*\kappa_H^q<\infty\) exactly for \(0<q<4\), and

\[
\mathbb E_*\|A^{-1}\|_F^2=d,
\qquad
\mathbb P_*\left(\kappa_H/\sqrt d>t\right)\le\min(1,1/(2t^4)).
\]

**Proof route.** Gaussian regression gives the unweighted conditional law. Kac–Rice multiplies it by \(|\det A|^2\), whose expectation is d!. The smallest eigenvalue X of \(B^*B\) has density

\[
f_d(x)=x e^{-dx}L_{d-1}^{(2)}(-x)
=x e^{-dx}\sum_{k=0}^{d-1}\binom{d+1}{k+2}\frac{x^k}{k!}.
\]

This formula is given in [Kumar–Sambasivam–Anand, Section 2.2](https://arxiv.org/html/1701.07402v2). Bound the binomial coefficient by \(\binom{d+1}{2}d^k\); then \(f_d(x)\le d(d+1)x/2\). Integrate up to \(t^{-2}\). The expansion at zero proves sharpness. The inverse-Wishart first moment gives the Frobenius identity.

This supplies a genuine tail statement for local conditioning, uniform in degree and ensemble after geometric normalization. It does not yet bound an algebraic algorithm's additional amplification.

### B. Exact box root law and a coefficient-consistent decomposition

**Status: ready to consolidate; the leading asymptotic needs only elementary uniform estimates.**

Let \(k_n(r)=\sum_{j=0}^n r^j\), \(h_n=(r k_n'/k_n)'\), and \(N=d!n^d\). For the Gaussian box model, the coordinates of the selected root Z are independent under \(\mathbb P_*\), with uniform angles. For \(R_l=|Z_l|^2\),

\[
\mathbb P_*(R_l\le r)=\frac{r k_n'(r)}{n k_n(r)},\qquad
\frac{d\mathbb P_*}{dr}=\frac{h_n(r)}n.
\]

For \(s_l=n\log R_l\), inversion symmetry and the explicit CDF give

\[
\mathbb P_*(|s_l|>t)\le\min(1,2/t),\qquad
\mathbb E_*\log_+R_l=\frac{\log(n+1)}n.
\]

Here the independence concerns coordinates of **one selected root**, not distinct roots of the same system. The identities immediately control expected fractions of roots outside an annulus, without estimating the largest root.

Fix a monomial basis valid on a generic coefficient chart, take multiplication by \(g=x_1\) (whose values at the roots are distinct almost surely in this ensemble), and define \(\Theta_{n,d}^{\mathcal B}=\mathbb E_*\log\Lambda_{\mathcal B}\). Then, for ordinary multiplication-matrix eigenvalue conditioning \(\kappa_{\mathrm{eig}}=\Lambda_{\mathcal B}\),

\[
\boxed{\mathbb E_*\log\frac{\kappa_{\mathrm{eig}}}{\kappa_{\mathrm{coeff}}}
=\log n+\Theta_{n,d}^{\mathcal B}+O_d(1),\qquad n\to\infty.}
\]

The same leading formula holds with the draft's pencil factor \(1+|Z_1|\), since its expected logarithm is bounded. This is a comparison of the explicitly stated intermediate eigenvalue and full-root conditions, not an end-to-end stability theorem.

**Why the coefficient is one.** Exact cancellation gives

\[
\log(\kappa_{\mathrm{eig}}/\kappa_{\mathrm{coeff}})
=\log\Lambda_{\mathcal B}+\log\sigma_{\min}(J/\sqrt S).
\]

In the box model \(H=\operatorname{diag}(h_n(R_l))\). Truncated-geometric variance bounds and inversion symmetry give
\(\mathbb E_*|\log(h_n(R_l)/n^2)|=O(1)\). The singular-value sandwich and Theorem A imply
\(\mathbb E_*\log\sigma_{\min}(J/\sqrt S)=\log n+O_d(1)\).

For comparison, the residual metric gives the draft's \((d+1)\log n\). Its extra term can be explained without matched asymptotic integration:

\[
\mathbb E_*\log k_n(R)
=\mathbb E_*\log k_n(e^{-|s|/n})+\log(n+1)
=2\log n+O(1).
\]

The first equality is exact, by reversal and the explicit positive log-radius moment. The second follows from the elementary bounds \(n/(1+|s|)\le k_n(e^{-|s|/n})\le n+1\) and the uniform logarithmic depth moment. Thus the outer-root contribution is real, but much of it is evaluation scaling rather than additional interpolation instability.

### C. Bounded univariate overlap through a tridiagonal matrix

**Status: a proof route derived in this assessment; substantially closes the draft's univariate gap. Complete the elementary estimates in the manuscript before calling it a finished proof there.**

Let \(p(z)=\sum_{k=0}^n a_kz^k\) with i.i.d. standard complex Gaussian coefficients, and use the companion monomial basis \(1,x,\ldots,x^{n-1}\). There is an absolute constant C such that

\[
0\le\frac1n\mathbb E\sum_{p(z_j)=0}\log\Lambda_j\le C
\quad\text{for every }n\ge1.
\]

It follows from B that the coefficient-consistent signed logarithmic ratio is \(\log n+O(1)\); in the residual metric it is \(2\log n+O(1)\).

**A short proof architecture.** At a fixed z, write \(p(x)=(x-z)q(x)\). Let \(D_z:\mathbb C^n\to\mathbb C^{n+1}\) be coefficient multiplication by \(x-z\), and \(T_z=D_z^*D_z\). Under ordinary conditioning on \(p(z)=0\), the coefficient vector of q is Gaussian with covariance \(T_z^{-1}\). Its eigenvalues are explicitly

\[
\lambda_k(T_z)=1+r-2\sqrt r\cos\frac{k\pi}{n+1},
\quad k=1,\ldots,n,\quad r=|z|^2.
\]

The Palm factor \(|p'(z)|^2\) cancels the same denominator in the Lagrange polynomial \(q/p'(z)\). Hence the exact conditional second moment is

\[
\boxed{\mathbb E_*[\Lambda^2\mid Z=z]
=\frac{k_{n-1}(r)}{k_n(r)h_n(r)}\operatorname{tr}(T_z^{-1}).}
\]

This replaces the double integral by an elementary resolvent trace. It gives \(2n/(n+1)\) on the unit circle and one identically when n=1.

To bound it, use reversal to assume \(\rho=|z|\le1\). For \(1/2\le\rho\le1\), put \(\delta=1-\rho\). Uniformly in n,

\[
h_n(\rho^2)\ge\frac{c}{(\delta+1/n)^2},\qquad
\operatorname{tr}(T_z^{-1})\le\frac{Cn}{\delta+1/n}.
\]

The first is a lower bound on the variance of a truncated geometric distribution; it follows by taking two separated blocks of indices of size comparable to \(\min(n,1/\delta)\). The second follows by summing
\(1/[\delta^2+c(k/n)^2]\). For \(\rho\le1/2\), use \(h_n\ge c\) and \(\operatorname{tr}(T_z^{-1})\le Cn\). Since \(k_{n-1}/k_n\le1\), this proves

\[
\mathbb E_*[\Lambda^2\mid Z=z]\le C(1+|n\log|z|^2|).
\]

Conditional Jensen now gives

\[
\mathbb E_*\log\Lambda
\le\tfrac12\log C+\tfrac12\mathbb E_*\log(1+|s|)=O(1),
\]

using the exact uniform tail in B. No convergence of a sampled envelope is needed. The unconditional second moment can still grow logarithmically; that is why conditioning on depth before Jensen is useful.

**A relative-condition corollary.** Let \(C_p\) be the ordinary monic companion matrix, and define

\[
\kappa_{\mathrm{eig,rel}}=\Lambda\frac{\|C_p\|_2}{|z|},\qquad
\kappa_{\mathrm{coeff,rel}}=\frac{\sqrt{k_n(|z|^2)}}{|p'(z)|}\frac{\|a\|_2}{|z|}.
\]

Then

\[
\mathbb E_*\log\frac{\kappa_{\mathrm{eig,rel}}}{\kappa_{\mathrm{coeff,rel}}}
=\log n+O(1).
\]

Indeed, the output scales cancel, and the remaining data-scale correction is bounded. With \(b=(a_0,\ldots,a_{n-1})/a_n\),
\(\|b\|\le\|C_p\|_2\le\sqrt{1+\|b\|^2}\). Gaussian radial moments therefore give

\[
\frac\gamma2-\frac1{2n}\le
\mathbb E\log\|C_p\|_2-\mathbb E\log\|a\|_2
\le\frac\gamma2.
\]

A data-only statistic has the same expectation under the selected-root law because the number of roots is fixed. This is a concrete relative comparison of two specified condition numbers. It still does not include errors in constructing the companion matrix or establish a tail bound for the ratio.

### D. Exact Cayley data scale, followed by an operator-norm problem

**Status: exact second-moment identity derived during the audit; the operator-norm upper bound remains a target.**

For the canonical monomial Cayley matrix \(R_{\mathrm{Cay}}(\lambda)\) of the box model, at any fixed \(|\lambda|=1\),

\[
\boxed{\mathbb E\|R_{\mathrm{Cay}}(\lambda)\|_F^2
=d!(n+1)^{d^2-d+1}\left(\frac{n(n+2)}6\right)^{d-1}.}
\]

**Reason.** The divided-difference determinant uses a chain of d evaluation points differing in one coordinate at a time. On the torus, their normalized covariance has entries equal to products of successive correlations, so its determinant factors as \(\prod_l(1-|a_l|^2)\). Gaussian determinant moments and Parseval reduce the calculation to the finite sum \(\sum_{m=1}^n m(n+1-m)=n(n+1)(n+2)/6\). See the supporting audit for the full derivation.

Fixed-degree Gaussian polynomial anti-concentration then gives

\[
\mathbb E\log\|R_{\mathrm{Cay}}(\lambda)\|_F
=\frac{d^2+d-1}{2}\log n+O_d(1).
\]

The matrix size is \((d-1)!n^{d-1}\). Therefore the elementary spectral/Frobenius comparison yields only

\[
\frac{d^2}{2}\log n-O_d(1)
\le\mathbb E\log\|R_{\mathrm{Cay}}(\lambda)\|_2
\le\frac{d^2+d-1}{2}\log n+O_d(1).
\]

The natural next theorem is a matching upper bound with leading coefficient \(d^2/2\), including the supremum over \(|\lambda|=1\) if that is the chosen data norm. This would address the missing step behind relative neutrality. It requires a proof using the particular correlated Gaussian polynomial matrix structure; generic random-matrix intuition does not supply it.

### E. First genuinely multivariate overlap target

**Status: conjectural.** For two independent Gaussian bidegree-(n,n) polynomials and the specifically defined generic box basis

\[
\mathcal B_n=\{x_1^i x_2^j:0\le i<n,\ 0\le j<2n\},
\]

prove

\[
\sup_n\mathbb E_*\log\Lambda_{\mathcal B_n}<\infty.
\]

First establish generic validity of this basis and the exact correspondence with the ordinary companion multiplication matrix. Then derive, with all normalizations, the conditional Gaussian integral supplied by the Bézout identity. A sufficient estimate is

\[
\mathbb E_*[\Lambda^2\mid Z=z]
\le C(1+|s_1|)^a(1+|s_2|)^b
\]

for fixed constants C,a,b, uniformly in n and z. The exponent need not be optimal: logarithmic depth integrability already finishes the argument. This is a better immediate target than an exact asymptotic constant. If the estimate fails, investigate whether the failure is confined to this second moment; a fractional moment or a direct log estimate could still prove the theorem.

Do not extrapolate this conjecture to every quotient basis or infer a dimension-three transition from present sample sizes.

### F. Random projection converts elimination into geometric energy

**Status: elementary exact identity, derived independently of the random-system model; ready as a lemma.**

Fix distinct \(z_1,\ldots,z_N\in\mathbb C^d\), choose u uniformly on the complex unit sphere, and set \(f_u(t)=\prod_j(t-u^*z_j)\). Then

\[
\boxed{\mathbb E_u\frac1N\sum_j\log\frac1{|f_u'(u^*z_j)|}
=-\frac1N\sum_{j\ne k}\log\|z_j-z_k\|
+\frac{N-1}{2}H_{d-1}.}
\]

For d=1 take \(H_0=0\). For d≥2 and \(0\le\epsilon\le1\),

\[
\mathbb P_u\left\{\min_{j<k}
\frac{|u^*(z_j-z_k)|}{\|z_j-z_k\|}\le\epsilon\right\}
\le(d-1)\binom N2\epsilon^2.
\]

Both statements follow from \(|u^*v|^2/\|v\|^2\sim\operatorname{Beta}(1,d-1)\). They respect all root correlations and can be averaged over systems afterward. This is an elegant starting point for RUR: understand the ordinary Euclidean logarithmic energy, then add the actual eliminant coefficient norm and evaluation factor. The displayed identity alone concerns value perturbations and does not imply numerical stability or instability of RUR.

### G. A smoothed denominator lemma and a route to actual smoothed analysis

**Status of the matrix lemma: direct proof by projection and Gaussian translation inequalities.** For \(d\ge2\), deterministic \(M\in\mathbb C^{d\times d}\), standard complex Gaussian G, and \(\sigma>0\), let

\[
T(M+\sigma G)=\prod_{i=1}^{d-1}\sigma_i(M+\sigma G)
\]

with singular values in decreasing order. Then, for \(0<q<4\),

\[
\boxed{\mathbb E T(M+\sigma G)^{-q}
\le\sigma^{-(d-1)q}\prod_{k=2}^{d}
\frac{\Gamma(k-q/2)}{\Gamma(k)}.}
\]

Delete one column, use interlacing, and apply Gram–Schmidt to the remaining columns. Conditional residuals are translated isotropic Gaussians. The probability of a centered ball is largest for zero translation, so their lengths stochastically dominate the centered chi factors, with squared lengths \(\operatorname{Gamma}(d,1),\ldots,\operatorname{Gamma}(2,1)\). Conditional stochastic domination can be iterated; independence of the noncentral residuals is not required.

At a centered Gaussian **selected root**, the rectangular law of A gives the related bound

\[
\mathbb E_*\left(\prod_{i=1}^{d-1}\sigma_i(A)\right)^{-q}
\le\prod_{k=3}^{d+1}\frac{\Gamma(k-q/2)}{\Gamma(k)},\qquad0<q<6.
\]

These are sufficient ranges obtained by projection, not claims of optimal moment thresholds for the products. They correct the archived use of a lower bound on \(\mathbb ET\) to bound \(\mathbb E(1/T)\).

**Actual smoothed-method target: not proved.** Fix a precise algorithmic representation, normalization, and bad algebraic set \(\Sigma_M\), including basis failures, discriminant, boundary roots, and projection collisions as appropriate. Prove a deterministic estimate

\[
\log^+\mathcal A_M(c)
\le b+a\log\frac1{\operatorname{dist}_{\mathrm{proj}}(c,\Sigma_M)},
\]

with effective control of a,b and \(\deg\Sigma_M\). Complex tube estimates then offer a bound of the form

\[
\sup_{\bar c}\mathbb E_{c\in B(\bar c,\sigma)}\log^+\mathcal A_M(c)
\le b+C a\{1+\log m+\log\deg\Sigma_M+\log(1/\sigma)\},
\]

where m is coefficient-space dimension and the perturbation is a specified projective-ball law. Use [Bürgisser–Cucker–Lotz](https://arxiv.org/abs/math/0605635) only after proving this domination. For additive Gaussian perturbations, [Cucker–Krick](https://arxiv.org/abs/1905.08321) supplies the relevant extension of conic-condition analysis.

In a direct Gaussian model \(P=P_0+\sigma G\), conditioning at a root gives a noncentral derivative and a noncentral determinant weight. The centered independence law in A cannot simply be reused. The matrix lemma above is an ingredient, not a smoothed theorem for roots or their algebraic representations. Nonconstructive logarithmic integrability is also insufficient: large pole orders a or large b could leave the bound exponentially bad in the parameters of interest.

## 6. Recommended next steps

1. **Freeze the mathematical experiment.** Write a two-page conventions section specifying coefficient ensemble, coefficient norm, output metric, selected-root law, representation/basis, and whether perturbations affect a matrix, a pencil, or a polynomial eigenproblem. Choose the Euclidean coefficient model as the main baseline. Keep residual and sup-norm comparisons as explicitly labeled alternatives. Deliverable: every displayed condition number is the norm of a stated derivative.

2. **Repair the theorem ledger before expanding the paper.** Mark statements as proved, proof sketches, conjectures, or numerical observations. Withdraw the relative classification and the all-basis bivariate overlap claim pending proofs. Correct the survey's Barnett, residue/trace, and Macaulay statements. Make one main manuscript authoritative. Deliverable: the introduction and conclusion claim no more than the body establishes.

3. **Finish A–C as the core.** Consolidate marked Kac–Rice and the universal local law; derive the exact radial CDF and depth bounds; write the tridiagonal proof of the univariate overlap theorem. Avoid pursuing delicate constants until these statements are complete. Deliverable: a self-contained block of finite-n identities and one uniform asymptotic result, with an explicit distinction between known machinery and new consequences.

4. **Choose one multivariate result.** The highest-value normal-form target is E for the specified bivariate basis. The more local alternative is a fully normalized Cayley or Sylvester theorem. Establish D's exact moment in either case. Try to prove the necessary uniform bounds analytically before scaling up experiments. Deliverable: a theorem for one representation, including its data norm, rather than a family-wide verdict.

5. **Rebuild the experimental evidence.** Archive coefficient generation, roots, residuals, basis matrices, precision, seeds, and sample counts. Compare independent root calculations or certify root completeness; every box sample should have \(d!n^d\) simple roots counting multiplicity. Report raw overlap and every normalization separately. Group statistical errors by system, since roots from one system are dependent. Recompute difficult examples at higher precision to distinguish true conditioning from a failed computation.

6. **Add probability statements that match practical questions.** Prioritize
   \[
   \frac1N\mathbb E\#\{j:\mathcal A_j>t\}\le Ct^{-\alpha}.
   \]
   This directly describes an exceptional fraction of roots and implies the weaker all-roots bound \(\mathbb P(\max_j\mathcal A_j>t)\le NCt^{-\alpha}\). A bound on \(\mathbb E_*\log^+\mathcal A\) is a useful intermediate step. Do not infer these conclusions from a signed log mean.

7. **Then pursue smoothing and growing dimension.** First use a fixed bivariate construction and an explicit coefficient chart; adaptive QR bases and singular operator-determinant pencils add separate difficulties. Track every dependence on d, n, N, and perturbation scale. A theorem polynomial in N at fixed d is not yet an answer to dimension-exponential amplification.

A sensible stopping point for the first paper is A–C plus one rigorous bivariate representation theorem, supported by reproducible experiments. RUR energy, adaptive quotient bases, total-degree universality, and all-dimensional smoothed bounds are viable follow-up projects; they should not all be prerequisites for a first result.

## 7. What to retain from the archives and literature

The archived potential-theoretic convergence argument is worth retaining as a separate note. It is more appropriate than conditioning on the other coordinates of a root. Its coefficient assumptions include a tail/moment condition as well as bounded density; bounded density alone does not control large coefficients. Compactifying on \(\mathbb P^d\) for total degree and \((\mathbb P^1)^d\) for box degree gives deterministic cohomological mass bounds for the mixed currents. This suggests a cleaner second-moment proof and potentially an almost-sure strengthening, but the cutoff and integrability details should be written before updating its status. See the archive audit for the precise proposal.

The planted-origin quadratic model is a useful diagnostic, not evidence for a generic-root theorem. Its law lacks the root Palm weight, and the old Gaussian/chi normalizations contain errors. In particular, the asserted exponentially improving numerator/denominator ratio is not supported by the written calculation. Preserve the model as a controlled example with corrected moments.

The normal-form literature should include [Parkinson et al., *Analysis of normal-form algorithms for solving systems of polynomial equations*](https://arxiv.org/abs/2104.03526), alongside [Telen–Mourrain–Van Barel](https://epubs.siam.org/doi/10.1137/17M1162433). These reinforce the importance of basis choice and root clustering. For singular pencils, [Lotz–Noferini's weak-condition framework](https://arxiv.org/abs/1905.05466) is more appropriate than applying regular-pencil condition formulas without a specified regularization. These sources inform the scope of the proposed results; they do not establish the conjectures above.

## 8. Supporting records and checks

The independently prepared, detailed audit notes are:

* [Current theorem and method audit](tmp/research/audit-main-theorems.md).
* [Survey, primary literature, and projection theorem](tmp/research/survey-literature.md).
* [Archived calculations and convergence audit](tmp/research/audit-archives.md).

I added [a standard-library Python check](tmp/research/check_local_formulas.py) and its [recorded output](tmp/research/local-formula-checks.json). Run it with `python3 tmp/research/check_local_formulas.py`.

The check evaluates the exact tridiagonal univariate conditional second moment, verifies the n=1 normalization, checks the root-depth density integrates to one, and verifies normalization of the finite-dimensional Wishart smallest-eigenvalue density. Conditional-Jensen quadratures at n=40,160,640 give approximately 0.65071, 0.70975, 0.73086, reproducing the corresponding values quoted in the draft from a separate formula. This supports the corrected univariate calculation. A finite grid does not prove the uniform estimate; the analytic argument in C is the proposed justification. No claim is made to have reproduced the bivariate or trivariate data.

The central research opportunity remains strong: explain, in a consistent perturbation geometry, how much additional sensitivity is created by an algebraic representation of a random polynomial zero set. The project is ready for consolidation and a focused proof effort, not yet for the broad favorable verdict stated in the current manuscript.
