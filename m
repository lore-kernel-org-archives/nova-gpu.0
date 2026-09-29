Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31F52ED34
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690390; cv=none; b=NyA0EvC3hXFkn9kBWn0zuyMKGncEs3wQmE1SV9p9U+zxpMfnMQBFtz1c66J7nxYxQptMc23lkSNzuwbQVaco0z/bFzdjzbm/wPB4kXrWGVS7Acv2qLxkC13oBVSYZ+jTV+0OCpFELWhMqcS1X/guiKJyhuo/OE6cezQcv2SGaYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690390; c=relaxed/simple;
	bh=KP/jBAzSPaGaYf4HT39f9eKG4rN6YxXi/hZZz3cCd5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nW/NWfyQr4GPvfWykB5GyMreVrn+TT9MZu7opT6WKP1yTnUA0n4EHrE01fp92HoSwW1mpXR90b0oLfbQgzx4YeY76imahrJNAEomC/KEd4VCjx9pUMgtegZhzTwoMWM6Mps9x0N5EiFG1Z1RHPNiXLMdi2iVV+y9HsBEts5ae4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ohsPFxIw; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ohsPFxIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9J
	Yc+I4fx493tzaiB9uX+d69rIo9laChvTEy0umgPdg=; b=ohsPFxIw0mSRLy0lqC
	k1LA+O0K1ThmJJ+GYuSi8vvV32aHz3LkWxLMTFxUqYDUoeShxdsIBj9ZydEQc2sY
	hLHmok2vTURuxex7GVLoB7NOjjekDkD9FblV0bEjtU68xjMjMEVm8aVqGyJh7Rur
	0ZcWP7XbgKRcH2EB2YYX1i9vs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3rr08xLtqmCNYBg--.46271S6;
	Tue, 29 Sep 2026 21:59:37 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kaiqi Guo <chaoji_xinren@163.com>
Subject: [PATCH v6 09/10] rust: macros: validate and qualify conversion helper types
Date: Tue, 29 Sep 2026 21:58:54 +0800
Message-ID: <20260929135855.36775-10-chaoji_xinren@163.com>
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
X-CM-TRANSID:_____wD3rr08xLtqmCNYBg--.46271S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr17Kw4UWFy7KF13ArWfGrg_yoW5tF48pr
	WUC3yagFW7J343Gay3Kw47X3yS9FWfX3W5GFZrG3ySvF45WF4kWr42gr1fJryrKr4DAr9I
	9ryqqayDG34jy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE_OzhUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC-QnMSGq7xEmrYwAA3k

Reject generic arguments attached to a primitive helper input.
Previously bool<Undefined> was silently treated as bool because only the
final identifier was validated.

Qualify Result in generated TryFrom signatures and the backing primitive
passed to Bounded::new. Local aliases named Result or u8 must not alter
the implementation after its input was validated as a primitive. Add
compile-pass and compile-fail regressions for each case.

Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs | 52 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index c23b8819572e..0fda475349ef 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -295,7 +295,7 @@ fn impl_try_from(
             #[automatically_derived]
             impl ::core::convert::TryFrom<#input_ty> for #enum_ident {
                 type Error = ::kernel::prelude::Error;
-                fn try_from(#param: #input_ty) -> Result<#enum_ident, Self::Error> {
+                fn try_from(#param: #input_ty) -> ::core::result::Result<#enum_ident, Self::Error> {
                     #overflow_assertion
 
                     #(#clauses)* {
@@ -492,7 +492,8 @@ impl Bounded {
     const QUALIFIED_NAME: &'static str = "::kernel::num::Bounded";
 
     fn emit_new(&self, expr: &Expr) -> TokenStream {
-        let Self { base_ty, bits, .. } = self;
+        let base_ty = self.emit_qualified_base_ty();
+        let bits = &self.bits;
         let qualified_name: syn::Path = parse_str(Self::QUALIFIED_NAME).expect("valid path");
         ::quote::quote! {
             #qualified_name::<#base_ty, #bits>::new::<{ #expr }>()
@@ -556,6 +557,8 @@ fn validate_type(ty: &Type) -> syn::Result<ValidTy> {
     let segment = &path.segments[0];
     if segment.ident == Bounded::NAME {
         return validate_bounded(segment);
+    } else if !matches!(segment.arguments, PathArguments::None) {
+        return Err(make_err(ty));
     } else {
         return validate_primitive(&segment.ident);
     }
@@ -2043,3 +2046,48 @@ mod incomplete_wide_input_8 {}
     /// ```
     mod incomplete_wide_input_9 {}
 }
+
+mod helper_type_tests {
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    /// #[derive(Into)]
+    /// #[into(bool<Undefined>)]
+    /// enum Invalid { A, B }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    /// #[derive(TryFrom)]
+    /// #[try_from(bool<Undefined>)]
+    /// enum Invalid { A, B }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::From;
+    /// #[derive(From)]
+    /// #[from(bool<Undefined>)]
+    /// enum Invalid { A, B }
+    /// ```
+    mod primitive_arguments_are_not_ignored {}
+
+    /// ```
+    /// #![allow(non_camel_case_types, dead_code)]
+    /// use kernel::{macros::{From, Into, TryFrom}, num::Bounded};
+    ///
+    /// type Result = ();
+    /// type u8 = i8;
+    ///
+    /// #[derive(Debug, PartialEq, From, Into, TryFrom)]
+    /// #[from(Bounded<u8, 1>)]
+    /// #[into(Bounded<u8, 1>)]
+    /// #[try_from(u8, Bounded<u8, 2>)]
+    /// enum Switch { Off, On }
+    ///
+    /// let value = Bounded::<core::primitive::u8, 1>::new::<1>();
+    /// assert_eq!(Switch::from(value), Switch::On);
+    /// assert_eq!(Bounded::<core::primitive::u8, 1>::from(Switch::On), value);
+    /// assert_eq!(Switch::try_from(0_u8), Ok(Switch::Off));
+    /// assert_eq!(Switch::try_from(value.extend::<2>()), Ok(Switch::On));
+    /// ```
+    mod names_in_scope_do_not_change_generated_types {}
+}

