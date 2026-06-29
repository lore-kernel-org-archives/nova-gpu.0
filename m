Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3742940F8DF
	for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742823; cv=none; b=eHPeCFzR1KxAuN0AzJCpr0G9PYYFG+b/RJqlQT6bDUM/R3Adz+W6kku+t0sihJ2FhRNL16jKmNGJf9uvpbRt/SHKGOu7li8iOo9+iLAHKoZU4LEZQX1WcWDWdSY+XPdnhP+vFi/QhMbXH6p2twBrqQa/lNEwTxm21ozYRxg1wGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742823; c=relaxed/simple;
	bh=x++pQE5GKKnJe3Jn2ShXEdP1AjYJx61jjswnatHuIlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M5qFJsXrexcFLta0zymzHaRjbeUcnj5win8t4tvTQ2aHwVfJDKFpFB4GR+3jsZJWhZhHrHqh5kyi8lkaOdw+Z9//D0OPDR5f9smY0UFExD4Ba+Cy+cii3gPWiqY8Hdv1fDaTbxUgqNlNhI3XSEn2usEFPZ4nmOFLFnReUVjAFOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTZeogLJ; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTZeogLJ"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so6710059eec.0
        for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782742821; x=1783347621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AupvSFaqPtFwZHXXd++aD6dS9DxYuU7xGlZB7kUfSKk=;
        b=QTZeogLJBakdkFB6VKWPboBAkaZsjrg3w+JPG2XsAVsMg8LUCQ0tWlP5hJS4r71slS
         /J/zNGpu3GvD3zRtNWk9V94XIbzZDmv2KasLPAHfD3Er/cOXa7Yt0GvQkO1QMWAWPkcq
         L6+OWwwlNm8ONdupy8MMlqJwO6L9ZJ69Nl3WI7oHLVUFP0QrNmRw9tLoqlrom4+Hu4ei
         aDi0mBSNGosJPDlsp8IKF7ZMZxUUKt3nhZLoa1kSl6Oxocn2fJmu8txE9nJB3Grsiecu
         CpJMIhjdBVsHtLG5SYIUcMcTe6Ofom+xJpKiChJCYzt7AwNipCuowtiwkqxz9m1XOYRw
         bdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742821; x=1783347621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AupvSFaqPtFwZHXXd++aD6dS9DxYuU7xGlZB7kUfSKk=;
        b=d95L17ImgVtVdbcVZqcPYl7o5cl9KAYvtca8lTB7Ew8d0DlJ9+X7mJpgGg8WHivfi6
         xi8dEZVb4D1YdVgZX6VSvV6I4TMsuwM5IP551DccWAT9S94bMYxAmFo0BPRypfJEDOeK
         erSM9s5UgZxzi5pL4v5LwkJ8zI9yoUr2zp/oUcd4XiP85j44jOpJEQnTWsgaTWlW3TRi
         GUeRMuZ98wQxVuhGg9W3fIrkTPoC9B7YxjAgFm3KqL4H8KpNdn17UJ4Mi0RA2QSuBfWh
         U2TRKdKLjPqxvm4VsCe5hhewjA3qZpBbJqA8vlQnrA0v4hZpFAw7e2BdqHvacUoXUFAk
         P21w==
X-Forwarded-Encrypted: i=1; AHgh+Rq9wwi0XM3YztJVThl7u9Z/3PdUOlsAR2j6A2Yjy5ek+Huh984S1mLQSGTq9+fSfKxzdEdaSbkV0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9ram45dikHQIfKJyhOsjrBniFC1Gjm6q+NeZc2h7sJ+aCF0iJ
	+Es29/b/2WwqUowEG6Nv3Q4XHmtDPIR9zh5zHcuW6vMWw08K3/Xdjh0=
X-Gm-Gg: AfdE7clI4m9cAclnNbMN2DYYF97MLfDpOtpYn9tH5c81k1VNjktzLicKWMBXMBu0Rav
	ICTKG3zRB/NZmlgLX8L417orEsKIK628XzDPFN081oflcsFF5aZGhQTYUtVHrNYr5nlqT7Y8a1o
	RCTWCrIVjRM/gFLqlqt7/6w8R9JHY1GX0oSYOGEj6ufEv7IiymTNeo0juSAw5V1q+KFlRQOWR3E
	nPwtpvPy5D2orUkFhXicNcLB4MfBx3Gyq9vhAZNvEr2Qu2XHZ+n1USjD7S1Auu+gAII1vuNCvF0
	tI9hmO2tvOeO7lNy6RvLW0mHLknZsOAO2aDQ9i3IU47pSnH7HPKuOcHvqkJPSOPoEtZnIp6GPp4
	d9SXLyJfemV/YlX7ja2XNg5hnnRy+1QRYzeUbYxHuMwR7K1lCcbBOGTlHPlpCtmvMsrgY6gQDB1
	BrJeUs2CiDuyMTX8fSxgEwDxOkj+BWmoSJB6WDIRJ3ZA/FykBImfhoNx7aoiimgqHh
X-Received: by 2002:a05:693c:88cd:10b0:30c:ab97:d7b3 with SMTP id 5a478bee46e88-30cab97dc2dmr6285271eec.45.1782742821002;
        Mon, 29 Jun 2026 07:20:21 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52eed6sm44396852eec.9.2026.06.29.07.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:20 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Pedro Yudi Honda <niyudi.honda@usp.br>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev
Subject: [PATCH v2] gpu: nova-core: parse structs via zerocopy
Date: Mon, 29 Jun 2026 11:20:05 -0300
Message-ID: <20260629142007.269873-1-nico.antinori.7@gmail.com>
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
for the `FalconUCodeDescV3`, `PcirStruct`, `BitHeader`, `BitToken`,
`NpdeStruct`, `PciRomHeader`, `PmuLookupTableEntry` and
`PmuLookupTableHeader` structs with the derivable `zerocopy::FromBytes`
trait.

This change eliminates the manual unsafe implementations in favor of a
derivable trait. When this trait is derived, validity checks are
performed at compile time to ensure that the type can safely implement
`FromBytes`.

Link: https://github.com/Rust-for-Linux/linux/issues/1241
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Changelog:
v2:
 - Rebased on top of drm-rust-next
 - Added derive macro FromBytes for BitToken, PciRomHeader, and
   PmuLookupTableEntry
v1: Link to lore [1]

NOTE: Compile-tested only. I don't own a piece of hardware where I can
test the nova driver.

NOTE 2: In firmware.rs, the BinHdr struct is another user of
transmute::FromBytes, but that conversion is intentionally omitted
here as it is handled in Pedro's patch series [2].

[1]: https://lore.kernel.org/nova-gpu/20260621143647.264770-1-nico.antinori.7@gmail.com/
[2]: https://lore.kernel.org/nova-gpu/20260625205146.5047-2-niyudi.honda@usp.br/

 drivers/gpu/nova-core/firmware.rs |  6 +--
 drivers/gpu/nova-core/vbios.rs    | 64 +++++++++----------------------
 2 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 80e948bf7511..a94820a3b335 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -88,7 +88,7 @@ pub(crate) struct FalconUCodeDescV2 {

 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 pub(crate) struct FalconUCodeDescV3 {
     /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
     hdr: u32,
@@ -119,10 +119,6 @@ pub(crate) struct FalconUCodeDescV3 {
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
index c6e6bfcd6a1f..c03650ee5226 100644
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
+            .and_then(|p| u32::read_from_prefix(p).ok())
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

@@ -929,15 +907,11 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         let ver = data.get(1).copied().ok_or(EINVAL)?;
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

