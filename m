Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF12F8E94
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 19:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414380; cv=none; b=m+HpWn0VwoGcsWIVCTEgqV9NBmsjs6zc7x9ji25QMQFZo6MvQcQrxDhqxXVcngUNqs0yZcQFUJeSrxXuIiZ1Ka+9rPnvCzBrKkUT/GcACGYgkgmUCptfS7dLzxeo0dhSnUwUzRWLOJPjG6M22rdFXyO2n6knF3r94r96EESr5cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414380; c=relaxed/simple;
	bh=/J3b/L8mneeaNE5Fyq/yYyAveJ7DU+NEYqsX9Rp5P7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TA78Pi1pk9z5Y3kwiTOAXEmpAU0uGm2TIGcuXvhauc84OoI3IX1VfwQftMKd5cN9vi54x4T3mKZXEg2B1EX198STvd9wYXjpXDOmH23sJaRPdc8OapdS6ENgCm3+uH6KRkYEVZYzMOESEXbXqLxJbbG9dUXTvlOsU0zDBqZ/fyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=ChsiQ2/O; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="ChsiQ2/O"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137dd4cc208so167859c88.1
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782414378; x=1783019178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Whz9p3Ho44DCR9pjX+bz8mpXVMfXqyHIujw7aYpp2e0=;
        b=ChsiQ2/Ox6IPdoxJ4xAhpyXroaLebELt2EYUX2Y3XYL4vDCYx2Js6yLLoLL2zCMLcg
         PRpwtJqllH2HovfpKGAtsoWhsHY3oJ1S0yFmIdTwNmXpkbueLb0B3yp7uU6in5dBuo34
         kpM3GjoyND4qn+vLNxAfq1AWlhaxZuDFZ2x+CRfuu7LeE1F1JIwVAEtdCdA/RiD3OKsX
         sBqiClStJKUL3NxOI2W8Rc6/TZ+8xz5WvF9FWhZXqCCOHEZvppvsrLNDSFJ2p8B4AQmc
         6zSw6kKlJCEVH2dMFMS0JPckR/OKw1XSIp4DVyiRDryIfn6kui9cCvLOJX9eHYBSC6iB
         PVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414378; x=1783019178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Whz9p3Ho44DCR9pjX+bz8mpXVMfXqyHIujw7aYpp2e0=;
        b=ZVU/6g0zz9lnXUJ0s0dU/8pRgfVjY5MV57JvQCNA/uBt8W2UwSIWJ6VuPuAMtedPpE
         N+mUzSwbU0i4bUYXcCVqX+n6xb4HADok1FOLLSZvxV5Tw7JU+6Vn+D0i/XNP259oUFQk
         WEUItqW2NOpH5V/Vfo7poMXT797qPP2XbiaauLC3IOxbFxq4sWG0bWs97h/VSqBRzZ+r
         XVejzwOMYeUD0fy/SnzkCRzAUOHGoGOBy2LyAI4dYIszgvof/rCzyJd+XIQi8vJ/aBwJ
         5e+BkfbATjxNKMEYYDK+nWXEqjRDPS4p5awn7FO9ayMTZMntLf/f89wvNBWd73pQBmzh
         ie+g==
X-Forwarded-Encrypted: i=1; AFNElJ9+qxodRGkuTKgabQZflYJJcLrUbtaCpu5hjQuEs1gSmCuqiSRMcXY4t1FhJIP6XahlKU3chqJQbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkt2WKHEhpXiBCTPyZX8QYo8/1H6Vj2Sk0sus5WMgWDICcJe50
	aQQqERIL6O8NmV2YTHn28sNeGEpAOK8Kq+0diqoP9oxnf8eJWjUkwCWskFf+v1Eq/VI=
X-Gm-Gg: AfdE7cl+2tUUQ9h/xPQejHDKxnFOWDBiivqvNolYvahtxWz4JoE36NzCsNe7g5gPuU1
	wrWDtpQhUtRBhN3qrN1HY+PSeHb6JEySGxKN6zEH0Fk+mgAmXXhnwZ5nwdpchDFqelj3vE/UaaF
	vgcn3c5vd5IT3Pn9Kg8hCiyDfpw7kf0DP7PsOofwGjeaSMBbTGEV0iDgOKGV4vg/dAnIa/SRkPW
	1XJJq9zDG6hVegyM0kZ3YwL5qhlDYuqJ/TQYL5TGfsy/t6wfCzAyTzwtV+fi3NFf3JHwwytdOI6
	mleHDprQciTUYK/vSuo3YHUFNbo9cKgCoaLcfkYwT7V4feOMZkwisGzYiSl63wmhnpW9pok2RK0
	KdSS6GZLAttfx8ZuiCsne+CgbpCpYtiC0g3NHhz9Tfo40zLo6Kibcv6lQ5WWFLYB3PGXV/bJFzI
	Y9G39YKi3sHMp/3SA=
X-Received: by 2002:a05:7022:f9b:b0:139:85c2:d7bc with SMTP id a92af1059eb24-139c3c1f8a7mr10323239c88.6.1782414378043;
        Thu, 25 Jun 2026 12:06:18 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm10742999c88.6.2026.06.25.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:06:17 -0700 (PDT)
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
Subject: [PATCH 4/7] drm/nova: use `zerocopy` in fwsec.rs
Date: Thu, 25 Jun 2026 16:05:50 -0300
Message-Id: <20260625190553.7245-5-niyudi.honda@usp.br>
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

In firmware/fwsec.rs, replace the following `transmute` traits with
their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`
- `transmute::AsBytes` -> `zerocopy::IntoBytes`
- add `zerocopy::KnownLayout` where necessary

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 47 ++++++-------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 199ae2adb664..aafa481d805f 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -20,10 +20,6 @@
         Device, //
     },
     prelude::*,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
 };
 
 use crate::{
@@ -50,26 +46,22 @@
 const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
 
 #[repr(C)]
-#[derive(Debug)]
+#[derive(Debug, FromBytes)]
 struct FalconAppifHdrV1 {
     version: u8,
     header_size: u8,
     entry_size: u8,
     entry_count: u8,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FalconAppifHdrV1 {}
 
 #[repr(C, packed)]
-#[derive(Debug)]
+#[derive(Debug, FromBytes)]
 struct FalconAppifV1 {
     id: u32,
     dmem_base: u32,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FalconAppifV1 {}
 
-#[derive(Debug)]
+#[derive(Debug, FromBytes, IntoBytes, zerocopy_derive::KnownLayout)]
 #[repr(C, packed)]
 struct FalconAppifDmemmapperV3 {
     signature: u32,
@@ -90,12 +82,8 @@ struct FalconAppifDmemmapperV3 {
     ucode_cmd_mask1: u32,
     multi_tgt_tbl: u32,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
 
-#[derive(Debug)]
+#[derive(Debug, FromBytes, IntoBytes, zerocopy_derive::KnownLayout)]
 #[repr(C, packed)]
 struct ReadVbios {
     ver: u32,
@@ -104,12 +92,8 @@ struct ReadVbios {
     size: u32,
     flags: u32,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for ReadVbios {}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for ReadVbios {}
 
-#[derive(Debug)]
+#[derive(Debug, FromBytes, IntoBytes, zerocopy_derive::KnownLayout)]
 #[repr(C, packed)]
 struct FrtsRegion {
     ver: u32,
@@ -118,22 +102,15 @@ struct FrtsRegion {
     size: u32,
     ftype: u32,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FrtsRegion {}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for FrtsRegion {}
 
 const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
 
 #[repr(C, packed)]
+#[derive(FromBytes, IntoBytes, zerocopy_derive::KnownLayout)]
 struct FrtsCmd {
     read_vbios: ReadVbios,
     frts_region: FrtsRegion,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FrtsCmd {}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for FrtsCmd {}
 
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
@@ -152,11 +129,9 @@ pub(crate) enum FwsecCommand {
 
 /// A single signature that can be patched into a FWSEC image.
 #[repr(transparent)]
+#[derive(FromBytes)]
 pub(crate) struct Bcrt30Rsa3kSignature([u8; BCRT30_RSA3K_SIG_SIZE]);
 
-/// SAFETY: A signature is just an array of bytes.
-unsafe impl FromBytes for Bcrt30Rsa3kSignature {}
-
 impl From<[u8; BCRT30_RSA3K_SIG_SIZE]> for Bcrt30Rsa3kSignature {
     fn from(sig: [u8; BCRT30_RSA3K_SIG_SIZE]) -> Self {
         Self(sig)
@@ -229,7 +204,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
         let hdr = ucode
             .get(hdr_offset..)
-            .and_then(FalconAppifHdrV1::from_bytes_prefix)
+            .and_then(|b| FalconAppifHdrV1::read_from_prefix(b).ok())
             .ok_or(EINVAL)?
             .0;
 
@@ -247,7 +222,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let app = ucode
                 .get(entry_offset..)
-                .and_then(FalconAppifV1::from_bytes_prefix)
+                .and_then(|b| FalconAppifV1::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
@@ -264,7 +239,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let dmem_mapper = ucode
                 .get_mut(dmem_mapper_offset..)
-                .and_then(FalconAppifDmemmapperV3::from_bytes_mut_prefix)
+                .and_then(|b| FalconAppifDmemmapperV3::mut_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
@@ -282,7 +257,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let frts_cmd = ucode
                 .get_mut(frts_cmd_offset..)
-                .and_then(FrtsCmd::from_bytes_mut_prefix)
+                .and_then(|b| FrtsCmd::mut_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
-- 
2.34.1

