Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE5246774;
	Sun, 28 Jun 2026 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782666616; cv=none; b=jLO09Z9Puh1Le/Kqp1ZnT/AHLzb+WkRsEk7IoYTM4oorOvrPtPND3utnzBM6GEauzXS9SwxXn2iKL1gheMMdBnWBh3pqlgS9cERIx6/s/KONGt3t2HytS4JwkdGgbkMvPDjRxYNMV5SQBJd9aG+x5ndi4qxoADhtLcy1yF3XuYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782666616; c=relaxed/simple;
	bh=S7d7LfYYwA5ow9NAh0xnwQQR5+Z4CoV6ti8m/IaYQDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJhZYxHxUlerl/DMmNCK42PsvVpBJcUCbGetv0pPeOTa79Wu+nOBSvVtEAgUQRFORMigPojmDhPzNfFEis/fJJYN9nigGtkcf7eCLDmQPnSv+V2wbo8v13KyKXGK7TV2s5Uig3DeIiYHGk8/a/W2qVnsoPfEGXYcPpqPMzarnjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cc2wIpYc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cc2wIpYc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51DD6C2BCC9;
	Sun, 28 Jun 2026 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782666616;
	bh=S7d7LfYYwA5ow9NAh0xnwQQR5+Z4CoV6ti8m/IaYQDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Cc2wIpYcgR3z1NWTm8zUipw/KE/RXeuZxzyrt3VIgRD1ubzkMSOcAWZD6vDzhXIEz
	 D9k78g+LvqW8V11WjMcFRCAv4Cn/gtecBmwVRehbimkdgYpuX52/EAJd1dETL3mDDG
	 C4iD3hRND6AIWTGonPOouHa2e+te2U5laL3H/z9J2ab5ASpBWHpu4Vw3c3EpaPpVfC
	 GhlFYVMGoZmbpt07Px/8xTUD7N9CFOmQ8RsMszMp/Kg6NK/0KFF4TcnhnLTBw0rVif
	 Ma9708MnFesV+B+oaSuLxqNvAOZH5zK1WcEK4LrDE5dcMFl791CcnbrM0mTTbqgw2Y
	 lFn2OQGPsu0mA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E394C43602;
	Sun, 28 Jun 2026 17:10:16 +0000 (UTC)
From: SeungJong Ha via B4 Relay <devnull+engineer.jjhama.gmail.com@kernel.org>
Date: Sun, 28 Jun 2026 17:10:14 +0000
Subject: [PATCH RFC 1/4] rust: transmute: add
 `impl_transmute_via_zerocopy!` macro
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-dma-zerocopy-bridge-v1-1-9a2895ebe30d@gmail.com>
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
In-Reply-To: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782666615; l=2891;
 i=engineer.jjhama@gmail.com; s=20260103; h=from:subject:message-id;
 bh=LXChnJ7p62He8Ts8ziph6RXUwlMDpuOOjkatwstqfkA=;
 b=vxK1wBU87NEi9SKYdoUiW1+9mEw4aAM22XMOB+XGyA6TxcOU8QnSCIocKOmOe/Bc4sHwli3ei
 fBxxCN1DzOMDTIlHtoXx4qsoKoPS+ykCgIf0TBY7LoieR6EbbrS0DgS
X-Developer-Key: i=engineer.jjhama@gmail.com; a=ed25519;
 pk=G5nmjm+RTiWBpyCvc5xjR1b3li/2zipLSMyz+T4fj5E=
X-Endpoint-Received: by B4 Relay for engineer.jjhama@gmail.com/20260103
 with auth_id=590
X-Original-From: SeungJong Ha <engineer.jjhama@gmail.com>
Reply-To: engineer.jjhama@gmail.com

From: SeungJong Ha <engineer.jjhama@gmail.com>

The DMA-coherent allocation APIs (`CoherentAllocation`, `Coherent`,
`dma::Pool`) bound their element type on
`transmute::{AsBytes, FromBytes}`, which a `zerocopy`-deriving type cannot
satisfy. A blanket bridge impl is rejected by coherence, as it overlaps
every existing concrete `transmute` impl.

Add a per-type bridge macro that emits the `transmute` impls for a
`zerocopy`-derived type. A compile-time assertion fails the build unless
the type is `zerocopy::{FromBytes, IntoBytes, Immutable}`, which subsumes
the `transmute::{FromBytes, AsBytes}` contracts, so the emitted unsafe
impls are machine-checked. This lets DMA structures adopt `zerocopy`
incrementally without flipping the DMA bound.

Assisted-by: Claude-Code:claude-opus-4-8
Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/transmute.rs | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 654b5ede2fe2..d9881f84dc62 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -227,3 +227,38 @@ macro_rules! impl_asbytes {
     {<T: AsBytes>} [T],
     {<T: AsBytes, const N: usize>} [T; N],
 }
+
+/// Implements the kernel's `FromBytes` and `AsBytes` byte-safety traits for a type
+/// that already derives the equivalent `zerocopy` traits.
+///
+/// This lets a `zerocopy`-derived type satisfy the bounds required by the
+/// DMA-coherent allocation APIs (`CoherentAllocation`, `Coherent`, `dma::Pool`)
+/// without a hand-audited `unsafe`: the macro fails to compile unless `$t`
+/// implements `zerocopy::FromBytes`, `zerocopy::IntoBytes` and `zerocopy::Immutable`,
+/// which together subsume the safety contracts of [`FromBytes`] and [`AsBytes`].
+#[macro_export]
+macro_rules! impl_transmute_via_zerocopy {
+    ($t:ty) => {
+        const _: () = {
+            // Compile-time proof: fails to build unless `$t` carries the `zerocopy`
+            // byte-safety proofs.
+            fn assert_zerocopy<
+                T: ::zerocopy::FromBytes + ::zerocopy::IntoBytes + ::zerocopy::Immutable,
+            >() {
+            }
+            fn check() {
+                assert_zerocopy::<$t>();
+            }
+        };
+
+        // SAFETY: `$t: zerocopy::FromBytes` guarantees that all bit patterns are valid
+        // and `zerocopy::Immutable` that it has no interior mutability, which is exactly
+        // the contract of `FromBytes`.
+        unsafe impl $crate::transmute::FromBytes for $t {}
+
+        // SAFETY: `$t: zerocopy::IntoBytes` guarantees that it has no uninitialized
+        // (padding) bytes and `zerocopy::Immutable` that it has no interior mutability,
+        // which is exactly the contract of `AsBytes`.
+        unsafe impl $crate::transmute::AsBytes for $t {}
+    };
+}

-- 
2.54.0


