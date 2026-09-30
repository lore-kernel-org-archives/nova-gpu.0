Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81F223392A
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727933; cv=none; b=uJKdDjUAt3sezXw7NuZXt+mBlJ46iURfWsJ2dk5I9VoSSqdCC+kRXWw1uh7W5yF12nVN92mZNJrDt4V7sJgLt2qdTtr0XSA8wwY153x5J9qto11SonRL6u0pQY7G1avetpvK4CClz6fO1kfF8MINQZ6ZRr2glQuXFWj91D5Arbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727933; c=relaxed/simple;
	bh=SW7J5SMiqL0Gzbl5kRpwafYMsTVBh/CSMRByH/pbITo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3uSclvBl1vczSgbX7vQG8JylVU2af5gBNjnqzQiDBK/DqguwnTfCXO4aHWOBYRRXI7MKTCtYxsoB727J1BUg1yyq2ztJ+0uX5GalBJBMedZaTGT8Jpy99knjKDoc4L/hIJNekGp2g2bXa7ulcnIoGsyumVSeOgBVnFRt7+lJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GYHjrjVU; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GYHjrjVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=OH
	RhH+1oSg7raFJfGpoVKv9XaHUJiFyyvPNWgrzFE7Q=; b=GYHjrjVU4uTOXfFJhF
	Vq7R33Yv1RdCBik1As5JdfQJmu6oSz/eB5cBVOfGRy0t/oROi3O7MQ/pYYGfE9Nv
	XAyONjiBMAcuFzZdLi6qLUvITqOmZCpKolLN3/dP3TBaAmeC0h2+/MaLqKQaIoFj
	yEYYl8hDQOrF5VYmdDmI7tsC4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXnq7EVrxq2GTBBw--.56601S11;
	Wed, 30 Sep 2026 08:24:59 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: Jesung Yang <y.j3ms.n@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	work@onurozkan.dev,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	shivamklr@cock.li,
	Kaiqi Guo <chaoji_xinren@163.com>
Subject: [PATCH v7 09/11] rust: macros: validate and qualify conversion helper types
Date: Wed, 30 Sep 2026 08:24:34 +0800
Message-ID: <20260930002436.21395-10-chaoji_xinren@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260930002436.21395-1-chaoji_xinren@163.com>
References: <20260930002436.21395-1-chaoji_xinren@163.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBXnq7EVrxq2GTBBw--.56601S11
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr17Kw4UWFy7KF13ArWfGrg_yoW5Kr1fpr
	WUC3y2gFW7J343Gay3Kw47X3yrWFWfJ3W5GFW7Jw4IvF45WF4kWr47Kr4ftryrKr4DArya
	9ryqqayDK34jy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEVc_sUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC4huVEWq8VtuD-gAA3b

Reject generic arguments attached to a primitive helper input.
Previously bool<Undefined> was silently treated as bool because only the
final identifier was validated.

Qualify Result in generated TryFrom signatures and the backing primitive
passed to Bounded::new. Local aliases named Result or u8 must not alter
the implementation after its input was validated as a primitive. Add
compile-pass and compile-fail regressions for each case.

Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs | 59 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index ddbb686d01e7..127d36ae2faf 100644
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
@@ -2074,3 +2077,55 @@ mod incomplete_wide_input_8 {}
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
+    /// use kernel::{
+    ///     macros::{
+    ///         From,
+    ///         Into,
+    ///         TryFrom, //
+    ///     },
+    ///     num::Bounded, //
+    /// };
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
-- 
2.50.1 (Apple Git-155)

