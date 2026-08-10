Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DF3282F0C;
	Mon, 10 Aug 2026 22:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786402410; cv=none; b=Faa7sCm8X6RQb+sw3tB5u+7dv6t/quX+Xsu/rWrewBxELA1kr/2eibk4estZ3eClUwN98W2KCFVYZwc3U5akwAIk2ZODtgyTzgP9SHJe1A0vDSBYBLucavFJrhuyBc/b+SmG+n4T/SZrmSesL8Qzv/7sOM9lV3GNR5i7RYSwwLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786402410; c=relaxed/simple;
	bh=Rrm4sJE02SfvtbKScGAlZRJippRpvd74kb13f0pPKyw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=BF8AE70YP50g8FZy9UwcLt/bjWSXgOnPjLjSS1yQd7SKlLwWdY2zdDZ7xBOi7KOpvu6SQhnHJO97v/VvJZTojOWnpGIJvgynUNrwXwnyoDhK4J/OofOOX4aOplUgGuYVAHBe9G8+DA5Vt1l3Fbw/vNLd40aUAWDjMONo0MLOM2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoMHAHoH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoMHAHoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBD31F000E9;
	Mon, 10 Aug 2026 22:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786402408;
	bh=0Ol5mJic5aYP8BELl0StHqAIqgZa2oSXH6gzH01WIMk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=eoMHAHoHikMwk9cHG7p/zFORgYcjuuj/Q/bCJxJnV00NTU/0FjSSv3asSyG+HDMqt
	 FMPDpl+4I8oobCnL9fw6mNv3Ox92xY1uVGeeh8/ne28N6/eRZSAhwMvxoFEBOIHzr+
	 TkM9uwK6LfY6F7JFohQxunVgTSJ34DobcMsY0vtmkSBvxlCv9GC42jsn8v52mDEKhP
	 lVn9KPTUlMJaaFcQhJu9lnvFL0DKRArIAKepaGGbJ25f2XS2BaqFZw81URt4jQoN+2
	 VQ38LZLKuAagOvjNrRWXPS9TJOsLvsdTpeOD2hGmBs0HvwtcVr/4p7akay4UsblqCo
	 7SibkBJsv3jDQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 00:53:23 +0200
Message-Id: <DKLMSULDBL2C.1JSX46NQDH1JU@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 03/17] rust: pci: expose the allocated interrupt type
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
 <linux-kernel@vger.kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-4-jhubbard@nvidia.com>
 <DKKG2QM3YJYB.Z2H2B2UXJ75N@kernel.org>
 <e2aa36cb-984a-4f8a-b6d5-6cb70a31a30b@nvidia.com>
In-Reply-To: <e2aa36cb-984a-4f8a-b6d5-6cb70a31a30b@nvidia.com>

On Sun Aug 9, 2026 at 11:42 PM CEST, John Hubbard wrote:
> Yes, please. Then my patches 2 and 3 collapse into a single patch that
> adds count(), irq_type() and an index-to-IrqVector accessor. Or, they go
> away entirely if you end up putting those on the type yourself.

I sent out a patch series [1] for this, applied your nova-core patches on t=
op of
it and resolved the conflicts with the diff below (also pushed a branch in =
[2]).

Note that I optimized for a clean diff and not for optimal code. I think th=
ere
are more improvements we can make; I will comment on the corresponding patc=
hes
of this series.

[1] https://lore.kernel.org/all/20260810224800.2314458-1-dakr@kernel.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Dnova/irq

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver=
.rs
index 3fbf117a99ee..21d7df0744ed 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -20,7 +20,10 @@

 use crate::{
     gpu::Gpu,
-    irq::gsp::GspIrq, //
+    irq::{
+        gsp::GspIrq,
+        SubtreeVectors, //
+    },
 };

 /// Counter for generating unique auxiliary device IDs.
@@ -39,6 +42,12 @@ pub(crate) struct NovaCore<'bound> {
     bar: pci::Bar<'bound, BAR0_SIZE>,
     #[allow(clippy::type_complexity)]
     _reg: auxiliary::Registration<'bound, ForLt!(())>,
+    /// Self-referential borrow of `vectors`, so this does not have to be =
repeated in the
+    /// constructor. Will go away with self-referential pin-init.
+    vectors_ref: &'bound SubtreeVectors<'bound>,
+    /// PCI interrupt vector allocation. Dropped last (struct field drop o=
rder).
+    #[pin]
+    vectors: SubtreeVectors<'bound>,
 }

 pub(crate) struct NovaCoreDriver;
@@ -87,38 +96,34 @@ fn probe<'bound>(
             pdev.enable_device_mem()?;
             pdev.set_master();

-            // A PCI device has one interrupt vector allocation, so it is =
made here for every
-            // subtree nova-core services, and each handler takes the vect=
or for its own subtree.
-            let vectors =3D crate::irq::alloc_vectors(pdev, crate::irq::gs=
p::GSP_SUBTREE)?;
-            let gsp_vector =3D vectors.vector_for(crate::irq::gsp::GSP_SUB=
TREE)?;
-            let irq_type =3D vectors.irq_type();
-
             Ok(try_pin_init!(NovaCore {
+                vectors: crate::irq::alloc_vectors(pdev, crate::irq::gsp::=
GSP_SUBTREE)?,
+                // SAFETY: `vectors` is initialized above, lives at a pinn=
ed stable address, and
+                // is dropped after all fields that use `vectors_ref` (str=
uct field drop order).
+                vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref=
().get_ref()) },
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/b=
ar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once =
available.
                 //
                 // SAFETY: `bar` is initialized before this expression is =
evaluated
                 // (`try_pin_init!()` initializes fields in the order they=
 appear here), lives at a
                 // pinned stable address, and is dropped after `gpu` (stru=
ct field drop order).
-                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) =
}, vectors),
+                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) =
}, vectors_ref),
                 // Quiesce the interrupt tree before registering the handl=
er below.
                 _: {
                     // SAFETY: as for the `bar` borrow above.
                     let bar =3D unsafe { &*core::ptr::from_ref(bar) };
-                    crate::irq::gsp::quiesce(bar, gpu.chipset(), irq_type)=
;
+                    crate::irq::gsp::quiesce(bar, gpu.chipset(), vectors_r=
ef.irq_type());
                 },
                 // Register the permanent GSP SWGEN0 handler before enabli=
ng the interrupt.
                 //
-                // SAFETY: `bar` is initialized before this expression is =
evaluated, lives at a
-                // pinned stable address, and is dropped after `_gsp_irq` =
(declared first, so
-                // dropped first), so the handler's borrow stays valid for=
 its whole lifetime.
-                // `_gsp_irq` is stored in `NovaCore`, whose `Drop` runs `=
free_irq`, so the
-                // registration is never leaked.
+                // SAFETY: `bar` and `vectors` are initialized and pinned =
(see above). `_gsp_irq`
+                // is declared before `vectors` in the struct, so it is dr=
opped first, ensuring
+                // `free_irq` runs before the vectors are freed. The regis=
tration is stored in
+                // `NovaCore` and never leaked.
                 _gsp_irq <- unsafe {
                     GspIrq::new(
                         pdev,
-                        gsp_vector,
-                        irq_type,
+                        vectors_ref,
                         &*core::ptr::from_ref(bar),
                         gpu.cmdq(),
                         gpu.chipset(),
@@ -129,7 +134,7 @@ fn probe<'bound>(
                 _: {
                     // SAFETY: as for the `bar` borrow above.
                     let bar =3D unsafe { &*core::ptr::from_ref(bar) };
-                    crate::irq::gsp::enable(bar, gpu.chipset(), irq_type);
+                    crate::irq::gsp::enable(bar, gpu.chipset(), vectors_re=
f.irq_type());
                     gpu.cmdq().drain()?;
                 },
                 _reg: auxiliary::Registration::new(
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9700eff6db86..11a66a597298 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -339,7 +339,7 @@ pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
     pub(crate) fn new(
         pdev: &'gpu pci::Device<device::Core<'_>>,
         bar: Bar0<'gpu>,
-        vectors: SubtreeVectors<'gpu>,
+        vectors: &'gpu SubtreeVectors<'gpu>,
     ) -> impl PinInit<Self, Error> + 'gpu {
         let dev =3D pdev.as_ref();

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index ddf322f2e623..6f2ab85ccdc9 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -16,6 +16,7 @@

 use kernel::{
     device::Bound,
+    irq,
     pci::{
         self,
         IrqType,
@@ -28,9 +29,8 @@
 ///
 /// MSI-X raises a separate table entry per subtree, so subtree `N` arrive=
s on entry `N`. MSI has a
 /// single message that every subtree raises, so all of them arrive on the=
 one allocated entry.
-#[derive(Clone, Copy)]
 pub(crate) struct SubtreeVectors<'a> {
-    vectors: pci::IrqAllocation<'a>,
+    vectors: pci::IrqVectorRegistration<'a>,
     /// `TOP` bit of every subtree nova-core services.
     serviced: u32,
 }
@@ -41,18 +41,21 @@ pub(crate) fn irq_type(&self) -> IrqType {
         self.vectors.irq_type()
     }

-    /// Returns the vector that delivers `subtree`, a single `TOP` bit of =
the form
-    /// `interrupt_tree::vector_subtree_mask` returns.
+    /// Returns an [`irq::IrqRequest`] for the vector that delivers `subtr=
ee`.
     ///
     /// # Errors
     ///
     /// `EINVAL` if `subtree` names anything other than a single subtree n=
ova-core services.
-    pub(crate) fn vector_for(&self, subtree: u32) -> Result<pci::IrqVector=
<'a>> {
+    pub(crate) fn request_for(
+        &self,
+        subtree: u32,
+    ) -> Result<irq::IrqRequest<'_, &'_ pci::IrqVectorRegistration<'_>>> {
         if subtree.count_ones() !=3D 1 || subtree & self.serviced =3D=3D 0=
 {
             return Err(EINVAL);
         }

-        self.vectors.vector(entry_index(self.irq_type(), subtree))
+        self.vectors
+            .request(entry_index(self.irq_type(), subtree) as usize)
     }
 }

diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nova-=
core/irq/doorbell_test.rs
index bfdfee732892..2c123d0cdc52 100644
--- a/drivers/gpu/nova-core/irq/doorbell_test.rs
+++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
@@ -144,7 +144,13 @@ struct SelftestGuard<'a, 'r> {
     bar: Bar0<'a>,
     tree: Tree,
     doorbell: LeafIndex,
-    reg: Option<Pin<KBox<irq::Registration<'r, DoorbellTestHandler<'a>>>>>=
,
+    reg: Option<
+        Pin<
+            KBox<
+                irq::Registration<'r, DoorbellTestHandler<'a>, &'r pci::Ir=
qVectorRegistration<'r>>,
+            >,
+        >,
+    >,
 }

 impl<'a, 'r> SelftestGuard<'a, 'r> {
@@ -195,11 +201,11 @@ pub(crate) fn run_selftest<'a>(
     pdev: &'a pci::Device<Bound>,
     bar: Bar0<'a>,
     chipset: Chipset,
-    vectors: SubtreeVectors<'_>,
+    vectors: &'a SubtreeVectors<'a>,
 ) -> Result {
     // The interrupt type decides how the handler rearms delivery, so the =
tree takes it from
     // probe's allocation.
-    let vector =3D vectors.vector_for(DOORBELL_SUBTREE)?;
+    let request =3D vectors.request_for(DOORBELL_SUBTREE)?;
     let irq_type =3D vectors.irq_type();
     let tree =3D Tree::new(chipset, irq_type, DOORBELL_SUBTREE);
     let doorbell =3D LeafIndex::new::<DOORBELL_LEAF>();
@@ -252,7 +258,14 @@ pub(crate) fn run_selftest<'a>(
         // SAFETY: the registration is owned by `guard` below and dropped =
before this function
         // returns, so its `Drop` (which calls `free_irq()`) always runs a=
nd the registration is
         // never leaked or `mem::forget`-ed.
-        unsafe { pdev.request_irq(vector, irq::Flags::TRIGGER_NONE, c"nova=
-core", handler_init) },
+        unsafe {
+            irq::Registration::new(
+                request,
+                irq::Flags::TRIGGER_NONE,
+                c"nova-core",
+                handler_init,
+            )
+        },
         GFP_KERNEL,
     )?;

diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/g=
sp.rs
index ecd716b92d4e..558f944c4c0d 100644
--- a/drivers/gpu/nova-core/irq/gsp.rs
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -202,22 +202,21 @@ fn handle_threaded(&self) -> irq::IrqReturn {
 #[pin_data(PinnedDrop)]
 pub(crate) struct GspIrq<'a> {
     #[pin]
-    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
+    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>, &'a pci::IrqVecto=
rRegistration<'a>>,
     /// Borrowed BAR0 and the interrupt tree, used by the teardown to disa=
ble the GSP source.
     bar: Bar0<'a>,
     tree: Tree,
 }

 impl<'a> GspIrq<'a> {
-    /// Registers the GSP SWGEN0 threaded handler on `vector`.
+    /// Registers the GSP SWGEN0 threaded handler for the GSP subtree in `=
vectors`.
     ///
     /// # Safety
     ///
     /// The caller must not leak the returned value: its [`Drop`] runs `fr=
ee_irq`.
     pub(crate) unsafe fn new(
         pdev: &'a pci::Device<device::Bound>,
-        vector: pci::IrqVector<'a>,
-        irq_type: pci::IrqType,
+        vectors: &'a super::SubtreeVectors<'a>,
         bar: Bar0<'a>,
         cmdq: Arc<Cmdq>,
         chipset: Chipset,
@@ -227,15 +226,15 @@ pub(crate) unsafe fn new(
             // SAFETY: the caller guarantees the returned `GspIrq` is not =
leaked, so this
             // registration's `Drop` (`free_irq`) always runs.
             reg <- unsafe {
-                pdev.request_threaded_irq(
-                    vector,
+                irq::ThreadedRegistration::new(
+                    vectors.request_for(GSP_SUBTREE)?,
                     irq::Flags::TRIGGER_NONE,
                     c"nova-core",
-                    GspInterrupt::new(bar, cmdq, chipset, irq_type, dev),
+                    GspInterrupt::new(bar, cmdq, chipset, vectors.irq_type=
(), dev),
                 )
             },
             bar,
-            tree: Tree::new(chipset, irq_type, GSP_SUBTREE),
+            tree: Tree::new(chipset, vectors.irq_type(), GSP_SUBTREE),
         })
     }
 }
