Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601483CF21F
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 13:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690384; cv=none; b=my6jzf3XTGhc6yIN4KBAYtlVJLzWi36kIAC61MOxMczMEpx/g8K8LyCCuYdwprCY+nqITflmcySf7hALctmh/DuLNpR4S65fX6VsaniwmTF6Vew6u8SmikOHPt0ErbXAgAx5hTdEVK5eoGSc/yLNr4KgSIS7hrr4ASf1YrPThqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690384; c=relaxed/simple;
	bh=eEyeq6/fsT0PXkX0UIShoJfo0zn9fqNsdUy75nb+XUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXRFF2aB+xGJVYJRUOXN4kS7iq4O6+cN63YJvWvG+Jh+7OHtuvv5RWPX/7uaK9RevaQqbg5qtRODAxcaMJUlSE8O/PFl4sUsOy9VDxG1I1bIlieSXSZJF/4/tC3N/nFBLufTVj0d3wxVPJNZO9j9pEFad3L8C7+ePOwGmnrB4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AlayzuiV; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AlayzuiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7y
	oPrFuCllkV3FYrWZZnRx/HC6rtb+rnZ0n/lDKR/Ks=; b=AlayzuiVeEw4sQQ6H+
	AnUMZRtapimi3PR1/G2EiiHgSU0vqp7pg8pUkSITJNOONa1DFP9KCXcAIicfpRHY
	xPxNKRzTRX5rPCeFQKT4CRfhuTXv7FcEDcG9ERk0c6kqN+MstIVPv4uv6vu3WErp
	2dELUDg5XSsGvSVpkVB0n2eV0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3rr08xLtqmCNYBg--.46271S3;
	Tue, 29 Sep 2026 21:59:30 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kaiqi Guo <chaoji_xinren@163.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>
Subject: [PATCH v6 06/10] rust: macros: exercise the intended conversion doctest failures
Date: Tue, 29 Sep 2026 21:58:51 +0800
Message-ID: <20260929135855.36775-7-chaoji_xinren@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929135855.36775-1-chaoji_xinren@163.com>
References: <20260929135855.36775-1-chaoji_xinren@163.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3rr08xLtqmCNYBg--.46271S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF48Kw48XF13Ar17Cr1DGFg_yoW5WF1fpa
	yqyayxK3yxGas3Jw4IkFyjqw429ryrWas8XrW8JwnFkw43GF4fur45Kr45Grn0kF18ZF13
	Ka4jyr1DJFn2va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zN388sUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC-gTLR2q7xESv6QAA3h

Use unit-only enums in the repr(C) compile-fail examples so they
exercise the representation check rather than rejecting a struct. Fix
the missing semicolon incidentally hidden by the TryFrom negative test,
and correct the convert helper documentation.

Give the negative Bounded<u32, 32> examples a signed enum representation
so that -1 is a valid discriminant and the conversion overflow assertion
is what rejects it.

Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>

Link: https://lore.kernel.org/rust-for-linux/m2qzr81jrd.fsf@ip-192-168-1-196.ap-southeast-1.compute.internal/
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs |  4 ++--
 rust/macros/lib.rs     | 12 +++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index c07870914242..78efbc7b99d7 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -893,7 +893,7 @@ mod overflow_assert_works_on_signed_bounded {}
     ///
     /// #[derive(Into)]
     /// #[into(Bounded<u32, 32>)]
-    /// #[repr(u64)]
+    /// #[repr(i64)]
     /// enum Foo {
     ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
     ///     A = -1,
@@ -1459,7 +1459,7 @@ mod overflow_assert_works_on_signed_bounded {}
     ///
     /// #[derive(TryFrom)]
     /// #[try_from(Bounded<u32, 32>)]
-    /// #[repr(u64)]
+    /// #[repr(i64)]
     /// enum Foo {
     ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
     ///     A = -1,
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index cc6a96516c93..4d420d34ed6b 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -656,7 +656,7 @@ pub fn CovariantForLt(input: TokenStream) -> TokenStream {
 ///
 /// ## With `#[convert(...)]`
 ///
-/// The macro implements `From<Foo>` for each `T` specified in `#[into(...)]`,
+/// The macro implements `From<Foo>` for each `T` specified in `#[convert(...)]`,
 /// which always overrides `#[repr(...)]`. `#[convert(...)]` is useful when the same type
 /// needs to be specified in both `#[into(...)]` and `#[try_from(...)]`:
 ///
@@ -734,7 +734,10 @@ pub fn CovariantForLt(input: TokenStream) -> TokenStream {
 /// // `repr(C)` enums are not allowed.
 /// #[derive(Into)]
 /// #[repr(C)]
-/// struct Foo(u8);
+/// enum Foo {
+///     A,
+///     B,
+/// }
 /// ```
 #[proc_macro_derive(Into, attributes(into, convert))]
 pub fn derive_into(input: TokenStream) -> TokenStream {
@@ -947,7 +950,10 @@ pub fn derive_into(input: TokenStream) -> TokenStream {
 /// // `repr(C)` enums are not allowed.
 /// #[derive(TryFrom)]
 /// #[repr(C)]
-/// struct Foo(u8)
+/// enum Foo {
+///     A,
+///     B,
+/// }
 /// ```
 #[proc_macro_derive(TryFrom, attributes(try_from, convert))]
 pub fn derive_try_from(input: TokenStream) -> TokenStream {

