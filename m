Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96046AA75;
	Fri, 14 Aug 2026 12:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709634; cv=none; b=HnD/qdgE4PjBrZ1ndyxqZcHfx8KAPphiXukRRtrdIxSPE2k+CPtKNLM9dZRlkl4Co6mDzLwILsk9GMjch8JpY9svZUfFg58qVcS8Lj4dcKCAc7Pkwv8TRwiGXEq/abpP2E86xUOKbgpFRC+NN2GLneMUDZKjeeF/dMlt/ESOahY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709634; c=relaxed/simple;
	bh=vbBcP1TyavnfW/sYV7zS2U2FHb3pKvXxNUPT+80RbDc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FBPFleeijAn6Ulp8gCc2zHFHUu83Y6rp9aVyccpDig2RuT63lg3nU4Y+jrJ9sCRrJZg6oOKiJ/KrB8WKJrBw/V5awzUZsya9dpkzLixQtNk43ORDgIfQvem6ccITx3UZP+o7GR0HMiSnY+8CmUEmc7k5a6duSAXNPyaKwofAB0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdS8Phtc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdS8Phtc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD211F000E9;
	Fri, 14 Aug 2026 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786709632;
	bh=VvoawG1V9Ufx+24ijzXKluOODJaRXMW3MMq3m2bUCFc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ZdS8PhtcRyS+ZUDCI8gIbR9nbk4U3KarrrKbguGoT7o+DUJRRTa+5m4e0QmIK7rT7
	 4r+Z3hdOI5JwrRMObldPykZE4Mrse4ozu8UpVatqX8hSl/O8r3nLKbMuXUxxWQJwWO
	 ohdJFn4YEvLeTEaslRc/Pi4mQa9EXSXQH/H1IgzqZHrAzmqToTjGsUvecACmK8m65X
	 ErfeQsqI1kcU4X3jYLVmgPgOoAm+yp8+llp+T69I8EGuOWZz3cSEv5xF1tZT8G/h1S
	 /4KwaIpcyKD5NRY35bxgU2E82ifB4yEZ/40zhCbTSX0X+yBirdxln86mCePM8pSGWG
	 gsenRYn/p1cLA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 14:13:46 +0200
Message-Id: <DKONPB717CY7.4UDYVW6C29FY@kernel.org>
Subject: Re: [PATCH 06/17] gpu: nova-core: add the GIN interrupt tree API
Cc: "Joel Fernandes" <joel@joelfernandes.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-7-jhubbard@nvidia.com>
In-Reply-To: <20260808031120.363869-7-jhubbard@nvidia.com>

On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Servicing a GIN leaf has a required order: read its pending bits, then
> clear them. Clearing a leaf before reading it discards every vector
> latched in it, and nothing reports the loss.
>
> Add an API for one PCIe function's CPU interrupt tree. The leaf handle
> carries that order as a type state, so the wrong order does not compile.
>
> The CPU doorbell self-test added later in this series is the first user.
>
> Reviewed-by: Will Pierce <wpierce@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [jhubbard: use the canonical NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*
>  register names, name the module interrupt_tree with a Tree type, drop
>  the type state from the Top handle, take the leaf count from the
>  chipset, define the vector encoding here, reject a trigger for a vector
>  outside the tree, and read every implemented leaf in drain() rather
>  than descending from the TOP registers, which cannot see a vector that
>  latched while disabled]
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

It would make more sense if this patch is merged into patch 8 after the HAL=
 is
introduced in patch 7.

(The newtypes mentioned below need their own commit first though, as they'd=
 also
be used by the HAL.)

> +/// Index of a leaf register, bounded to the `0..16` range covered by th=
e leaf register arrays.
> +pub(super) type LeafIndex =3D Bounded<usize, 4>;
> +
> +/// Maps an interrupt `vector` to its position in the tree: the leaf tha=
t carries it
> +/// (`vector / 32`) and the bit index within that leaf (`vector % 32`).
> +///
> +/// The returned leaf is a raw index. [`LeafIndex::try_new`] bounds it t=
o the leaf register
> +/// arrays, and the architecture's leaf count is a separate, narrower bo=
und.
> +pub(super) const fn vector_leaf_bit(vector: u32) -> (usize, u32) {
> +    (crate::num::u32_as_usize(vector / 32), vector % 32)
> +}
> +
> +/// Maps an interrupt `vector` to the `TOP` enable mask of the subtree t=
hat carries it.
> +///
> +/// A subtree covers two adjacent leaves, so the vector's leaf is in sub=
tree `vector / 64`. The
> +/// result has that subtree's bit set, in the form `TOP_EN_SET` and `TOP=
_EN_CLEAR` take as a
> +/// value.
> +///
> +/// The result is not validated against the subtrees that the architectu=
re supports.
> +pub(super) const fn vector_subtree_mask(vector: u32) -> u32 {
> +    1 << (vector / 64)
> +}

I think we use new types for those. I'm thinking of:

	struct GinVector(u32);

	impl GinVector {
	    const fn leaf_index(&self) -> LeafIndex { ... }
	    const fn leaf_mask(&self) -> LeafMask { ... }
	    const fn subtree(&self) -> Subtree { ... }
	}

With additional new types LeafMask and Subtree.

This removes the need for

	const GSP_LEAF: usize =3D GSP_LOC.0;
	const GSP_BIT: u32 =3D 1 << GSP_LOC.1;

and subsequent

	LeafIndex::new::<GSP_LEAF>()

Subtree should represent a single TOP bit produced by GinVector::subtree().

This way Subtree already carries the invariant we need and we get rid of th=
e
runtime count_ones() check in SubtreeVectors::request_for().

The semantics of serviced is different and can be represented by a SubtreeS=
et
type, so the check becomes serviced.contains(subtree).

Now, there's already an existing Subtree type, which represents an index. B=
ut I
think we should just get rid of it, as it doesn't really add any value. The=
 two
methods it implements, iter_leaves() and iter_pending_leaves(), are rather =
Tree
methods.

If we add Subtree::index() they can still take a Subtree argument, but I'm =
not
sure it's worth. They are only called by drain(), which creates this new ty=
pe
from a raw value, just to immediately convert it back to a raw value. So, h=
ere
I'd just work with the raw value.

> +
> +/// Type state of a [`Leaf`] handle: `Idle` before its pending bits are =
read, `Pending` after.
> +pub(super) trait State: private::Sealed {}
> +
> +/// State in which the handle holds no pending bits.
> +pub(super) struct Idle;
> +impl State for Idle {}
> +
> +/// State holding the pending bits read from hardware.
> +pub(super) struct Pending {
> +    pending_bits: u32,
> +}
> +impl State for Pending {}
> +
> +mod private {
> +    pub(in crate::irq) trait Sealed {}

This can just be pub.

> +    impl Sealed for super::Idle {}
> +    impl Sealed for super::Pending {}
> +}
> +
> +/// The GIN CPU interrupt tree for a single PCIe function.
> +#[derive(Clone)]

I think we don't need Clone on this, I know it is used in the doorbell test=
, but
we can simplify the doorbell test significantly by getting rid of the custo=
m
SelftestGuard and replace it with

	struct SelftestResources<'a, 'r> {
	    _leaf_guard: LeafEnableGuard<'a>,
	    reg: Pin<KBox<irq::Registration<'r, DoorbellTestHandler<'a>>>>,
	    _top_guard: TopEnableGuard<'a>,
	}

Note that a LeafEnableGuard will also be very useful for the GspIrq introdu=
ced
later.

	pub(crate) struct GspIrq<'a> {
	    #[pin]
	    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
	    bar: Bar0<'a>,
	    tree: Tree,
	}

just becomes

	pub(crate) struct GspIrq<'a> {
	    _leaf_guard: LeafEnableGuard<'a>,
	    #[pin]
	    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
	}

And the open-coded destructor of GspIrq goes away.

> +pub(super) struct Tree {
> +    /// Number of implemented leaves in this tree, either 8 or 16.
> +    num_leaves: usize,

If it is really just one or the other, maybe worth to consider something li=
ke:

	#[repr(usize)]
	enum LeafCount {
	    Eight =3D 8,
	    Sixteen =3D 16,
	}
=09
	impl LeafCount {
	    const fn into_raw(self) -> usize {
	        self as usize
	    }
=09
	    const fn subtree_count(self) -> usize {
	        self.into_raw() / 2
	    }

	    const fn subtree_set(self) -> SubtreeSet {
	        SubtreeSet((1u32 << self.subtree_count()) - 1)
	    }
	}

A HAL can then only ever pick an expected leaf count.

> +    /// Mask of subtree bits the architecture implements.
> +    subtree_mask: u32,

This should be SubtreeSet.

> +}
> +
> +impl Tree {
> +    /// Creates a `Tree` sized for `chipset`.
> +    pub(super) fn new(chipset: Chipset) -> Self {
> +        let num_leaves =3D match chipset.arch() {
> +            Architecture::Turing | Architecture::Ampere | Architecture::=
Ada =3D> 8,
> +            Architecture::Hopper | Architecture::BlackwellGB10x | Archit=
ecture::BlackwellGB20x =3D> {
> +                16
> +            }
> +        };
> +
> +        Self {
> +            num_leaves,
> +            // Each subtree covers two leaves, so one bit per pair of le=
aves.
> +            subtree_mask: (1u32 << (num_leaves / 2)) - 1,
> +        }
> +    }
> +
> +    /// Returns a [`Top`] handle for this tree.
> +    pub(super) fn top(&self) -> Top {
> +        Top {
> +            subtree_mask: self.subtree_mask,
> +        }
> +    }
> +
> +    /// Returns a [`Leaf`] handle in the [`Idle`] state for `index`.
> +    pub(super) fn leaf(&self, index: LeafIndex) -> Leaf<Idle> {
> +        Leaf::from_index(index)
> +    }
> +
> +    /// Injects a software interrupt for `vector` via the trigger regist=
er.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if `vector` lies outside this tree (`vector >=3D num_le=
aves * 32`). `EOVERFLOW` if
> +    /// `vector` does not fit in the trigger register's vector field.
> +    pub(super) fn trigger(&self, bar: Bar0<'_>, vector: u32) -> Result {

Most methods take a Bar0 argument. I think it would be cleaner if the Tree
constructor would just take a Bar0 and store it within the tree.

In case this gets into the way of some tests, we can also have a TreeInner =
type.

> +        if crate::num::u32_as_usize(vector) >=3D self.num_leaves * 32 {

This check could be replaced by:

	impl GinVector {
	    const fn validate(self, leaves: LeafCount) -> Result {
	        if self.as_raw() >=3D leaves.vector_count() { return Err(EINVAL) }
	        Ok(())
	    }
	}

so this becomes

	vector.validate(self.leaf_count)?;

> +/// View of a single interrupt leaf.
> +pub(super) struct Leaf<S: State =3D Idle> {
> +    index: LeafIndex,
> +    state: S,
> +}
> +
> +// The `try_at(...)` calls below cannot fail: `LeafIndex` is `Bounded<us=
ize, 4>`, so its value is
> +// in 0..16, and every leaf register array has 16 elements.
> +impl Leaf<Idle> {
> +    /// Creates a [`Leaf`] handle for `index`.
> +    pub(super) fn from_index(index: LeafIndex) -> Self {
> +        Leaf { index, state: Idle }
> +    }
> +
> +    /// Enables the vectors set in `vectors` for this leaf (`LEAF_EN_SET=
`).
> +    ///
> +    /// This is the per-vector counterpart of [`Top::enable`], which ena=
bles a whole subtree.
> +    pub(super) fn enable(&self, bar: Bar0<'_>, vectors: u32) {
> +        if let Some(loc) =3D CPU_INTR_LEAF_EN_SET::try_at(self.index.get=
()) {
> +            bar.write(loc, vectors.into());
> +        }
> +    }
> +
> +    /// Disables the vectors set in `vectors` for this leaf (`LEAF_EN_CL=
EAR`).
> +    pub(super) fn disable(&self, bar: Bar0<'_>, vectors: u32) {
> +        if let Some(loc) =3D CPU_INTR_LEAF_EN_CLEAR::try_at(self.index.g=
et()) {
> +            bar.write(loc, vectors.into());
> +        }
> +    }

IIUC, the type state exists only to guard clear_pending() from being called
before read_pending() has been called?

In this case, enable() and disable() are orthogonal and do not participate =
in
the state machine.

If that holds, I'd probably move enable(), disable() and enable_guarded() t=
o
Tree or just remove the type state and make Leaf<Pending> a new type. (One =
can
obtain a new  Leaf<Idle> while still having a Leaf<Pending> anyways.)

Also, does the type state really properly fulfill its purpose? Once I calle=
d
read_pending() once I can hold on to Leaf<Pending> for as long as I want an=
d
call clear_pending() for as often as I want, right?

I think the idea is that the read_pending() then clear_pending() sequence m=
ust
run within the interrupt handler?

So, I assume that we rather want read_pending() to take a token that only l=
ives
for irq::ThreadedHandler::handle() and have a LeafPending that borrows from
this token?

I wonder if the core IRQ code should provide such a token in handle() and
handle_threaded().

This way we can enforce that certain things can only be executed in an IRQ
handler and that certain sequences like read and clear pending must complet=
e
within a single execution of an IRQ.

> +
> +    /// Reads this leaf's pending bits and transitions to [`Pending`].
> +    pub(super) fn read_pending(self, bar: Bar0<'_>) -> Leaf<Pending> {
> +        let pending_bits =3D CPU_INTR_LEAF::try_at(self.index.get())
> +            .map(|loc| bar.read(loc).into_raw())
> +            .unwrap_or(0);
> +        Leaf {
> +            index: self.index,
> +            state: Pending { pending_bits },
> +        }
> +    }
> +}
> +
> +impl Leaf<Pending> {
> +    /// Returns the pending bits read from hardware.
> +    pub(super) fn pending_bits(&self) -> u32 {
> +        self.state.pending_bits
> +    }
> +
> +    /// Clears every pending vector by writing its bits back (write-1-to=
-clear).
> +    pub(super) fn clear_pending(&self, bar: Bar0<'_>) {
> +        if self.state.pending_bits !=3D 0 {
> +            if let Some(loc) =3D CPU_INTR_LEAF::try_at(self.index.get())=
 {
> +                bar.write(loc, self.state.pending_bits.into());
> +            }
> +        }
> +    }
> +}
