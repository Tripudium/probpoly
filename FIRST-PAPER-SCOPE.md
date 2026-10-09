# A–C as a first paper

12 September 2026. Follow-up to `RESEARCH-STATUS-AND-PLAN.md`.

## Scope correction after author feedback

The author clarified that the intended paper should address algebraic methods
for systems. The earlier recommendation below narrowed the main representation
result to one variable. It is superseded as a completion criterion: the systems
paper needs A+B and one multivariate representation result, with C serving as a
worked special case. That multivariate result remains open. See
[`research/paper-ac/systems-scope-correction.md`](research/paper-ac/systems-scope-correction.md)
for the current status, relevant prior work, and the proposed bivariate target.

## Earlier recommendation (superseded)

Combine A–C into one paper, with C as the main representation theorem, A as the
geometric/probabilistic framework, and B as the bridge between the framework and
the concrete coefficient model. Complete this core before making a bivariate
representation theorem a condition for finishing the paper. Such a theorem would
strengthen the paper, but is not necessary for its conceptual coherence.

The central question is how local root sensitivity and the conditioning of a
chosen algebraic representation differ. The paper gives a general local law for
Gaussian systems, an exact specialization to the box ensemble, and a complete
analysis of the companion eigenvector overlap in the univariate case.

The intended contribution must be stated precisely: A uses established induced
Ginibre/Wishart distributions; B largely organizes exact kernel consequences and
their normalization; C is the principal candidate for a new representation result.
Its novelty still needs a dedicated literature check. The induced Ginibre ensemble
itself is established in [Fischmann et al.](https://arxiv.org/abs/1107.5019).
The paper would not settle the growing-dimension worst-case amplification studied
by [Graf–Townsend](https://arxiv.org/abs/2408.02805), nor establish an end-to-end
backward stability theorem for a rootfinding algorithm.

## An immediate strengthening of C

There is a useful further consequence of the proposed conditional estimate in C.
Write \(s=n\log|Z|^2\). Once the uniform estimates in C are proved, they give

\[
\mathbb E_*[\Lambda^2\mid Z]\le C(1+|s|),
\qquad
\mathbb P_*(|s|>t)\le\min(1,2/t).
\]

For every fixed \(0<q<2\), conditional Jensen gives

\[
\mathbb E_*\Lambda^q
\le C^{q/2}\mathbb E_*(1+|s|)^{q/2}
\le C_q,
\]

uniformly in the polynomial degree. The last bound follows by integrating the
displayed depth tail; its integrand at infinity is proportional to
\(t^{q/2-2}\), which is integrable precisely when \(q<2\).
This argument proves a sufficient moment range, not optimality of the range for
the actual overlap.

Consequently the same proposed proof would establish

\[
\frac1n\mathbb E\#\{j:\Lambda_j>t\}
=\mathbb P_*(\Lambda>t)\le C_qt^{-q}.
\]

This controls the expected fraction of poorly conditioned eigenvalues without
assuming independence between the roots. The bounded logarithmic mean is a
corollary. It does not provide a degree-independent bound on the worst root, or
on the ratio of intermediate and input condition numbers.

**Status:** the implication above is elementary and complete given the two stated
bounds. The conditional bound from C remains a proof route whose uniform estimates
must be fully written and checked. This note does not upgrade C to a finished theorem.

## Suggested structure and completion criteria

1. State the problem, coefficient norm, output metric, selected-root law, and main
   conclusions, including the univariate overlap theorem.
2. Develop the marked Kac–Rice law and kernel-metric normalization (A), distinguishing
   standard random-matrix ingredients from their interpretation for polynomial roots.
3. Derive the box root law, depth estimates, and coefficient-consistent comparison (B).
4. Present the tridiagonal Gram-matrix proof, uniform overlap moments, and the companion
   relative-condition corollary (C).
5. Give a small reproducible numerical illustration and a short account of the
   multivariate interpolation problem left open.

The key next work is to finish C's uniform estimates, verify the novelty and scope
of that result, and check every normalization in the relative-condition comparison.
These are better first-paper milestones than adding several incompletely controlled
algebraic representations. A possible working title is *Local conditioning and
companion eigenvectors of Gaussian polynomials*; the abstract should make clear that
the local framework covers systems, while the representation theorem is univariate.
