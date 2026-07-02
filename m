Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E31481A9A
	for <nova-gpu@lists.linux.dev>; Thu,  2 Jul 2026 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993960; cv=none; b=aqqzcAgnXwvuSI26c//73cAiE+f2P5UJ8S3SDSRxNqJbU/Wriv4KDiROKQ02lFu0a5quueRzUsR5sRCMlSYiwrTZLjezWDSV1phAVpph8QonsNHmD14LP2JbIfaTGYJWxlWl2WhWbEJaNr5r+3Gnrin18iXaX8kTYNCFft5s2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993960; c=relaxed/simple;
	bh=g7R8tEi4i6Q6H+mFQbeH+wY/GGgNqL+C96OYgFFuf/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gjBCk7xVUynkPP1Nim6M0qHM7WHKrIHEuzi5MUMaKbCn1Jlkz0LZWDMqR0fCqcbbjafwwFSApFVp45z/7rFfaN70UhJYJP+B5vB8RaZsqLRwGCjYjcT0l3k/ymCdmO/jaOfo69xZ7r7B0a33lHAtvMIGPX7hPCOfWRbJs5txbfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=KwGhu5QB; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="KwGhu5QB"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-735f73287e2so877959137.2
        for <nova-gpu@lists.linux.dev>; Thu, 02 Jul 2026 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993956; x=1783598756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGgdNIxUjLSQ4UNZW/FdSoJV4OLj/5NQZw2raQ+vfnI=;
        b=KwGhu5QBnR5I98z7+/ZnHAAL7xKB0If1V8rdDb2MlY0qgOHDyrQPOdO1At26GSKqYX
         VfksOt7rwtr8ijcjRk/JMlfU7lo3XLkvNY2Iq/RXT0QrVTCTKa2bPCyPChvBjcaM54Jv
         NbQSbRPIlPuSvfP9rw84ZrmFKlOuKGUlo2D54q/8Pktj8Xv2+BUMXU71nacWHi7TJTEV
         sgwLRj3mJ9+4t9lScsTr1rZoqlqnQTlITpd1RGBmZU/eXKbyHw/vp30bBXdMxRLun+FI
         TqioVFTttTeKIIWz48lHdl0nh1DwrPon4HOO1Ft1eZeqxMmMkcInIw2fHC91Djy8LJcb
         xGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993956; x=1783598756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UGgdNIxUjLSQ4UNZW/FdSoJV4OLj/5NQZw2raQ+vfnI=;
        b=H3GLOyXlmFqF7xNYQcDMmwcX9aiKopWqkhr+WdJwWQ03WbNmGXkHEqhdoySAF3bbBq
         RzwWUDPSyTwwC6mC2onHQKxmbMfVHly3qWDNbRyyzldAgKjOKxcBaRLNnFug5SmDyA4f
         gQTivAhiypVpBWiTtf3FxgeG+TGxsqzOf8PX12bpGb8I3WFwf4AvIG2RMd4WKzXa311e
         JgmBRE2oeezPWA1EkVXENGQWlLb6G4482VhCIr/DPN3cwgzUWP7B8m6VmnOiUlQRCykj
         TIrrM8Jrcbx98v7tBiDKio/DCnq3DXhu0K4jGNOelbiTwyK/GHVbjwqlVc/B2J7J4+RZ
         wSeg==
X-Forwarded-Encrypted: i=1; AHgh+RrdLJUyXm7R2WGlDxnIMcKfit4AabO2gCAdX7no9bUwT1gm6rsbjVeaqQZvRut6yjQBX7laIM64EA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGT+esOZisCoJb0XOXAcvDN7XKrr0bHg263eEpDsY9Z9DhQQHl
	tqOWyVzskfLgS5P1tP6J4OCiTbOL9rXxLpkrIQJ+XCuM7C9Z2iYbTrREvrCot0ZEbj0=
X-Gm-Gg: AfdE7cnmEhki2z6lFYyTcCOzsIikRH60kdgX7KHefFqiuhb3cJ5yHqai7sR0uIE99AX
	tU32CKB8IfcVDGzfBXIXkST/m3460pbc+PPmp+VckOTa7v34/80SgKSRolHx7h3MMTvnyPiAKgu
	2ws95M3GhGQyhUt36maDL006cGp7QetVjlgrCd5PqJvmj/iU6cEsq1bUzMyF14U/fGvX4fqsyd+
	KwVgLgqvATWkVBOOnK07OUa5b3bfr3jXxzG8xWesd99vGXjBRXJm7czXK3ep+YwezbzuMgydwBL
	X1RYPTibI1uyf37xzOtw0CDwXaQRY9mmrRoakkdhZZJz4Y8/6dHDN2wv8stkDAYWpwVJtcEk52b
	MD4xXdmTZAeBYPCUbniS5ovP1nThnTUhAF1V1CeoT2avMRKHQtZScPugy4FtEBg5z6rwM842f7e
	diLzNie+UQ1LKIlnI=
X-Received: by 2002:a67:e95b:0:b0:73e:8694:c6da with SMTP id ada2fe7eead31-73e8694ccf7mr500231137.24.1782993956039;
        Thu, 02 Jul 2026 05:05:56 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:05:55 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	apopple@nvidia.com
Cc: nico.antinori.7@gmail.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH v2 4/5] drm/nova: use `zerocopy` in bootloader.rs
Date: Thu,  2 Jul 2026 09:03:23 -0300
Message-Id: <20260702120324.40388-5-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702120324.40388-1-niyudi.honda@gmail.com>
References: <20260702120324.40388-1-niyudi.honda@gmail.com>
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
 .../gpu/nova-core/firmware/fwsec/bootloader.rs | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 66b9f4d1b41c..03d3090bd9ef 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -18,15 +18,9 @@
         Alignable,
         Alignment, //
     },
-    sizes,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
+    sizes, //
 };
 
-use zerocopy::FromBytes as _;
-
 use crate::{
     driver::Bar0,
     falcon::{
@@ -57,7 +51,7 @@
 ///
 /// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BootloaderDesc {
     /// Starting tag of bootloader.
     start_tag: u32,
@@ -73,15 +67,13 @@ struct BootloaderDesc {
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
@@ -120,8 +112,6 @@ struct BootloaderDmemDescV2 {
     /// Arguments to be passed to the target firmware being loaded.
     argv: u32,
 }
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
 
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
@@ -160,7 +150,7 @@ pub(crate) fn new(
 
             fw.data()
                 .get(desc_offset..)
-                .and_then(BootloaderDesc::from_bytes_copy_prefix)
+                .and_then(|b| BootloaderDesc::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0
         };
-- 
2.34.1

