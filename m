Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FF2DCC13
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420763; cv=none; b=bPd9VuRSRXxFLVwNhi1qMOIwCOjkqokM42P/FLRpO3Jf9hxcqvekP0LLFnEq3vBcI/a8YROn923bBeVWnhBs8gr87kMPqV4g1ykgPtRY28jZWNpTSbG8NvWcscnorGtZBcTbiovVHKwmldyAJIeTD1wi69ZskuNpY1KH7By6hfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420763; c=relaxed/simple;
	bh=NyodPeAoXJkshO63ZieYwDDpKeKcY/c8I+oDV4TLxr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qnRwdLL0DDBdg8TwWnTSbVVmnjqZRaHlzBroeE5C5zE9LUSlS1peN8flH3uN4i3iMAaiBagS0BWtWH4D0Gs+7HU8D/68XNzS/2R/3dFBwEaRvQjC6DXBcEZhgKqAutqV4X8jLOXeIsCDNBMrN6j6/vKWegWDNECD/rps1sb+i3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=ImB0UfeU; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="ImB0UfeU"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3078e0dcd67so528922eec.0
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420762; x=1783025562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzC7fmG1jZ13lVBNr652TT3bsOKLyvGJ+KuwuiC1EcU=;
        b=ImB0UfeU3+5O+YYPcBFpEIyXQAcqnnPJNIPTy4Qn36mNllEu03Hm9u9ENLsmjMvz9t
         5fQCqyiOv0UL32PVTVp3TiLOrekyyb4EnZPrt7BrhUKruVlmI9uYrLLBrvfUuwtkP09B
         +3M7AvWy+vn1pm3lesEIJlzb5ZQja5xHNaiP2Q3S4qpPhle9jnyfPb1XFq4TX/ClNvHE
         ZPWCLMP7NCdkzC09khZghc+759RjjokdUoJ9fGfazCQ2QmoVEp9lhsVKeKW1VQL+KZeQ
         vQqCmYKR0tgABK7WH27hGIEw9wPaKxoHRmNzbzd0v92pdbykAORYDWKYEjxOJfda24Pz
         Mfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420762; x=1783025562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzC7fmG1jZ13lVBNr652TT3bsOKLyvGJ+KuwuiC1EcU=;
        b=ZlZNN+NKYo4V7wabFaBfEK9+azr0QvREq5qNd+S7xlY5QuycExbr/+pWCMexuPl9AM
         8xMsaoZQByeWSRbO3q5SvoPQ1xsOyquWTeKNrtbfH7htJk/DOs1SMrrhy0XPwFn5MfoE
         Obtt0jmJH0aRkDnkmBUgX8LQwab+2pcz0mJLdHUsYOPnSqY0arLR5n9f3jL9Mksb8mQR
         JaKIlgolGgdr9K05sBuMPVRMryrpdG0Ugoy6xN35Do4ka0YtviIGrl8IBYvnYQc4um+P
         i8tOjydD4wKHe1HGhxyf0tQxA1fFRHabUzmsjh0yA0d6/pIGQS9oblWHFH/cZsEFWrrj
         Xp5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZwVaB6njvTRcUWvllHoxD27aCYsCefhtxG8Xf8WjATWEvVsOI/yP1Fost6POJBbgSUOqu2OQQbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjfb/w3q5M5yZw4qH1DzPZv342E9ISGoOvF8jUdFXs+QId7nMa
	kSldXv/RPyl1Vd6pfj9wNQRky8Mc9T4Xy4BgVLCqKuxBjzvXd72HX7UWK9z9cj0PeCY=
X-Gm-Gg: AfdE7cnGhfcY0arZ9abqwji9vakvANelc0L9y1/nOjYFK0yER8Z6EhWpcjTAR1OPDTO
	X7qEIc7vergxPh5aITRowDJenLxvwaNY/f1DMm1yNoDDlpvVGkJIto2aoig5D9tmILEUHMh3Gx8
	v6QJkjuB/HxTs5U7TZg7pKpE5h4EvuUSzSGJTPbUl2rohqpyitDL44fH18pntLdwrkOAg7Jami8
	2AuWOiQphv6xkkazBAzOu3f4W0Cg9n7Y1RJLaONnkxcHpycQceqwQlghEWHAHW4TdPcYFW3WZG3
	2gMk3SPDN1nWdhfCKxHARyBlAONnyJZgYJuWrUhw8I/MZqTFrYcgo8bagIAF0ZDWEsXO7kAP5H9
	tRtkud8MhUtWD9BjCgOpkEu4hcs/ynCjFK0hdqDmMgJyFpEXNmDhVkD9lNz/nKA6d8y49Oyencf
	9la59GqjxO6KuYJ0el+eKEt2/RxQ==
X-Received: by 2002:a05:7301:2f8f:b0:2cb:4b8f:b2bd with SMTP id 5a478bee46e88-30c84b1d6f7mr4694957eec.6.1782420761769;
        Thu, 25 Jun 2026 13:52:41 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:41 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH 5/7] drm/nova: use `zerocopy` in bootloader.rs
Date: Thu, 25 Jun 2026 17:51:44 -0300
Message-Id: <20260625205146.5047-6-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625205146.5047-1-niyudi.honda@usp.br>
References: <20260625205146.5047-1-niyudi.honda@usp.br>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In firmware/fwsec/bootloader.rs, replace the following `transmute`
traits with their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`
- `transmute::AsBytes` -> `zerocopy::IntoBytes`
- add `zerocopy::Immutable` where necessary

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 .../gpu/nova-core/firmware/fwsec/bootloader.rs   | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 13af1c381df1..6f1c8daad7d3 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -23,14 +23,8 @@
         Alignment, //
     },
     sizes,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
 };
 
-use zerocopy::FromBytes as _;
-
 use crate::{
     driver::Bar0,
     falcon::{
@@ -61,7 +55,7 @@
 ///
 /// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BootloaderDesc {
     /// Starting tag of bootloader.
     start_tag: u32,
@@ -77,15 +71,13 @@ struct BootloaderDesc {
     /// Size of data section in the image. Unused as we build the data section ourselves.
     _data_size: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
-unsafe impl FromBytes for BootloaderDesc {}
 
 /// Structure used by the boot-loader to load the rest of the code.
 ///
 /// This has to be filled by the GPU driver and copied into DMEM at offset
 /// [`BootloaderDesc.dmem_load_off`].
 #[repr(C, packed)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, IntoBytes, zerocopy_derive::Immutable)]
 struct BootloaderDmemDescV2 {
     /// Reserved, should always be first element.
     reserved: [u32; 4],
@@ -124,8 +116,6 @@ struct BootloaderDmemDescV2 {
     /// Arguments to be passed to the target firmware being loaded.
     argv: u32,
 }
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
 
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
@@ -164,7 +154,7 @@ pub(crate) fn new(
 
             fw.data()
                 .get(desc_offset..)
-                .and_then(BootloaderDesc::from_bytes_copy_prefix)
+                .and_then(|b| BootloaderDesc::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0
         };
-- 
2.34.1

