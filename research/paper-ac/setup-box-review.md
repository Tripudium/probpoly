# Independent review of setup and box sections

12 September 2026. Reviewed `paper-sections/setup.tex` and `paper-sections/box.tex` directly. No source edits were made.

## Concrete corrections

1. In Example `ex:setup-metrics`, the two coefficient ensembles do **not** have different Euclidean root metrics: both use the usual absolute-value metric on the same complex line. Replace “their Euclidean root metrics and their coefficient norms differ” by “their kernel metrics and their coefficient norms differ.” Their Euclidean condition numbers also differ, if that is the intended emphasis.
2. Immediately before `eq:setup-relative`, explicitly require a nonzero root z as well as nonzero input. Its denominator is ||z||. Suggested wording: “For nonzero input and nonzero Euclidean output, ...”. The subsequent scalar version already makes its nonzero-output condition explicit.

No substantive proof gap was found in the deterministic framing or the box arguments reviewed here. The following checks explain the basis for that conclusion.

## Deterministic maps and metrics

- The local branch on regular solution incidence, complex-linear derivative `-J^{-1}E_z`, coefficient Frobenius norm, and identity `E_z E_z*=S I` are consistent. Thus the full-root and scalar-output condition formulas are exact.
- The covariance-compatible metric is `H_jk=∂bar_j∂_k log S`, with tangent columns and derivative rows. The normalization `A=S^{-1/2}JH^{-1/2}` gives `κH=||A^{-1}||` exactly. The Fubini–Study normalization is explicit.
- The eigenvalue derivative and overlap correspond to arbitrary intermediate matrix perturbations; the chain-rule discussion correctly distinguishes this from coefficient-induced perturbations and from an algorithmic stability theorem.
- With coefficient-column multiplication matrices and V having evaluation columns, `M_g=V^{-T}diag(g(z_j))V^T` is correct. The ordinary-transpose dual vector and Hermitian angle formula have the same norm because one is the conjugate of the Hermitian dual.
- The expected-root law preserves the Gaussian system marginal because the root count N is deterministic. The distinctions from prescribed-point conditioning and worst-root statements are accurate.

## Uniform metric estimate

The block proof in Lemma `lem:box-metric-bound` is valid for every n>=1 and the stated radii:

- For r<=1/4, the 0,1 pair in Var(J)/r gives h>=1/k_n(r)^2, including r=0 by continuity.
- For r>=1/4, set u=1/(1-r) and m=min(n,floor(u)). If m=n, then k_n<=m+1; otherwise k_n<=u<m+1. Hence the lower bound on each of the first m+1 probabilities is justified in both cases.
- Since j<=m<=u and log r>=-4(1-r), these weights are at least exp(-4)/(m+1). Applying the independent-copy variance identity to this block gives exp(-8)m(m+2)/12.
- The estimate m>=min(n,u)/2 is correct, and min(n,u)>=1/(1/n+1/u), producing the required lower metric bound.
- The upper bound combines h<=n² and h<=(1-r)^-2, and min(n²,(1-r)^-2)<=4/(1-r+1/n)². Endpoint r=1 is covered exactly.
- Reversal is h(r)=r^-2 h(1/r), with the exponent and derivative sign correct.

The logarithmic metric estimate then follows globally, including arbitrarily distant outer roots: reversal produces the necessary additive `2 log^+r`. Its expectation is uniformly bounded by the exact outer-root moment. This avoids the false pointwise tail control in the old manuscript.

## Root distribution and coefficient comparison

- The generic toric intersection count N=d!n^d and absence of boundary roots are compatible with the Gaussian box support. The caution concerning ordinary total-degree homogenization is correct.
- The product root density has the correct π and n factors. Passing to r=|z|² uses planar area `dr dtheta/2`. The CDF and inversion law follow exactly.
- The depth tail follows from the truncated geometric mean, and integrating `1-F_n(r)` against dr/r gives exactly log(n+1)/n. The logarithmic depth moment is uniformly finite.
- The full-root singular-value sandwich is valid for positive diagonal D. The matched scalar identity is exactly `κ_coeff^{x1}=h_n(R1)^(-1/2)||e1^T A^{-1}||`. Its row-norm logarithm is absolutely integrable because `||A||^{-1}<=||e1^T A^{-1}||<=||A^{-1}||`.
- The generic separation argument has the correct dimension. For d>=2, the point-pair space z!=w, z1=w1 has dimension 2d-1; the two evaluations have rank two because constants and coordinates belong to the polynomial space; imposing both zeros in each of d polynomials gives fiber codimension 2d. Thus the incidence dimension is at most dm-1 and its coefficient projection lies in a proper algebraic subset after Zariski closure. For d=1 there are no such distinct pairs, so separation is immediate.
- The extended expectation identity is well-defined even if the overlap logarithm has infinite expectation: log Lambda>=0 and the coefficient-condition logarithm is absolutely integrable, so the negative part of the difference is integrable.
- The evaluation-scale identity retains the outer-root contribution exactly. The comparison between the sum and the integral gives the claimed lower bound n/(1+|s|). The resulting coefficient/residual leading terms differ by d log n, with the matched scalar output held fixed.

## Literature normalization check

The Armentano–Beltrán scalar average identity in the setup is correct under the displayed norm conventions. Their [primary paper](https://arxiv.org/pdf/1706.06025), Theorem 1.1 and Section 3.1, specializes to average squared condition one for scalar polynomials with standard projective output metric.

It can also be checked directly here: in one variable the Kac–Rice factor |p'|² cancels the same factor in μ_FS²; conditional on p(z)=0 the coefficient vector has expected squared norm n; and `(1/π)∫_C (1+|z|²)^-2 dA=1`. Dividing by the root count n gives `E_* μ_FS²=1`. This independently checks the missing-or-extra-factor risks involving n, π, input norm, and the Fubini–Study metric.

The introductory statements about the companion tail and growing second moment were not audited in this review; their detailed proof is assigned to the companion section author.
