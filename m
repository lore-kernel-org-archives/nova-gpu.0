Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95512DCC13
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 20:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420751; cv=none; b=RL0JmhLza+ZmOGn0xY67Z+RidCsmAje4IZby6eEWEJ37XM/eTN3x3L34Rw+6zF6Xvu/aqNkAnLcIZDS81MShkykmOR4dGmLn0NSIwsTDuMQ/0I5cFiXWwlRjMR7Frj/jQ98m4qJP/hXxZEfQPI97SBqUL3AdmnxopEwK6TbcK4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420751; c=relaxed/simple;
	bh=vHMxSHmRYtB8dudop2zEkGg1YGFOjPM9nPcrTfdgb7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y4ssxR01KwAH/4Mc2wqYQcNtXZ2WH0gxkCHlo1JcTuPJxMOQ8cqU2W003KrTFmbzvde7KlXkP6/oeP/nMbxrPpGBt0coUugoETT++QZmYD912TvNV+h5fYjklNQbv6QnMCzlBHvWPyUiLgmzwI3vqTPo2V7Ym7ytFDx3ndc1HJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=VmSX6UtD; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="VmSX6UtD"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c591fb1cbso471554eec.1
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 13:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420749; x=1783025549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbsiPBhRXELXlciyn8qdhc91HfKLi4Tf8gGbIsDN50U=;
        b=VmSX6UtDvDKny2WuloE+PaFBYzGS9M41Co6/OXFivXq9TDzebXRmhSXmv563ZMCRLP
         OmvY/JoClGB3o9UH/czBC1+kEGrOLRTgUHJpr7BsAPO+TU7fd+bri2NQBVYefRMmmA67
         9Yc1bJ489+ixq6W3VohXxU4tqUdhUsoxL12ZXxxdaXa6ZQjSdoCLAHh/KJ0c9xS4Uyox
         8Orv0LL16nh/5ZBfJAKwGQgMlibPaK8dmSEWfBNQ+1tMc3RxLp0h3fQOa3wbnTctCRuy
         m/K86vaf5idSSndZHSXK725tROw+3GLcOk2nllwRaP4oqJXVKogjzu6r40fcCxuA13oJ
         5LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420749; x=1783025549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbsiPBhRXELXlciyn8qdhc91HfKLi4Tf8gGbIsDN50U=;
        b=ek9w06bEIXZQt/2i1YHIVAJIJxXcBMLlZEE8Jj67TvOkpr09g440r3r7hXXpbdsvXe
         YaVYC18IXIx4owedrBgAzrafSi9kdFZdoBcC0yNZ7MJ2WvFGNYW6wIYMNrIkT22BZVdg
         Yh2p8SNyZhJzzGf0EzBOpkfHIin93OIfM9AOtU/Gu6l1+e4kVZyB+qiehwLc02bVCTav
         uztwBlrJ4O0GDHPfCLwfjk/7hPO6PGjVU0oNltmyp4za6lHz3T17OH2GTLum7HqNeUYf
         lwR8Iv1ch9xybB8sGOymS0FQyRocfy1sxLWbdhft4TJ8u2fuzKn6sifmjTFfbiElEuoo
         6fag==
X-Forwarded-Encrypted: i=1; AHgh+RpDwxQrE3pbemSr1uPd4/5i2gTnyLSiXTepCXaEQu6iQc5B1AyEwPbrtlUuV/AxfkIy4azN2qvkLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ11UjXAjGy39RlXC883cOKMkLnx76KNCLZkeSVGzfFbXuBiz+
	ILq0TEQkhzsq8OsSDCht9pUVxFpMfVSpta24NtPQrFxi17fxGrNfRiyZZBx28y2bWM0=
X-Gm-Gg: AfdE7clqJaJb7VhdJYCeW4GLbopJeeeclYYyHZhMfwqUowcqzdjTZbXtjuBnk2ukuV9
	JuelTZUaRbjT3bc4uDFl8ika6k1c3546ChSJK8z+yC7uPjqEOOswm1kA9Y32XqM5cdCx9FpOJTJ
	IFOFbavZ5hBP9jMVBOZRa6eWePG+CxXA440nFKVqshk/iVey0BgfM9QM6VkygpIC7zmQL0W/gMn
	DF/i5YZk6fHIEUhHDdz1C98AgD5ZKA9ThuZ3S5KsmqAIlFywrYlzQmi4dk0P5SU1F1qA+VPP4SX
	fXCLNlj7q55CV6WSjvZLXVHcUXrb7qdTDXhDEvlDCQYND81y0JfnISashm/ig3kDI+AHNPwzPfE
	6oRnEcjQ0kwRDCqFEb7ilsk3K+1MUGDcWqjlrGqvpd2QVPjSETfwOXuj7edAWY9AlL051a7dawr
	C23gdVgOHy1zFQmRuTk6V5xvCM0w==
X-Received: by 2002:a05:7300:7242:b0:304:dd1c:737e with SMTP id 5a478bee46e88-30c84d0e939mr4353344eec.16.1782420748745;
        Thu, 25 Jun 2026 13:52:28 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:28 -0700 (PDT)
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
Subject: [PATCH 2/7] drm/nova: use `zerocopy` in vbios.rs
Date: Thu, 25 Jun 2026 17:51:41 -0300
Message-Id: <20260625205146.5047-3-niyudi.honda@usp.br>
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

In vbios.rs, replave the following `transmute` traits with their
`zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/vbios.rs | 56 +++++++++++-----------------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e6d144587c4e..a3c0c06f6818 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -13,11 +13,8 @@
     register,
     sizes::SZ_4K,
     sync::aref::ARef,
-    transmute::FromBytes,
 };
 
-use zerocopy::FromBytes as _;
-
 use crate::{
     driver::Bar0,
     firmware::{
@@ -359,7 +356,7 @@ pub(crate) fn fwsec_image(&self) -> &FwSecBiosImage {
 }
 
 /// PCI Data Structure as defined in PCI Firmware Specification
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 #[repr(C)]
 struct PcirStruct {
     /// PCI Data Structure signature ("PCIR" or "NPDS")
@@ -388,15 +385,12 @@ struct PcirStruct {
     max_runtime_image_len: u16,
 }
 
-// SAFETY: all bit patterns are valid for `PcirStruct`.
-unsafe impl FromBytes for PcirStruct {}
-
 impl PcirStruct {
     /// The bit in `last_image` that indicates the last image.
     const LAST_IMAGE_BIT_MASK: u8 = 0x80;
 
     fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        let (pcir, _) = PcirStruct::from_bytes_copy_prefix(data).ok_or(EINVAL)?;
+        let (pcir, _) = PcirStruct::read_from_prefix(data).map_err(|_| EINVAL)?;
 
         // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e).
         if &pcir.signature != b"PCIR" && &pcir.signature != b"NPDS" {
@@ -432,7 +426,7 @@ fn image_size_bytes(&self) -> usize {
 /// This is the head of the BIT table, that is used to locate the Falcon data. The BIT table (with
 /// its header) is in the [`PciAtBiosImage`] and the falcon data it is pointing to is in the
 /// [`FwSecBiosImage`].
-#[derive(Debug, Clone, Copy)]
+#[derive(Debug, Clone, Copy, FromBytes)]
 #[repr(C)]
 struct BitHeader {
     /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
@@ -451,12 +445,9 @@ struct BitHeader {
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
@@ -468,7 +459,7 @@ fn new(data: &[u8]) -> Result<Self> {
 }
 
 /// BIT Token Entry: Records in the BIT table followed by the BIT header.
-#[derive(Debug, Clone, Copy)]
+#[derive(Debug, Clone, Copy, FromBytes)]
 #[repr(C)]
 struct BitToken {
     /// 00h: Token identifier
@@ -481,9 +472,6 @@ struct BitToken {
     data_offset: u16,
 }
 
-// SAFETY: all bit patterns are valid for `BitToken`.
-unsafe impl FromBytes for BitToken {}
-
 impl BitToken {
     /// BIT token ID for Falcon data.
     const ID_FALCON_DATA: u8 = 0x70;
@@ -508,7 +496,7 @@ fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
                 .and_then(|data| data.get(..entry_size))
                 .ok_or(EINVAL)?;
 
-            let (token, _) = BitToken::from_bytes_copy_prefix(entry).ok_or(EINVAL)?;
+            let (token, _) = BitToken::read_from_prefix(entry).map_err(|_| EINVAL)?;
 
             // Check if this token has the requested ID
             if token.id == token_id {
@@ -525,7 +513,7 @@ fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
 ///
 /// This header is at the beginning of every image in the set of images in the ROM. It contains a
 /// pointer to the PCI Data Structure which describes the image.
-#[derive(Debug, Clone, Copy)]
+#[derive(Debug, Clone, Copy, FromBytes)]
 #[repr(C)]
 struct PciRomHeader {
     /// 00h: Signature (0xAA55)
@@ -536,13 +524,10 @@ struct PciRomHeader {
     pci_data_struct_offset: u16,
 }
 
-// SAFETY: all bit patterns are valid for `PciRomHeader`.
-unsafe impl FromBytes for PciRomHeader {}
-
 impl PciRomHeader {
     fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        let (rom_header, _) = PciRomHeader::from_bytes_copy_prefix(data)
-            .ok_or(EINVAL)
+        let (rom_header, _) = PciRomHeader::read_from_prefix(data)
+            .map_err(|_| EINVAL)
             .inspect_err(|_| dev_err!(dev, "Not enough data for ROM header\n"))?;
 
         // Check for valid ROM signatures.
@@ -564,7 +549,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 /// PCI Data Structure. It contains some fields that are redundant with the PCI Data Structure, but
 /// are needed for traversing the BIOS images. It is expected to be present in all BIOS images
 /// except for NBSI images.
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 #[repr(C)]
 struct NpdeStruct {
     /// 00h: Signature ("NPDE")
@@ -579,15 +564,12 @@ struct NpdeStruct {
     last_image: u8,
 }
 
-// SAFETY: all bit patterns are valid for `NpdeStruct`.
-unsafe impl FromBytes for NpdeStruct {}
-
 impl NpdeStruct {
     /// The bit in `last_image` that indicates the last image.
     const LAST_IMAGE_BIT_MASK: u8 = 0x80;
 
     fn new(dev: &device::Device, data: &[u8]) -> Option<Self> {
-        let (npde, _) = NpdeStruct::from_bytes_copy_prefix(data)?;
+        let (npde, _) = NpdeStruct::read_from_prefix(data).ok()?;
 
         // Signature should be "NPDE" (0x4544504E).
         if &npde.signature != b"NPDE" {
@@ -784,7 +766,7 @@ fn falcon_data_offset(&self, dev: &device::Device) -> Result<usize> {
         let data = &self.base.data;
         let (ptr, _) = data
             .get(offset..)
-            .and_then(u32::from_bytes_copy_prefix)
+            .and_then(|b| u32::read_from_prefix(b).ok())
             .ok_or(EINVAL)?;
 
         usize::from_safe_cast(ptr)
@@ -814,6 +796,7 @@ fn try_from(base: BiosImage) -> Result<Self> {
 /// The [`PmuLookupTableEntry`] structure is a single entry in the [`PmuLookupTable`].
 ///
 /// See the [`PmuLookupTable`] description for more information.
+#[derive(FromBytes)]
 #[repr(C, packed)]
 struct PmuLookupTableEntry {
     application_id: u8,
@@ -821,9 +804,6 @@ struct PmuLookupTableEntry {
     data: u32,
 }
 
-// SAFETY: all bit patterns are valid for `PmuLookupTableEntry`.
-unsafe impl FromBytes for PmuLookupTableEntry {}
-
 impl PmuLookupTableEntry {
     /// PMU lookup table application ID for firmware security license ucode.
     #[expect(dead_code)]
@@ -836,6 +816,7 @@ impl PmuLookupTableEntry {
 }
 
 #[repr(C)]
+#[derive(FromBytes)]
 struct PmuLookupTableHeader {
     version: u8,
     header_len: u8,
@@ -843,9 +824,6 @@ struct PmuLookupTableHeader {
     entry_count: u8,
 }
 
-// SAFETY: all bit patterns are valid for `PmuLookupTableHeader`.
-unsafe impl FromBytes for PmuLookupTableHeader {}
-
 /// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLookupTableEntry`] for a given
 /// application ID.
 ///
@@ -857,7 +835,7 @@ struct PmuLookupTable {
 
 impl PmuLookupTable {
     fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        let (header, _) = PmuLookupTableHeader::from_bytes_copy_prefix(data).ok_or(EINVAL)?;
+        let (header, _) = PmuLookupTableHeader::read_from_prefix(data).map_err(|_| EINVAL)?;
 
         let header_len = usize::from(header.header_len);
         let entry_len = usize::from(header.entry_len);
@@ -872,8 +850,8 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 
         let mut entries = KVVec::with_capacity(entry_count, GFP_KERNEL)?;
         for i in 0..entry_count {
-            let (entry, _) = PmuLookupTableEntry::from_bytes_copy_prefix(&data[i * entry_len..])
-                .ok_or(EINVAL)?;
+            let (entry, _) = PmuLookupTableEntry::read_from_prefix(&data[i * entry_len..])
+                .map_err(|_| EINVAL)?;
             entries.push(entry, GFP_KERNEL)?;
         }
 
-- 
2.34.1

