import TensorFlow

extension Tensor where Scalar: TensorFlowFloatingPoint {
    /// The (Moore-Penrose) pseudoinverse of a matrix using its singular-value decomposition (SVD).
    ///
    /// Reference: ["Moore–Penrose inverse"](
    /// https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse)
    public var pseudoinverse: Tensor {
        let svd = _Raw.svd(self)
        let diag = _Raw.diag(diagonal: svd.s)
        return matmul(matmul(svd.v, _Raw.matrixInverse(diag)), svd.u.transposed())
    }
}