# Independent review of the companion section

12 September 2026. Reviewed `tmp/paper-draft/companion.tex` independently of its
author, focusing on the algebraic identities, Gaussian conditioning, constants,
weak-L² tail, and critical second moment. No source changes made.

## Result

No mathematical error found in the reviewed section. The weak-L² theorem and
`E_* Lambda² = 2 log n + O(1)` follow from the arguments as written, assuming the
referenced box metric lower bound and root-depth tail are proved in the preceding
section. Those references are the only external uniform estimates used here.

## Checks of the main arguments

1. **Companion convention.** With columns representing multiplication in
   `(1,x,...,x^{n−1})`, the coefficient vector of the cardinal polynomial is a
   right eigenvector and the evaluation transpose is a left eigenvector.
   Their pairing is one; the displayed product of Euclidean norms is the
   spectral/Frobenius absolute eigenvalue condition.

2. **Complex conjugations.** The multiplication map has Gram superdiagonal `−z`
   and subdiagonal `−conj(z)`. The covariance of `q(z)=v(z)^T q` is
   `v^T Sigma conj(v)`, and the regression coefficient is correctly
   `Sigma conj(v)/sigma`. No transpose/conjugate correction is needed.

3. **Palm cancellation.** Ordinary conditioning restricts the coefficient
   Gaussian to `im D_z`, giving covariance `T_z^−1` in quotient coordinates.
   The selected-root tilt `|q(z)|²` cancels the denominator in `Lambda²`, yielding
   the exact trace formula with no extra pi factor. The radial root density is
   `h_n(r)/n` because planar polar integration contributes `pi dr`.

4. **Cofactors and reversal.** The leading minors are `k_j(r)`. The trace numerator
   is `sum_i k_{i−1}k_{n−i}`, whose coefficient of `r^j` is `(j+1)(n−j)`.
   Reversal multiplies the cardinal coefficient norm by `|z|^{n−1}` and the
   evaluation norm by its reciprocal. The values `Phi_n(0)=n`,
   `Phi_n(1)=2n/(n+1)`, and `Phi_1=1` are consistent.

5. **Trace estimate.** Each cofactor ratio is at most
   `min(n,(1−r)^−1)` for `0<=r<=1`, since one numerator factor is bounded by
   `k_n`. Summing proves the stated bound; the metric lower bound then gives
   `Phi<=C(1+n(1−min(r,r^−1)))`.

6. **Conditional third moment.** After regression, the Palm tilt affects only
   `xi`; its squared modulus is Gamma(2,1), while `eta` remains independent.
   Thus `E_* |xi|^−3 = Gamma(1/2)=sqrt(pi)`. The Gaussian fourth-moment identity
   and Holder/Lyapunov give the stated dimension-free third-moment control
   `E_*[Lambda³|z] <= C Phi_n(r)^{3/2}`.

7. **Weak-L² bound.** With `W=1+|n log r|`, the depth bound gives
   `P(W>u)<=min(1,4/u)`. The truncated-moment layer-cake identity
   `E min(1,(W/A)^{3/2}) = 3/(2A^{3/2}) int_0^A u^{1/2}P(W>u)du`
   is exact. Its `O(A^−1)` bound and `A` proportional to `t²` give the claimed
   `O(t^−2)` tail without the logarithmic loss that plain second-moment Markov
   would produce.

8. **Second-moment constant.** The algebraic formula for `A_n` and the displayed
   decomposition of `G_n` are correct. On `[0,1−1/n]`, the first factor differs
   from one by `O(r^n)`; the negative correction is bounded by
   `2/[n(1−r)²]`. Both error integrals are `O(1)`. The leading integral is
   `log n`, and the remaining interval contributes between zero and one by
   `0<=G_n<=n`. Reversal doubles the integral, proving coefficient **2**.
   At degree one the integral is exactly one, which independently checks its
   normalization.

9. **Sharpness and relative conditioning.** Divergence of the second moments
   precludes any uniform moment of order at least two and any uniform tail
   exponent greater than two. The relative comparison uses identical output
   scales; the Gamma logarithmic identities give the data-scale interval
   `[gamma/2−1/(2n), gamma/2]`. Dependence between the companion norm and the
   selected root is immaterial because the number of roots is deterministic.

The distinction between a signed logarithmic condition ratio and an algorithmic
stability guarantee is stated appropriately. The explicit basis and all-coefficient
perturbation convention are sufficiently clear.

## Fixed-degree threshold: latest revision checked

The strengthened conditional moment lemma for every `0<q<4` is correct. The
fourth-moment bound gives `E||eta||^q <= 2^{q/4}(tr R)^{q/2}`, and the Palm factor
contributes exactly `Gamma(2−q/2)`. The same argument works for `q<1` using
subadditivity and for degenerate Gaussian residuals.

The added fixed-degree proposition is also correct. For each fixed `n`, the
stronger radial bound gives `Phi_n<=Cn` globally, proving all moments below four
are finite. When `n>=2`, `rank R=n−1` ensures a positive-probability residual
event `||eta||>a`. Independence, together with a sufficiently small `|xi|`, gives
a lower bound proportional to `|xi|^−q`; its Palm expectation diverges precisely
for `q>=4`. The radius-dependent constants cause no issue because conditional
divergence holds at every finite root location. Degree one is correctly excluded.

All requested review items are complete. The author's separate exact symbolic
checks are reported in their own record; this file records an independent
analytic review rather than claiming to have rerun those checks.
