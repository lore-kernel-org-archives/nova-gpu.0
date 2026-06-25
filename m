Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278713672A9
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 20:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420755; cv=none; b=bEJjAEH+AqFxAF3JJO0/5alzYtdLRrm6+dRlCPxnuRSVwvlZVNzRJS7dAvDv/sa0MNUb7Ubl6MiweL/X7SRfyxFXKvb4DP48jK1AB1gQzD7bmgb24sFcTSR2lVAQtF7JHvrM/6aBGZcyYLy+nnUJoIbIL8ewLrM5L3foFk7mu1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420755; c=relaxed/simple;
	bh=xTBnnZIRHNXyqcH/AMqAc+n4pvXKuXvBMMdPOnty8dA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jcZAURaL64Uq/cebGIGb0j9cUDvlYNmeeie21fVGVPSEDmI328BRFpYNEw4dtEphRr1IOFKcHB4s3GZpznyQPhlhg2//g3/1ZOVSKGdJU24UoD33xhPFaUlWogbrXjp8hkpbt6hiGFY03PhMfymXu6q1BBL8AbCOFYWK+C4rctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=wj+o/lb7; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="wj+o/lb7"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bc871ecdfso431650eec.1
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420752; x=1783025552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOafAK7HDkFPoXdNsVBZ8vVOqlRlb6xT0ugQxmB4YIM=;
        b=wj+o/lb7QRNb9IcOrAd4gDLH3sczQmByxqjJCMtXRqHdfiSEvllDG1yZLckAAZjL/9
         9SsuldBTtVyqRat/kpvxIBv7+HpG9K79WZ9LZAtvdpJ1jApY2PpLMgkDI5GyzPjbwuFf
         ODa74RcS0fIEY82qfdABN405IQ2zqQX6rFg6tuzGEFB8ZaDsa0G74horR+rgl7YuSdRz
         ZqCacPbaaxfOP7NPYGJO26lo0zNWVGNmesDfY4IPLWODHatI1bwrAs9Cd+Pnz4p4WZZ4
         oKefvtAFRUXbz//j/XPxrgS1fUkpLdqPidys98W2KiCnLQ9ZoOpj6oZv4AoXEn9tZ4r0
         iu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420752; x=1783025552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WOafAK7HDkFPoXdNsVBZ8vVOqlRlb6xT0ugQxmB4YIM=;
        b=kmLutkp9L56IIozBUeW3kBeTqhKrf5BmzRsd6+kvI4aYuVQRHzNM5nCZvM+9DPkBQ6
         HqvGY73SMrlliVygl5Sq4+WYUPsExk4lVlQOLfVg8AcVdZq5iFmIdo+LVXeN70kInmL7
         DYAn09pcqxRc8S3GDry4hH3irtrd7kZCdutAC+tBT/df+H07h8H6q940NHjDh/c1Sz0i
         oDIPbtuZ5dcw5mrFWvJgh92O0tvHX8gpsOL/WQ311CAT0WDUmap2nn/gLuxVXoxdCP9W
         kGgeYbU1zxrcKMoQXpFjGM17xTAbPHXE4FdWkN5eEZn+VyH3dSxECcAzUp5aAYKzWJZd
         LjAA==
X-Forwarded-Encrypted: i=1; AHgh+Rr68Y2Amk4v/DS8l8K4CaDnm8Wo+kHVUjBiQDE6DAnSjEa/r5Y68/4gBTQTs0hunV+u3biCPwVQnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOWJ6dAuzbgQEDgDFmtqP5jidbE++HOawFjidHY0gSJWBKdQXR
	BtXeN2C7SRlGL1RpYhL3QsfMzD8pFxk7A9lXfGgkaG2aWhHkkDWh08PV5HBOMlgdUJA=
X-Gm-Gg: AfdE7cmrdBC+0aae6Pqv+bT1kkRcAHToNQ9MjOzm+/IfRvCk/p+ubnT6WUO2AfnS0rO
	Q8oRS3tGuA2qJeEmwGmAcHu39vBRziDnPJmaYtfOzYMSHRZnIbBFXL1NswAP5BNJ+noVMSutfl4
	Qg5L/ksoIYkH4KAe6+8is/kuTqGh6+caE87LzUkIdwH42RnZs+3Al6ejnTUNg1Izcs0D+03Twgx
	qJORAzr0m/52+miqpdVG64OMqIsJfpcqzoJcW24zjWk662pUNg356v78cNzhpFe/bp8D5KDPdjh
	j00zkcgg5hFIKyMhgFrX/FXbMw8zmZaRlCEVv46xLe+Xm59qfAEufmLlStHQbwR7h03esjGE4EI
	5wUbNhto5mnOgXyXTP57bOt6n+jiVHWgxGZUxa0H82UFqbftbgiM/wLTWOzzFoDP3mMDaARXYb2
	S0yN6wnSg3dXM7MOnDkS9nqKTShOpCwb+KZtCP
X-Received: by 2002:a05:7300:8c2c:b0:30c:2af0:1cc with SMTP id 5a478bee46e88-30c84fdf0c5mr4811586eec.34.1782420752189;
        Thu, 25 Jun 2026 13:52:32 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:31 -0700 (PDT)
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
Subject: [PATCH 3/7] drm/nova: use `zerocopy` in booter.rs
Date: Thu, 25 Jun 2026 17:51:42 -0300
Message-Id: <20260625205146.5047-4-niyudi.honda@usp.br>
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

