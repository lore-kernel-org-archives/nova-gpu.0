Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16442236F7
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 19:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414370; cv=none; b=Tx9vX/9MDi2to2FTJcngCtcakdZlOQd6gDXW0og8CiYUwKiWzukhDXazexvC73RPIJPSUXMxqF2bV4luKOVbdI3Jqb8G7REXCM1+Ork1Erz9tH5yALHSr7k6Xc4tipOQbL1+PcqBL+rI4Ex9c34XfmpcpFHHLCuLyyCfxguda6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414370; c=relaxed/simple;
	bh=JezChDeKmz4e6ACoehqELifx3PLlNWERcu3SGBqd3G8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZAAKnnLBrWHDSLvC/d1NYWjGVp1PFHqffC2TiWvyqKxuMFr9EsQDWbX7mnDxCA+Abx/XOebiO/SP3d8Gi7JsORbHJPQ1V/w4l+TNuOVnvBSYnQ5IsTlLuV3WqkmIe4v29R06tp0CEuuC9zTZ/bGGdL2jq0cj6BHmPJS/vUToVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=QqpBLXSg; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="QqpBLXSg"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1384ebe7a10so480716c88.1
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 12:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782414368; x=1783019168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AKNe+HW/iOAU2SHoyF/WHAkP5lgz/mE/XVIjRk/zXs=;
        b=QqpBLXSgvqwhkt8g8tq+hc9H1OZFXf7iAKwOuGKQPEaiVfxeCq1X9QIb35B4aWdy2u
         ExrFKfSACEWdPNwZx3ma5wM1dhs2NtlAYUP5VvuuJFXPIShtR0C5LABfkwA84Y6PFMFq
         kjxJMxKetNzznFw2aIXU1+IS3AkVjY8jHEmNPvgjK1OX8EEv3CqYPVHpeXO54K+1n9Kb
         Pm9Q3VPcFjld0W6NqkgdVy/tpKNixGjYBjVxQZjxQTLVwCjv16Kfo+a+WYPs5YxslxVM
         hX6G38jltOhRSCi9iZpKGKAO8FmId6fj+KCp0v/RuYpdMrksnc2bwhQk8vxA01b+MV7i
         plKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414368; x=1783019168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AKNe+HW/iOAU2SHoyF/WHAkP5lgz/mE/XVIjRk/zXs=;
        b=cIi6f/68/NS5/oKymaJKtSVh0SoLHCCc9HR9FXGVVYqNqgvrzHUw6WXRmFgYhqLbcb
         TdigE4pj3VDwTKTUZbZb9ljEHMHrRCTi9B+1iFPlCRvWd7GGy1n9Him/ppf9iYZH7Btq
         9yLfUfR9ROoL7Hqb9srsGjuddYHvt2gB32ZAGw/3Zow8Q8gxXJ6SRnqR/pDvVKeOGKUo
         oAAuJ9sG59nNi4+u9/LegMdEew+v/VUQA/pdsYY2XsH4nRnITN/nXPzuVKiBnVW80EsW
         0YnKXwaoxDFfTy1jprfudcJLX2eigd0b97GgRzBxL6gxKSlisNOqGAytWZV9kJDW47Pa
         cknA==
X-Forwarded-Encrypted: i=1; AFNElJ/SYFc7LOBIOnNUrQoirS08Cn/F0aScvJwK5na8I99gQMOW/ApQZj7DqySqUzyJibb0ZLx39RNOtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye12SI4MQjVLzghfxBQWSfFVmtC/SFnZ7880wAaMwj/SPiRi9a
	W2EjB34An0ZO6AQGylzRnB9p/DMLYSax106S7iZteoNdPXWttQn4w7LdODAx/8326SFNw61mk6z
	UUQ7lc8zppw==
X-Gm-Gg: AfdE7cmlfrfMISfd8XFCTVRQ3SawM0QH7xtulbKWmIVEIplKHsvQunUweNI1C5QpbpS
	hQPHp7bYbmyobvcUudqNboz/VF2+6lFYb5vX5H4AT/d21mq95EDTxDPmRL9hlBQ2oEbRYvtc0Rd
	qbNPGlACnd5diXpUqSnLexdciRmYgVoGCIBeXYrtc9yMsMBZ0yLQAGalANXpcxoTMjgp0JQa4bD
	HOdHa39rzZxlLBcQehRrlAptY+orVhKvekkB4jA3AIU8Yhm/YoIPXXR3kL/4zFWoZXd2aNqnPNp
	3NYv6Sjhuy0vEpxw2xNk0Cb6lqstYx/HOszkKt2uxy4knFbXnJCRhkANyUkz0zzlM2Rllg/CJ5k
	gFqaXV75FEJS/ZFB9tGEwVmB6RtUewhFVw0PEvVkd9EqDp5wBsRsxuIkGmn5CFSGdPHzYr8Ug/i
	/R7Ie2hdCohe9NOaU=
X-Received: by 2002:a05:7022:90a:b0:130:9b78:b17b with SMTP id a92af1059eb24-139dbb8fd11mr3540098c88.38.1782414367476;
        Thu, 25 Jun 2026 12:06:07 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm10742999c88.6.2026.06.25.12.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:06:06 -0700 (PDT)
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
Subject: [PATCH 1/7] drm/nova: use `zerocopy` in firmware.rs
Date: Thu, 25 Jun 2026 16:05:47 -0300
Message-Id: <20260625190553.7245-2-niyudi.honda@usp.br>
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

In firmware.rs, replace the following `transmute` traits with their
`zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Note that the module `elf` is untouched, as the bindings generated by
bindgen do not implement `FromBytes` for the structs.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware.rs                | 16 ++++------------
 .../gpu/nova-core/firmware/fwsec/bootloader.rs   |  4 +++-
 drivers/gpu/nova-core/vbios.rs                   |  4 ++--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 1e89390209f5..1eae03344a61 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -11,8 +11,7 @@
     device,
     firmware,
     prelude::*,
-    str::CString,
-    transmute::FromBytes, //
+    str::CString, //
 };
 
 use crate::{
@@ -88,7 +87,7 @@ pub(crate) struct FalconUCodeDescV2 {
 
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 pub(crate) struct FalconUCodeDescV3 {
     /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
     hdr: u32,
@@ -119,10 +118,6 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use
-// interior mutability.
-unsafe impl FromBytes for FalconUCodeDescV3 {}
-
 /// Enum wrapping the different versions of Falcon microcode descriptors.
 ///
 /// This allows handling both V2 and V3 descriptor formats through a
@@ -351,7 +346,7 @@ fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
 
 /// Header common to most firmware files.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BinHdr {
     /// Magic number, must be `0x10de`.
     bin_magic: u32,
@@ -367,9 +362,6 @@ struct BinHdr {
     data_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for BinHdr {}
-
 // A firmware blob starting with a `BinHdr`.
 struct BinFirmware<'a> {
     hdr: BinHdr,
@@ -385,7 +377,7 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
 
         fw.get(0..size_of::<BinHdr>())
             // Extract header.
-            .and_then(BinHdr::from_bytes_copy)
+            .and_then(|b| BinHdr::read_from_bytes(b).ok())
             // Validate header.
             .filter(|hdr| hdr.bin_magic == BIN_MAGIC)
             .map(|hdr| Self { hdr, fw })
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 039920dc340b..13af1c381df1 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -29,6 +29,8 @@
     },
 };
 
+use zerocopy::FromBytes as _;
+
 use crate::{
     driver::Bar0,
     falcon::{
@@ -154,7 +156,7 @@ pub(crate) fn new(
         let hdr = fw
             .data()
             .get(0..size_of::<BinHdr>())
-            .and_then(BinHdr::from_bytes_copy)
+            .and_then(|b| BinHdr::read_from_bytes(b).ok())
             .ok_or(EINVAL)?;
 
         let desc = {
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index c6e6bfcd6a1f..e6d144587c4e 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -935,8 +935,8 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
                 Ok(FalconUCodeDesc::V2(v2))
             }
             3 => {
-                let v3 = FalconUCodeDescV3::from_bytes_copy_prefix(data)
-                    .ok_or(EINVAL)?
+                let v3 = FalconUCodeDescV3::read_from_prefix(data)
+                    .map_err(|_| EINVAL)?
                     .0;
                 Ok(FalconUCodeDesc::V3(v3))
             }
-- 
2.34.1

