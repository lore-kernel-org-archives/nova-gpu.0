Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E95B52D2C1
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690389; cv=none; b=eND3RFg1qCfU6+k0/kKnWM8uirpVTRswx7HtDLR1hsy7kEKH+OVeic5jiW58MUD+uxsNPD3NyJH4XLNiMnbVPpldk2hRQePWkZn0+rUGJU58KGBD9kGNqJhsh+DASvYuv2r64WjhZqP8mwAEkv0kuAddAiSdkki0G+vbZEK3apM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690389; c=relaxed/simple;
	bh=9fjvtCyal7NztP6B+6hP4kpRSHi5mHyKVvCLMeIwZ+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=am2qz7yInkpN+91M5uriw8CrMLFaVudJHJ3+POibxyvwNHIlmdl5MvI7mErV29rV0rbm7NNd/GBDTfSYgjXzXrJYkdOMw4VKgu7AOx/WSeus8L4MwJ8VAafJFwe2UwtC0HVBbS4dJRAe7HMR3/u0jFHyUgEKAvzvIfj4S59iT1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FPPWKGiL; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FPPWKGiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=KD
	1dCXTD7MYXLV5XoiyF39heuFS0oxVS5PawBT6tEZY=; b=FPPWKGiL7taS4fcJxo
	r8mwObGsqDHRjiaFFsBjl/HTMQghc/rYRNFqCZzmk8cqDLZPsBeVX82W1q2Z/o1Q
	cfHpq2pisX/Uq1pdeKUZg1GzFkYq12Cs56rkWeLgDL8hnUaKY0yobWVDr8dyLwkK
	vjOkc4KefYlCYrTkahokyRBcI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3rr08xLtqmCNYBg--.46271S5;
	Tue, 29 Sep 2026 21:59:35 +0800 (CST)
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
Subject: [PATCH v6 08/10] rust: macros: test exhaustive conversion derives
Date: Tue, 29 Sep 2026 21:58:53 +0800
Message-ID: <20260929135855.36775-9-chaoji_xinren@163.com>
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
X-CM-TRANSID:_____wD3rr08xLtqmCNYBg--.46271S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3tF13AFWUZF4UCr1ktFWxXrb_yoWkAw43pw
	48K3y0g347Xr93Cay8twsru3y7WFWfJ3W5XFWrJr1xZFWjqFsrWw1fJ3yfGFyFkF1kZF9I
	gFyDAr4DGr1jya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRYZXOUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC4gfLR2q7xEeliQAA3X

Exercise From alongside Into and TryFrom with shared and
direction-specific helpers. Cover signed and unsigned bounded ranges,
bool, all 256 values of full-width u8/i8 inputs, implicit and constant
discriminants, cfg variants, and the standard infallible TryFrom blanket
implementation.

Check E0080 for incomplete domains, gaps, invalid bounded widths, and
out-of-range discriminants even without a call site. Separately check
duplicate discriminants (E0081), overlapping TryFrom implementations
(E0119), unsupported layouts, and large primitive domains including
128-bit spans.

Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs | 372 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 372 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 7fa8a22dc913..c23b8819572e 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -1671,3 +1671,375 @@ mod overflow_assert_works_on_unsigned_int {}
     /// ```
     mod any_try_from_target_overflow_is_rejected {}
 }
+
+mod derive_from_tests {
+    /// ```
+    /// use kernel::{macros::{From, Into}, num::Bounded};
+    ///
+    /// #[derive(Debug, PartialEq, From, Into)]
+    /// #[convert(Bounded<i8, 2>, Bounded<i16, 2>, Bounded<i32, 2>, Bounded<i64, 2>)]
+    /// #[from(Bounded<isize, 2>)]
+    /// #[repr(i8)]
+    /// enum Signed {
+    ///     Zero = 0,
+    ///     Min = -2,
+    ///     Max = 1,
+    ///     Negative = -1,
+    /// }
+    ///
+    /// for value in -2..=1 {
+    ///     let bounded = Bounded::<i8, 2>::try_new(value).unwrap();
+    ///     let result: Bounded<i8, 2> = Signed::from(bounded).into();
+    ///     assert_eq!(result, bounded);
+    ///     assert_eq!(Signed::from(bounded.cast::<i16>()), Signed::from(bounded));
+    ///     assert_eq!(Signed::from(bounded.cast::<i32>()), Signed::from(bounded));
+    ///     assert_eq!(Signed::from(bounded.cast::<i64>()), Signed::from(bounded));
+    ///     assert_eq!(Signed::from(bounded.cast::<isize>()), Signed::from(bounded));
+    /// }
+    /// ```
+    mod signed_and_unordered_discriminants {}
+
+    /// ```
+    /// use kernel::{macros::{From, Into}, num::Bounded};
+    ///
+    /// #[derive(Debug, PartialEq, From, Into)]
+    /// #[convert(Bounded<u8, 2>, Bounded<u16, 2>, Bounded<u32, 2>, Bounded<u64, 2>)]
+    /// #[from(Bounded<usize, 2>)]
+    /// enum Unsigned {
+    ///     A = base(),
+    ///     B,
+    ///     C = 1 << 1,
+    ///     D,
+    /// }
+    /// const fn base() -> isize { 0 }
+    ///
+    /// for value in 0..=3 {
+    ///     let bounded = Bounded::<u8, 2>::try_new(value).unwrap();
+    ///     let result: Bounded<u8, 2> = Unsigned::from(bounded).into();
+    ///     assert_eq!(result, bounded);
+    ///     assert_eq!(Unsigned::from(bounded.cast::<u16>()), Unsigned::from(bounded));
+    ///     assert_eq!(Unsigned::from(bounded.cast::<u32>()), Unsigned::from(bounded));
+    ///     assert_eq!(Unsigned::from(bounded.cast::<u64>()), Unsigned::from(bounded));
+    ///     assert_eq!(Unsigned::from(bounded.cast::<usize>()), Unsigned::from(bounded));
+    /// }
+    /// ```
+    mod constants_and_implicit_discriminants {}
+
+    /// ```
+    /// use kernel::{macros::From, num::Bounded};
+    ///
+    /// #[derive(Debug, PartialEq, From)]
+    /// #[from(Bounded<i8, 1>)]
+    /// enum Signed { Negative = -1, Zero = 0 }
+    /// assert_eq!(Signed::from(Bounded::<i8, 1>::new::<-1>()), Signed::Negative);
+    /// assert_eq!(Signed::from(Bounded::<i8, 1>::new::<0>()), Signed::Zero);
+    ///
+    /// #[derive(Debug, PartialEq, From)]
+    /// #[from(bool, Bounded<u8, 1>)]
+    /// #[repr(u8)]
+    /// enum Unsigned { Zero = 0, One = 1 }
+    /// assert_eq!(Unsigned::from(Bounded::<u8, 1>::new::<0>()), Unsigned::Zero);
+    /// assert_eq!(Unsigned::from(Bounded::<u8, 1>::new::<1>()), Unsigned::One);
+    /// assert_eq!(Unsigned::from(false), Unsigned::Zero);
+    /// assert_eq!(Unsigned::from(true), Unsigned::One);
+    /// ```
+    mod single_bit_ranges {}
+
+    /// ```
+    /// use kernel::{macros::{From, Into, TryFrom}, prelude::*};
+    ///
+    /// #[derive(Debug, PartialEq, From, Into, TryFrom)]
+    /// #[from(bool)]
+    /// #[into(u8)]
+    /// #[try_from(u8)]
+    /// enum Switch { Off, On }
+    ///
+    /// let infallible: core::result::Result<Switch, core::convert::Infallible> =
+    ///     Switch::try_from(true);
+    /// assert_eq!(infallible, Ok(Switch::On));
+    /// assert_eq!(Switch::try_from(2_u8), Err(EINVAL));
+    /// assert_eq!(u8::from(Switch::from(false)), 0);
+    /// ```
+    mod distinct_inputs_and_blanket_try_from {}
+
+    /// ```
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(Debug, PartialEq, From)]
+    /// #[from(bool)]
+    /// enum Switch {
+    ///     Off,
+    ///     On,
+    ///     #[cfg(any())]
+    ///     Unavailable,
+    /// }
+    /// assert_eq!(Switch::from(true), Switch::On);
+    /// ```
+    mod cfg_variants {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(Bounded<u8, 2>)]
+    /// enum Gap { A = 0, C = 2, D = 3 }
+    /// ```
+    ///
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(Bounded<u8, 2>)]
+    /// enum MissingMinimum { B = 1, C = 2, D = 3 }
+    /// ```
+    ///
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(Bounded<i8, 2>)]
+    /// enum MissingNegative { A = -1, B = 0, C = 1 }
+    /// ```
+    ///
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(bool)]
+    /// enum MissingTrue { False = 0 }
+    /// ```
+    mod missing_values_without_calling_conversion {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(Bounded<i8, 2>)]
+    /// enum Overflow { A = -3, B = -1, C = 0, D = 1 }
+    /// ```
+    ///
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(bool)]
+    /// enum Overflow { A = 0, B = 2 }
+    /// ```
+    mod correct_count_with_invalid_discriminant {}
+
+    /// ```compile_fail,E0081
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(bool)]
+    /// enum Duplicate { A = 0, B = 0 }
+    /// ```
+    mod duplicate_discriminants {}
+
+    /// ```compile_fail,E0119
+    /// use kernel::{macros::{From, TryFrom}, prelude::*};
+    ///
+    /// #[derive(From, TryFrom)]
+    /// #[convert(bool)]
+    /// enum Conflict { A, B }
+    /// ```
+    mod conflicting_try_from {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(bool, Bounded<u8, 2>)]
+    /// enum IncompleteForSecondInput { A, B }
+    /// ```
+    mod every_input_must_be_exhaustive {}
+
+    /// ```compile_fail
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(bool)]
+    /// enum Empty {}
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(bool)]
+    /// #[repr(C)]
+    /// enum ReprC { A, B }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(bool)]
+    /// enum Payload { A(u8), B { value: u8 } }
+    /// ```
+    mod unsupported_layouts {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(Bounded<u8, 0>)]
+    /// enum ZeroWidth { A = 0 }
+    /// ```
+    ///
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(Bounded<u8, 9>)]
+    /// enum TooWide { A, B }
+    /// ```
+    mod invalid_bounded_widths {}
+
+    /// ```
+    /// use kernel::{macros::From, num::Bounded};
+    ///
+    /// macro_rules! check_byte {
+    ///     ($name:ident, $ty:ident, $min:expr) => {
+    ///         #[derive(From)]
+    ///         #[from($ty, Bounded<$ty, 8>)]
+    ///         #[repr($ty)]
+    ///         enum $name {
+    ///             V0 = $min,
+    ///             V1, V2, V3, V4, V5, V6, V7, V8,
+    ///             V9, V10, V11, V12, V13, V14, V15, V16,
+    ///             V17, V18, V19, V20, V21, V22, V23, V24,
+    ///             V25, V26, V27, V28, V29, V30, V31, V32,
+    ///             V33, V34, V35, V36, V37, V38, V39, V40,
+    ///             V41, V42, V43, V44, V45, V46, V47, V48,
+    ///             V49, V50, V51, V52, V53, V54, V55, V56,
+    ///             V57, V58, V59, V60, V61, V62, V63, V64,
+    ///             V65, V66, V67, V68, V69, V70, V71, V72,
+    ///             V73, V74, V75, V76, V77, V78, V79, V80,
+    ///             V81, V82, V83, V84, V85, V86, V87, V88,
+    ///             V89, V90, V91, V92, V93, V94, V95, V96,
+    ///             V97, V98, V99, V100, V101, V102, V103, V104,
+    ///             V105, V106, V107, V108, V109, V110, V111, V112,
+    ///             V113, V114, V115, V116, V117, V118, V119, V120,
+    ///             V121, V122, V123, V124, V125, V126, V127,
+    ///             V128 = (($min as i16) + 128) as $ty,
+    ///             V129, V130, V131, V132, V133, V134, V135, V136,
+    ///             V137, V138, V139, V140, V141, V142, V143, V144,
+    ///             V145, V146, V147, V148, V149, V150, V151, V152,
+    ///             V153, V154, V155, V156, V157, V158, V159, V160,
+    ///             V161, V162, V163, V164, V165, V166, V167, V168,
+    ///             V169, V170, V171, V172, V173, V174, V175, V176,
+    ///             V177, V178, V179, V180, V181, V182, V183, V184,
+    ///             V185, V186, V187, V188, V189, V190, V191, V192,
+    ///             V193, V194, V195, V196, V197, V198, V199, V200,
+    ///             V201, V202, V203, V204, V205, V206, V207, V208,
+    ///             V209, V210, V211, V212, V213, V214, V215, V216,
+    ///             V217, V218, V219, V220, V221, V222, V223, V224,
+    ///             V225, V226, V227, V228, V229, V230, V231, V232,
+    ///             V233, V234, V235, V236, V237, V238, V239, V240,
+    ///             V241, V242, V243, V244, V245, V246, V247, V248,
+    ///             V249, V250, V251, V252, V253, V254, V255,
+    ///         }
+    ///         for raw in <$ty>::MIN..=<$ty>::MAX {
+    ///             assert_eq!($name::from(raw) as $ty, raw);
+    ///             let bounded = Bounded::<$ty, 8>::try_new(raw).unwrap();
+    ///             assert_eq!($name::from(bounded) as $ty, raw);
+    ///         }
+    ///     };
+    /// }
+    /// check_byte!(Unsigned, u8, 0);
+    /// check_byte!(Signed, i8, -128);
+    /// ```
+    mod full_width_primitive_and_bounded {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(u16)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_0 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(u32)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_1 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(u64)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_2 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(u128)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_3 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(usize)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_4 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(i16)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_5 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(i32)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_6 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(i64)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_7 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(i128)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_8 {}
+
+    /// ```compile_fail,E0080
+    /// use kernel::macros::From;
+    ///
+    /// #[derive(From)]
+    /// #[from(isize)]
+    /// enum Incomplete { A, B }
+    /// ```
+    mod incomplete_wide_input_9 {}
+}

