Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857BB372049
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 20:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420759; cv=none; b=a+4wn5zqdHVuZ7HgV1PgH2tPCCrI9RFbbzHFzJgH/fviP01PLHqusDrk5ID+Lb1XDpRC5xt3jBQNt50X4TRJ925sARAIBa1ooIZL4VzGK8FqspcLSx21euu4KTOe65peGnFWa6jiHKxNkjwsyM5ORb4kDwGMfZJIl+BmRxDryOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420759; c=relaxed/simple;
	bh=/J3b/L8mneeaNE5Fyq/yYyAveJ7DU+NEYqsX9Rp5P7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZhhfJ7aG0i/0wBF9DAdV6prMYVN62eNZOGvoCgwiu4ptZIu/VDF2LH3+hRMKzgh15oUHveElFt+1eon0W2xbAZ5SAN0Td2ZJXwuW4v0ZNdXd1IZwRD1yI5n+jFrgUE8/PfkKcDrFzxDfVUZEqutudUoYe7nSfLXdXW++wn3xUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=vKBDVD63; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="vKBDVD63"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30c09f29b64so192007eec.0
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 13:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420757; x=1783025557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Whz9p3Ho44DCR9pjX+bz8mpXVMfXqyHIujw7aYpp2e0=;
        b=vKBDVD638veazkktLqVNnodS8Z+qxODtKKKX+66HJtptTF8FP1+NpG2r6SCVdJ7Xh+
         inuZjvSqvHIPEVPiNHS0ef9F1jIZjv7HlXfvB0WoUHqUmVqK2i/omNhV4YRx4x0T4Nq4
         gxUZqExvXH57aOXMlcBIjg99tTiypXWmjuYyIkKancmTe6D2GKE3Oa8de7nD9w/HaF2a
         JMlw6pu21X8gVewP7giXTRgdoQcGzdmRhCJSiMPyc/J0Q3f0RbCB7js/qazBIzWyvQQX
         39ITZ7ylfPc1KXhuD9kVEEB0FEKmZdPQgfAl8tvXkLq8lJS70ItaBCIVpZHIHIL2dkGl
         rXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420757; x=1783025557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Whz9p3Ho44DCR9pjX+bz8mpXVMfXqyHIujw7aYpp2e0=;
        b=EKtACjExqEeH4z5BNBrpQOC+hXpAL2vt369SEBHAnA/IpwAK+BaXffAgtDFDWeOG+y
         rDkyRvNytLEDNN86GGsH1EQw4mMy90ULiDYofVW9uxC7qpftyjLLcJrFTk/clbsjUf8T
         YakRrIWj/q/o2i6Mx757MLB7rRWycBP3QKWFmew0hpggsIhq1lLuxCQuExnP6oi5X0D/
         kRRzaB3MWlxuBuf7ILPXFVc5luQjFrimj4SOeeRoKk8MiaB+yGh/aUxfBAhMzrI27J92
         O/0kA3poVHCZPb7Ef/7kWVLgwjs+BW6RdNeCDknPCbuawgAf1QK/ASNKtTVo9aQVTAdp
         n5iA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4yPkqlqvphyqMlsgVeRqr3bkgWtPtPhvJ/jVh9P9nxx+3yPXIIah4HD5s8b1rBgr2nbprORw0Gg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/zNLMxQBHzxqsa1Qd3tsY4YsJso02sy97ow/sjQpnNct5X0dj
	KMUqH4ZlqVNy6sjybs103FqTYjgk+JGAj35hk1f1BGFJLZ7M0WTjM28mV6c2tEkECQI=
X-Gm-Gg: AfdE7cl2WWEmclATZFZvpemoXog9tUqmO9BXBTCZTOw6jPxSiNuMq9cakiNDtaXJ7U3
	s6JHqtpX3ZEhEuBOyoAbAcJSgCE8FuoEA0IVoVYBegMS19HAgHEXnuxnJDGLb64/FuTMJIE1L/a
	1+ZKEVH/gP+F1l6OY8hJpgppTKnuq1KKyU+M98wzzrCzb3F1/kmkOgofviya5le6uFmmCJFLy5t
	vNTKo+eOiyBTikbUElCuUeZYn0fPGtCyMYnne6oCIXRW3rkht595n+6q+Q9wR+5RlvR2osBPOmn
	My80RCsDzsqVkLAwP+qu5CCZiEFw0Cfx9hdXEc19OXruC+a0vhDjdUmwF2hgtqXytNp8JL37XoJ
	gNu2zL2GfGlt9GJmk5CW6YPj1tOVvTbqLeqLHU6d0BMwYRevIK/E1DmG9kww3z/9pg0+FisydGF
	lejIl5KTsKhjIF7V7MCA2I2W4i2Q==
X-Received: by 2002:a05:7300:fd08:b0:30b:fb88:f059 with SMTP id 5a478bee46e88-30c5562a8a3mr11239343eec.15.1782420756594;
        Thu, 25 Jun 2026 13:52:36 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:35 -0700 (PDT)
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
Subject: [PATCH 4/7] drm/nova: use `zerocopy` in fwsec.rs
Date: Thu, 25 Jun 2026 17:51:43 -0300
Message-Id: <20260625205146.5047-5-niyudi.honda@usp.br>
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

