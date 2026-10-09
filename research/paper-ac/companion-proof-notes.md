# Companion section: completed proofs and scope

Prepared for the A–C paper draft, 12 September 2026.

## Deliverables

- `companion.tex`: a complete LaTeX section, using the requested standard macros.
- `companion-geometric-lemma.tex`: the complete geometric-variance estimate, kept
  separate because the main paper establishes the same fact in the box section.
- `check_companion.py`, `companion-checks.json`: exact finite-degree symbolic checks.

The section references the parent's labels `eq:box-metric-bound`, `eq:box-depth`, and
`eq:box-metric-log`. Its own theorem labels have the prefix `comp-` after the
environment prefix (`thm:comp-main`, `prop:comp-exact`, and so forth).

## Main conclusions

All the following have complete analytic proofs in the section; they do not depend
on numerical verification.

1. For complex iid Gaussian Kac coefficients and the monomial companion basis,
   the selected-root overlap has a uniform weak-L2 bound:
   `P_*(Lambda > t) <= min(1, C/t^2)`.
2. Consequently `sup_n E_* Lambda^q < infinity` for every `0 < q < 2`, as well as
   a bounded nonnegative logarithmic mean.
3. The moment range is optimal for bounds uniform in degree:
   `E_* Lambda^2 = 2 log n + O(1)`.
4. The signed logarithmic ratio of companion eigenvalue conditioning to coefficient
   root conditioning is `log n + O(1)`, for both absolute and relative conditions
   specified in the section. The relative data-scale correction belongs to
   `[gamma/2 - 1/(2n), gamma/2]`.

No novelty claim is made. These are condition numbers of two specified maps,
with the same scalar output and different input perturbation models; the results
do not analyze the errors in constructing the companion matrix.

## Exact identity and simpler uniform estimate

At a fixed root location, write `p(x)=(x-z)q(x)`, and let `D_z` denote coefficient
multiplication by `x-z`. Ordinary Gaussian conditioning gives covariance
`Sigma=(D_z^*D_z)^(-1)` for the coefficients of `q`. Root selection tilts by
`|q(z)|^2`; this cancels the overlap denominator exactly. With `r=|z|^2`,

`Phi_n(r) = E_*[Lambda^2 | Z=z]
          = k_(n-1)(r) tr(Sigma)/(k_n(r) h_n(r))`.

The tridiagonal cofactor identity is particularly useful:

`tr(Sigma) = A_n(r)/k_n(r)`,

`A_n(r) = sum_(j=0)^(n-1) (j+1)(n-j) r^j`.

It follows immediately that, for `0 <= r <= 1`,

`tr(Sigma) <= n min(n,(1-r)^(-1)) <= 2n/(1-r+1/n)`.

Together with the truncated-geometric variance lower bound, this proves

`Phi_n(r) <= C (1+n(1-min(r,r^(-1)))) <= C (1+|n log r|)`.

This proof does not need a trigonometric spectral sum or a finite numerical grid.
It also shows the useful bound `Phi_n(r) <= Cn` for every radius.

At the unit circle `Phi_n(1)=2n/(n+1)`, at the origin `Phi_n(0)=n`, and for degree
one `Phi_1(r)=1` identically. Reversing the coefficient vector sends each root `z`
to `1/z` and preserves the overlap, so all inner/outer reductions are exact.

## Why the tail has no logarithmic loss

Write the ordinarily conditioned Gaussian coefficient vector as
`q = b xi + eta`, where `xi=q(z)/sigma` is standard complex Gaussian,
`eta` is independent, and `sigma^2=k_n(r)h_n(r)`. Under root selection,
`|xi|^2` has the Gamma(2,1) law. Thus
`E_* |xi|^(-3)=sqrt(pi)`, while the residual Gaussian vector obeys
`E ||eta||^3 <= 2^(3/4) (tr Cov(eta))^(3/2)`.

It follows that `E_*[Lambda^3 | Z=z] <= C Phi_n(r)^(3/2)`.
Integrating this conditional Markov bound against the root-depth tail
`P_*(|n log r|>u) <= min(1,2/u)` gives `C/t^2`, whereas the conditional second
moment alone would give a logarithmic loss at the tail endpoint.

## The logarithmic second moment is an exact asymptotic

The radial density cancels `h_n` once more:

`E_* Lambda^2 = (2/n) integral_0^1 k_(n-1)(r) A_n(r)/k_n(r)^2 dr`.

On `[0,1-1/n]` the integrand including `1/n` differs from `1/(1-r)` by an
integrable error bounded by
`C r^n/(1-r) + 2/[n(1-r)^2]`.
Each error integrates to an absolute constant. The remaining interval contributes
at most one before the outer factor two. This gives `2 log n+O(1)` directly.

For degree two the exact conditional formula is

`Phi_2(r)=2(1+r)^2/(1+4r+r^2)`,

and the unconditional second moment is
`2/3 + 4*pi/(9*sqrt(3))` (approximately `1.4727997174`).

## Fixed-degree integrability proposition

The same regression also proves that for each fixed `n>=2`, the finite-moment range
is exactly `0<q<4`. For `q<4`, negative Gamma(2) moments and `Phi_n<=Cn` give
finite conditional moments uniformly in location. For `q>=4`, the residual
Gaussian covariance has rank `n-1`, so the singularity at `xi=0` forces divergence.
Thus collision integrability at fixed degree has threshold four, while uniform
integrability in degree has threshold two because of rare root radii. At the root
agent's request this is now a short proposition in the section, immediately after
the generalized conditional-moment lemma.

## Checks and edge cases

The exact SymPy check passed for degrees 1 through 12. It verifies the cofactor
polynomial, its closed form, inversion, the unit-circle and origin values, and the
second-moment integrand rearrangement. For degrees 1 through 5 it directly inverts
the tridiagonal matrix and checks its determinant, trace, and evaluation variance.
It also integrates the degree-two second moment exactly.

`n=1` is explicitly separated wherever needed. The conditional identity at `r=0`
uses a continuous version; a random root is nonzero almost surely. The covariance
uses a Hermitian transpose for the Gram matrix, while polynomial evaluation uses
the bilinear transpose `v(z)^T`. Coefficient perturbations include the leading
coefficient. The relative comparison does not assume independence between the
data and the selected root: data-only expectations are unchanged because every
polynomial has the same number of roots.
