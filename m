Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BBD23ED60
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414374; cv=none; b=FEzIa+WjVyHrJCzZ9DObNKxPR6rcugVKpTAwHHuvdabQmxdtKxBeJZ5FFFtsJLgEguqrNy9bsbZ/hjOai1PIJeuLukY+W2d6IJPgwGhEAcANyfL/Pvf4kc+D9iFVHxDogq3U9YDUAyzp4AfxD+mOLcEuIDVpaXQg6EALhFr643w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414374; c=relaxed/simple;
	bh=vHMxSHmRYtB8dudop2zEkGg1YGFOjPM9nPcrTfdgb7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cTymgHe0d78lvs8Vl7hrFhtp2SIC6+EJztm+kP/YkkgkIf8WrizBjWdGSYrxwzj8VRmGba0FTUkSb7CaO1WYoW+lx1y8pVNqGZM9OgwCYG+qFyEenhvmiolNG5EgGi12ZhE1PAJikoaO+xU3sgv00QbqLr+axlflemuPdhXLrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=gCAEe2uO; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="gCAEe2uO"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13810b63a1aso486331c88.1
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 12:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782414371; x=1783019171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbsiPBhRXELXlciyn8qdhc91HfKLi4Tf8gGbIsDN50U=;
        b=gCAEe2uOWkkKb5OyUrsRuobhX+jGAeJC9Cy8nsqqFYCKwKyHOLuP2vIXebHzq6v+bg
         YWUAGP0y850pg7HCR0dqOUmwBaTQx44bfMKsfaxuuvMdlGKlrD2Fh92YyvyqlzM68u66
         c+rCP0k0BQrg+2yIwfQw8Ot/OE1/0jYC4wVK6MtGUVhWrEUdiySkwl7M33m04YGPPXTp
         AXa/Z+6uKZiZLemM7I/FWja/OAgwncX1vrRkKWJdnCz/St9KkFX3yz5VKpJPVBRrooJi
         Htog5tdTs2HkrhScNJVv24cUT/9o5L1jNcO054Ya/lPv5TJJl2QfpmwZyw+KMLdY38Rn
         7AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414371; x=1783019171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbsiPBhRXELXlciyn8qdhc91HfKLi4Tf8gGbIsDN50U=;
        b=mm487uuijujYYDzshBWyagobAW7zDmN1KAfzM242/5cBY0phIiy+TxBNKiFGThB8Rw
         x+fosEGulaw5OAxx/9pWascfKWQOjOArYREmuCEMh61nHFaG7D47kstEVNsC48pM099f
         FHClEjkxDztOSiFAeAPSTVsjMUShKOBTlFpM6hD/KeCy28wcE8tij0zcqemmCLd9wXDX
         ZNasO1ewSeuL9w2APrEE+yc1SX/Jcw4wkCCQ6t6rR6n+hIU7kDcqp0NjA8ecYaFgKnO4
         j3mMLcDtvUmn3m9mDP22SkRUBxi1GiGdrfPqhAK4Wdw7NWOnBfUgHhklMGfx+zNQu5VN
         ds5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/eK8UrGoiJuV2p3pKTsn6WxQhnbO2o7lphj7i8warI7Q6IiYfdf8/9yddvRA4ZrQL5Yk326xyH8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxovn7MN64iii8/Zso1x5CpRGkgAuEGROifzg5XJglI3e6zWJwZ
	0eJ3cMiMFEd4mk08dMFeqWgksOVtPzQF4xqXjnPT0NHngqTAMgNbpJjUulRBP0D2FNbk9bCpeuF
	5PBJwtfWakg==
X-Gm-Gg: AfdE7cmWLoK48UAjUUXLZAGsTb5g7PKToLiXzKx0V3O+SHsZBvHROh899PhK+3WSOTZ
	9Cf9JvZ8BdDZ4sUZ+gSzIwIyNVtovQmtadRE1zjwEp57/1Ma6h9e6LqDrV/qoRkHRPzzzZiqDmV
	69sv1+7P5Ow+Qpr/EuwMWSkyMdt+Sjz1CSFc+PbrdFbvzlMNJLsDnT903LUAZ3gQkGTnqpAV6ur
	nJW2ueaRRYmFlUIy7Cqbxst2SNJuAlwQKihmXTMPSV5kvBHVcOA6UAJxhrF23jaJ5ESoMPmQ+pd
	/SUxQEIngVwFbQhhIkAS1qoq4Y6nf4qWbzOevSyoBor9ygqc9k2cFGCGD71AKbzycRYOO+bFMvo
	XIlrnIAhr0yZihe4zonxlfvSXgamE+/KQKsyVeOnhqQMynKSdv/yN11zl68NIXhj09SSF6uJ0S+
	tRx54/z8JQ9DsYbHI=
X-Received: by 2002:a05:7022:ef10:b0:137:fc2b:1efe with SMTP id a92af1059eb24-139dbac09f9mr3745379c88.11.1782414370918;
        Thu, 25 Jun 2026 12:06:10 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm10742999c88.6.2026.06.25.12.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:06:10 -0700 (PDT)
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
Subject: [PATCH 2/7] drm/nova: use `zerocopy` in vbios.rs
Date: Thu, 25 Jun 2026 16:05:48 -0300
Message-Id: <20260625190553.7245-3-niyudi.honda@usp.br>
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

