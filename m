Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859EC368D6F
	for <nova-gpu@lists.linux.dev>; Sun, 21 Jun 2026 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782052645; cv=none; b=mZa/rOwboHvzkTC14FotJjDHJO7lp2Hd3ezCfAX4ebEgrizNCl8MskT+YD+c9X65kluSr2+GYYWbLyIvoGxZWr1hNeBuf1n+Bx60QA2AhOZcKWB/piW0xPV0oDCvil3p/H7ArT7ahmAwLN3enzNsR7vOPej021SGJOVThxA3sng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782052645; c=relaxed/simple;
	bh=K2tL7wkhVh01MN6j5dGnacIcNMp+BZ1s6cPhbWcKcTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LNUq0Ye6FL7W+JZzigev6WKMDks67VDCqiVJGxvmqBhr3RTVLRV1vyPHXFoQ983rIUK3G6EfOYYdCEzLpb8GaQYmEOiJ/qfoavaaC3+7t9kcMbNAxsXTPOpOFCfjnulhsEYQlGD7y8i67BD47OropobqVw/bnM8gwzTAbA79IRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/i/7pko; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/i/7pko"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8df26121c88so15033086d6.0
        for <nova-gpu@lists.linux.dev>; Sun, 21 Jun 2026 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782052642; x=1782657442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kVQ3xkWLXL4IaDjUu6wCV48CVGQrhtl6ZKE5IwOl7lU=;
        b=M/i/7pkoWo+o9PlxIv+QS6MACBPc9SdHN0pAz7DB2sLTXksdgr2QqrtCcSDrw7Th6q
         T+Ddj4pOZxS+jeqTuVAo8to/wO3ysrpmHWt/+Zb2pkqWbcXBnK5gKZmwtE8+gX7PCZy0
         7hGYEn7tzmvcGBzEJfLyoWPs5UmLSjq2LQdROSxodt3cUU1QrsuPbJYXE2UmlfJ0OpMM
         PRSMVKd3L6QWqzLYC3I3rF6to6uDFKzPnuwCpOIXc9jORcB3DYrNvcNGthY1QcrkZgxL
         iSTasvYCKFmZHJuj2xdV+g5izPa9UMoXK1NDlNhIUY5IuopCIGeJqzkess9r1or5QZMa
         rdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782052642; x=1782657442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVQ3xkWLXL4IaDjUu6wCV48CVGQrhtl6ZKE5IwOl7lU=;
        b=LjVUw8+M+XNdYYW+o8w6kaNmh1jTmYvKc6d+ZTXhL5tQTfQqRxNC2fpN4G9588TOxO
         B+rIByoZcVVQGBx3c9NclWgJpx9YAgruu8OCHSed/51QBbKNRUw0H3VO9LZY+SYWmHLK
         wzdSvk997zlBvM4NACMHxouBf+abUsIMAdarVTE978Dvg/3kfQnYwf5arhiRL2f+T0Mh
         iH6BVmtsJHlx+XGsKr/x0Qx7RiWYXVx3cPEhlExYZBevhUAH6cIMtajPj1aH+HhDLvCN
         reRT51GkpaCx3VdD9dVId/kTTgxPAhUwFFIojm995dIfxCT7cXxv9jS4IHRUiVKImzpC
         YNiw==
X-Forwarded-Encrypted: i=1; AHgh+RpxHGPXFZnYPYx2Zlwd/SJkxjZUOBBtnBLHw6YZwKsneCKT0lI7tzqSDK+y7L9/L/UYxwroPQsotA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaxIyGSSiK8fPqWDnOfkm2R0dt0wHkESWI+IlyKL1b2EmbpSwj
	DT6REFjE6mI4guJwbxb1Iz8MBHKquYqz2DqRcVIUKq6YScbF43BwDL0=
X-Gm-Gg: AfdE7ckOIzf0GjgX7gLuCdUscXpwGel2udbQdidL1d6jKEITe2K/QEFA6aiBCUAjOT2
	jNYwvCnXgzfslndROf0MnQ4OBvrcERG2YbjyrwODX0/8IrJbWt2S9Mow3xf76voCuS/LtBN5xD8
	JTUj1jP4zdDyp1xEX8CnmdIE8MZkm7iUywRqPVEtiInQ717aPp6AOJU51uL+OYxxR727iTGcokL
	IpcgSi2xT5+pLGM+Ns0Qph79OP1Q9tsHy4AQnmOQ0RAdcIp5tfHeMHcfhtQ51XtKYm9NeVSrOG1
	U7sxoOLXJxWJoKSC/21Q1JwdIqKLYfZ6pjjLoeL79QJ4JzwtaGpghg+hWS7yaKE5B+BCI3KDwkr
	EyY9T645+3ZI1BjlaxqGNe/VojoQsqga7R5JIzd7w4f5UNO1V16FNXXYwQpyF8NFGXQRAX86Xe6
	xUr6w99kOye5ZgALuKeC7Nr534m3/C407JVlKNpZglRb3+c03cy4X3TxYxUJey+knx
X-Received: by 2002:ad4:5dc7:0:b0:8ce:b2e9:a4b9 with SMTP id 6a1803df08f44-8de3bef23demr215020686d6.12.1782052642405;
        Sun, 21 Jun 2026 07:37:22 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018011sm65579506d6.5.2026.06.21.07.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:37:22 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev
Subject: [PATCH] gpu: nova-core: parse structs via zerocopy
Date: Sun, 21 Jun 2026 11:36:44 -0300
Message-ID: <20260621143647.264770-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the unsafe `kernel::transmute::FromBytes` trait implementation
for the `FalconUCodeDescV3`, `PcirStruct`, `BitHeader`, `NpdeStruct`,
and `PmuLookupTableHeader` structs with the derivable
`zerocopy::FromBytes` trait.

This change eliminates the manual unsafe implementations in favor of a
derivable trait. When this trait is derived, validity checks are
performed at compile time to make sure that the type can safely
implement `FromBytes`.

Link: https://github.com/Rust-for-Linux/linux/issues/1241
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
NOTE: Compile-tested only. I don't own a piece of hardware where I can
test the nova driver.

 drivers/gpu/nova-core/firmware.rs |  6 +----
 drivers/gpu/nova-core/vbios.rs    | 38 ++++++++-----------------------
 2 files changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index ad37994ac15a..0afd1d3fe5ad 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -86,7 +86,7 @@ pub(crate) struct FalconUCodeDescV2 {

 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 pub(crate) struct FalconUCodeDescV3 {
     /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
     hdr: u32,
@@ -117,10 +117,6 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }

-// SAFETY: all bit patterns are valid for this type, and it doesn't use
-// interior mutability.
-unsafe impl FromBytes for FalconUCodeDescV3 {}
-
 /// Enum wrapping the different versions of Falcon microcode descriptors.
 ///
 /// This allows handling both V2 and V3 descriptor formats through a
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 8b7d17a24660..754812bcbdde 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -13,11 +13,8 @@
         Alignment, //
     },
     sync::aref::ARef,
-    transmute::FromBytes,
 };

-use zerocopy::FromBytes as _;
-
 use crate::{
     driver::Bar0,
     firmware::{
@@ -301,7 +298,7 @@ pub(crate) fn fwsec_image(&self) -> &FwSecBiosImage {
 }

 /// PCI Data Structure as defined in PCI Firmware Specification
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 #[repr(C)]
 struct PcirStruct {
     /// PCI Data Structure signature ("PCIR" or "NPDS")
@@ -330,12 +327,9 @@ struct PcirStruct {
     max_runtime_image_len: u16,
 }

-// SAFETY: all bit patterns are valid for `PcirStruct`.
-unsafe impl FromBytes for PcirStruct {}
-
 impl PcirStruct {
     fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        let (pcir, _) = PcirStruct::from_bytes_copy_prefix(data).ok_or(EINVAL)?;
+        let (pcir, _) = PcirStruct::read_from_prefix(data).map_err(|_| EINVAL)?;

         // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e).
         if &pcir.signature != b"PCIR" && &pcir.signature != b"NPDS" {
@@ -371,7 +365,7 @@ fn image_size_bytes(&self) -> usize {
 /// This is the head of the BIT table, that is used to locate the Falcon data. The BIT table (with
 /// its header) is in the [`PciAtBiosImage`] and the falcon data it is pointing to is in the
 /// [`FwSecBiosImage`].
-#[derive(Debug, Clone, Copy)]
+#[derive(Debug, Clone, Copy, FromBytes)]
 #[repr(C)]
 struct BitHeader {
     /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
@@ -390,12 +384,9 @@ struct BitHeader {
     checksum: u8,
 }

-// SAFETY: all bit patterns are valid for `BitHeader`.
-unsafe impl FromBytes for BitHeader {}
-
 impl BitHeader {
     fn new(data: &[u8]) -> Result<Self> {
-        let (header, _) = BitHeader::from_bytes_copy_prefix(data).ok_or(EINVAL)?;
+        let (header, _) = BitHeader::read_from_prefix(data).map_err(|_| EINVAL)?;

         // Check header ID and signature
         if header.id != 0xB8FF || &header.signature != b"BIT\0" {
@@ -533,7 +524,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 /// PCI Data Structure. It contains some fields that are redundant with the PCI Data Structure, but
 /// are needed for traversing the BIOS images. It is expected to be present in all BIOS images
 /// except for NBSI images.
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 #[repr(C)]
 struct NpdeStruct {
     /// 00h: Signature ("NPDE")
@@ -548,12 +539,9 @@ struct NpdeStruct {
     last_image: u8,
 }

-// SAFETY: all bit patterns are valid for `NpdeStruct`.
-unsafe impl FromBytes for NpdeStruct {}
-
 impl NpdeStruct {
     fn new(dev: &device::Device, data: &[u8]) -> Option<Self> {
-        let (npde, _) = NpdeStruct::from_bytes_copy_prefix(data)?;
+        let (npde, _) = NpdeStruct::read_from_prefix(data).ok()?;

         // Signature should be "NPDE" (0x4544504E).
         if &npde.signature != b"NPDE" {
@@ -845,6 +833,7 @@ fn new(data: &[u8]) -> Result<Self> {
 }

 #[repr(C)]
+#[derive(FromBytes)]
 struct PmuLookupTableHeader {
     version: u8,
     header_len: u8,
@@ -852,9 +841,6 @@ struct PmuLookupTableHeader {
     entry_count: u8,
 }

-// SAFETY: all bit patterns are valid for `PmuLookupTableHeader`.
-unsafe impl FromBytes for PmuLookupTableHeader {}
-
 /// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLookupTableEntry`] for a given
 /// application ID.
 ///
@@ -867,7 +853,7 @@ struct PmuLookupTable {

 impl PmuLookupTable {
     fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        let (header, _) = PmuLookupTableHeader::from_bytes_copy_prefix(data).ok_or(EINVAL)?;
+        let (header, _) = PmuLookupTableHeader::read_from_prefix(data).map_err(|_| EINVAL)?;

         let header_len = usize::from(header.header_len);
         let entry_len = usize::from(header.entry_len);
@@ -1013,15 +999,11 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         let data = self.base.data.get(falcon_ucode_offset..).ok_or(EINVAL)?;
         match ver {
             2 => {
-                let v2 = FalconUCodeDescV2::read_from_prefix(data)
-                    .map_err(|_| EINVAL)?
-                    .0;
+                let (v2, _) = FalconUCodeDescV2::read_from_prefix(data).map_err(|_| EINVAL)?;
                 Ok(FalconUCodeDesc::V2(v2))
             }
             3 => {
-                let v3 = FalconUCodeDescV3::from_bytes_copy_prefix(data)
-                    .ok_or(EINVAL)?
-                    .0;
+                let (v3, _) = FalconUCodeDescV3::read_from_prefix(data).map_err(|_| EINVAL)?;
                 Ok(FalconUCodeDesc::V3(v3))
             }
             _ => {
--
2.47.3

