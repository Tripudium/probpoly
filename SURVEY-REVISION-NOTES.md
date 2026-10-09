# Survey revision — 12 September 2026

The revised `survey.tex` and `survey.bib` compile to `survey.pdf`. The previous source,
bibliography, and PDF are preserved in `tmp/survey-revision/original/`.

## Organization and teaching strategy

The survey now begins with the quotient algebra of a finite reduced root set. Evaluation
identifies this algebra with the functions on the roots, and multiplication becomes
diagonal in those coordinates. This supplies a common explanation for seven constructions:
Sylvester, Cayley–Bézout, Macaulay, multiparameter eigenvalue problems, Gröbner elimination,
rational univariate representations, and normal forms. Each method explains what is
constructed, why it represents the roots, and how to recover the remaining coordinates.

The system

\[
x^2-1=0,\qquad y^2-x=0
\]

is worked through all seven constructions. Its four roots are simple, the coordinate
\(y\) separates them, and \(x\) does not. It therefore illustrates both successful
recovery and the need to resolve repeated projected eigenvalues. Additional examples
explain degree drops and roots at infinity, a support-adapted Cayley construction that
reduces to Cramer's rule, a different rational parametrization, and the effect of basis
rescaling on unstructured eigenvalue conditioning.

## Mathematical corrections and scope

- Distinguish actual degrees from fixed grades, affine roots from roots at infinity,
  and ordinary projective compactification from the multihomogeneous compactification
  appropriate to box supports.
- State the support and regularity assumptions for the generic Cayley determinant.
  Padding a sparse construction into a generic matrix can make it singular.
- Give a directly verifiable Macaulay quotient compression. An arbitrary square minor
  of a coefficient matrix is not automatically a resultant, and dependent polynomial
  rows cannot all be retained in a determinant.
- Separate the nonsingular multiparameter theorem from singular formulations. Singular
  operator determinants require an appropriate reduction; excess dimension alone does
  not establish singularity of a pencil.
- Distinguish an eliminant (the minimal polynomial of the chosen coordinate in the
  reduced quotient) from its characteristic polynomial. Equality requires separation.
- Fix row/column, transpose, and left/right eigenvector conventions throughout.
- Distinguish equation-value, coefficient, scalar-output, and unstructured matrix
  conditioning. Include the coefficient evaluation factor and specify the norm.
- Distinguish trace duality from residue duality; the latter contains the Jacobian weight.

Worst-case instability results remain identified as worst-case results. The survey makes
no unproved average-case or smoothed comparison between methods.

## Proofs and references

Short proofs now cover evaluation/interpolation, the multiplication eigenvalue theorem,
the companion model, the Sylvester common-root criterion, Barnett's factorization,
Macaulay compression, the forward tensor Cramer identity, the reduced shape lemma,
RUR recovery and its trace-adjugate construction, truncated normal forms, basic condition
formulas, and univariate Bézoutian–residue duality.

Results requiring more machinery retain explicit hypotheses and references, including
multihomogeneous resultant regularity, determinantal representation sizes, and the
converse nonsingular multiparameter theorem. Relevant bibliography metadata was checked
and supplemented. The independent review in
`tmp/survey-revision/independent-review.md` records the source checks and mathematical
details; `tmp/survey-revision/macaulay-mep-notes.md` records the Macaulay and multiparameter
review.

## Validation

- Independent mathematical review of the integrated survey found no remaining substantive
  error; its convention and proof clarifications were incorporated.
- Exact symbolic checks passed for the running example across all seven constructions,
  both rational parametrizations, the basis-conditioning example, and residue identities
  including complex roots. These are verification examples, not substitutes for the
  general proofs.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error survey.tex` succeeds with no
  LaTeX warnings, unresolved references, or overfull/underfull boxes.
- The compiled PDF has 25 pages. Page images were rendered and inspected for displays,
  tables, page breaks, and bibliography layout.

Reproducible exact checks:

```sh
uv run --with sympy python tmp/survey-revision/check_examples.py
uv run --with sympy python tmp/survey-revision/check_macaulay_mep.py
```
