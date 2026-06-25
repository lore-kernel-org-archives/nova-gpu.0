Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB17523ED60
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414377; cv=none; b=uWgG4ib3ar1XPYZL0M+jzevE0tiW6q7XROtaTEvc8Dgu2udatEi+nYEiXJYNB1DGfJHDESvCil+ySmPINyLvxe06+V5dZAGZJu1FykOH6R4pLNdBS3YG5c7DatQTDee+0pDj/ZwV/mVYRYKsgAzXRrqXWxAoxuF0hx4La83AYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414377; c=relaxed/simple;
	bh=xTBnnZIRHNXyqcH/AMqAc+n4pvXKuXvBMMdPOnty8dA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fcBMnKTvWGHJ3DIMwQH/Wtxq8CcoNOglG94GmzkZi7GlC5Z2OlmKK8dZjJKV+VmrtkOjsmVkSKrC6ww/Gmp7jPeBID0bmeAX1dzbX20mRl4Vn/G0QsRM9ICWQGI1h4v7vXoZz6Wt6zKno3HzYxnxKumcIJw6DgWe8qD2a/upglo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=wcd2sVjJ; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="wcd2sVjJ"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-139b5e604b9so305131c88.0
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 12:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782414375; x=1783019175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOafAK7HDkFPoXdNsVBZ8vVOqlRlb6xT0ugQxmB4YIM=;
        b=wcd2sVjJA54eol5tTVWSmnhscwAlAtmCH7BacXd1+eGlMZaAh8KNcQ265gt5EHea5G
         LatypwfjLGPpa71Z1YjUg2ycTj7x0/Lz4BoOHkkx4PDOWTdi3/A14GH00Pm9FrLdWbYk
         gusvJhVQXIcds1dBxBgai6QtLhl6ntn2ZrzPLSwqampdx+QuxWhtaXHZQHN6SPhiqoSH
         kl+Roj+xlGPkTZHZxrn44MN9uF74glibC3ibD8hcyD1+jcK4INS/aATm35RultivLbWm
         az7QN+yDJ/RtI976+fJObBa+uAgqyeXQyYGblCZdESeDpGgURVhIHKA2WPaaIKDmdtvE
         wa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414375; x=1783019175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WOafAK7HDkFPoXdNsVBZ8vVOqlRlb6xT0ugQxmB4YIM=;
        b=q3he2VeNMQGAGb/pv1DCeMgOFcOrVBrDUHCQUZA4X5qY710wFGY5XMAaYpLASuxvnF
         1NX93KYoo5zv59L5ovoaIumTFQkqGQrbPLXERtFVbyZkGHjmVXRmv5Sts5YQHc/CJd/Y
         5gn8iRhX8JW2gnXWLxAZwdUb+Cw/1mMgXQDAXlvHJpZ8F9K7jIgNKtFunVKBCuaYDZEG
         pMnHUMZ9Itocj9wwyoAO4b1R1UkMwpgUrAlGMxAjsENsVv6KuoGnpu7pcge30P7ykFLI
         QBP38iqrzGDip0bCcxGvgQLKFOGLuXYUqTkp2M0qSZQReTbtQVwhV1Kui0baUDIjGXv3
         Q6sA==
X-Forwarded-Encrypted: i=1; AFNElJ/hDkU2U1BcOBS5SkKDKRAfOcotBM2cadkh8ULBwp7XkHksnLxxfll6h0MAoYPmVJTYn1yIOHjgzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB2YXCViT+oDybI+R8DVfn8hVnm0hP03DPCYjuoa4np36CWNQ3
	sA0JFNZ0g9BMBI6o5yXUkwRDpbD8VeCq4xEmxaYVxSN0bMasCBpmcgTxc6rOu4fY4Ms=
X-Gm-Gg: AfdE7cnM4MWaWybfTx4Bfk+wITozKVuvwetKVPLOr8cVBaJXNz2bEvJ4jD1UvX9LQ3l
	REmuyztX/kRvshnZtnV2FN4ovexN3KRsp+wprzYpeOAH+wxrnz1RGq/NiYEP9WShGla1mslf0tH
	tMMhtfBCN6N2Pb+HnqrZfDVgcd4pKNxe7tCfCDz8PEIM+uZTA/q6NOBn1/+bojQza8BiVGA/BD8
	OO5l0mw2HH3a1F4ZQZYjS9NSNIt5znjVf0VTMCKMqsHE6opV3NVJDYL/jSwi+qzSM+qok3JNFJq
	ht6Ywk01vCodEzSBIpiVNPYkkE7wccWEOdgals9J1UYZ5g28xB+zz/5+1UPX9vJnFrHUdiFr4XR
	W4GKH5uNd+leyEdoXAVsGrOdU96XEU3Jx0s5mEIHch8wBxhCePkwAz8THGbosBda+UdE41HyKgZ
	AGZ1FAVuVnVDcBIjE=
X-Received: by 2002:a05:7022:1003:b0:139:bf81:638b with SMTP id a92af1059eb24-139dba0627cmr3156576c88.4.1782414374519;
        Thu, 25 Jun 2026 12:06:14 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm10742999c88.6.2026.06.25.12.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:06:14 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvida.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vgdm.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH 3/7] drm/nova: use `zerocopy` in booter.rs
Date: Thu, 25 Jun 2026 16:05:49 -0300
Message-Id: <20260625190553.7245-4-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625190553.7245-1-niyudi.honda@usp.br>
References: <20260625190553.7245-1-niyudi.honda@usp.br>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In firmware/booter.rs, replace the following `transmute` traits with
their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware/booter.rs | 26 +++++++-----------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index d9313ac361af..0cda2c50fbbe 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -10,8 +10,7 @@
 use kernel::{
     device,
     dma::Coherent,
-    prelude::*,
-    transmute::FromBytes, //
+    prelude::*, //
 };
 
 use crate::{
@@ -44,7 +43,7 @@ fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S>
     let end = offset.checked_add(size_of::<S>()).ok_or(EINVAL)?;
     slice
         .get(offset..end)
-        .and_then(S::from_bytes_copy)
+        .and_then(|b| S::read_from_bytes(b).ok())
         .ok_or(EINVAL)
 }
 
@@ -53,7 +52,7 @@ fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S>
 /// Such firmwares have an application-specific payload that needs to be patched with a given
 /// signature.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct HsHeaderV2 {
     /// Offset to the start of the signatures.
     sig_prod_offset: u32,
@@ -76,9 +75,6 @@ struct HsHeaderV2 {
     header_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsHeaderV2 {}
-
 /// Heavy-Secured Firmware image container.
 ///
 /// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
@@ -145,6 +141,7 @@ fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>
 
 /// Signature parameters, as defined in the firmware.
 #[repr(C)]
+#[derive(FromBytes)]
 struct HsSignatureParams {
     /// Fuse version to use.
     fuse_ver: u32,
@@ -154,9 +151,6 @@ struct HsSignatureParams {
     ucode_id: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsSignatureParams {}
-
 impl HsSignatureParams {
     /// Returns the signature parameters contained in `hs_fw`.
     ///
@@ -171,14 +165,14 @@ fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
         hs_fw
             .fw
             .get(start..end)
-            .and_then(Self::from_bytes_copy)
+            .and_then(|b| Self::read_from_bytes(b).ok())
             .ok_or(EINVAL)
     }
 }
 
 /// Header for code and data load offsets.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct HsLoadHeaderV2 {
     // Offset at which the code starts.
     os_code_offset: u32,
@@ -192,9 +186,6 @@ struct HsLoadHeaderV2 {
     num_apps: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsLoadHeaderV2 {}
-
 impl HsLoadHeaderV2 {
     /// Returns the load header contained in `hs_fw`.
     ///
@@ -206,7 +197,7 @@ fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
 
 /// Header for app code loader.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct HsLoadHeaderV2App {
     /// Offset at which to load the app code.
     offset: u32,
@@ -214,9 +205,6 @@ struct HsLoadHeaderV2App {
     len: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsLoadHeaderV2App {}
-
 impl HsLoadHeaderV2App {
     /// Returns the [`HsLoadHeaderV2App`] for app `idx` of `hs_fw`.
     ///
-- 
2.34.1

