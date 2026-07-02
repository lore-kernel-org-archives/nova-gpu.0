Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2AC47F2D0
	for <nova-gpu@lists.linux.dev>; Thu,  2 Jul 2026 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993946; cv=none; b=sbHLnaMU+6QGa2vqJqq1e7/XphpFKrkP6/mcUg+dhLjWamJ45aaVciX6cyjE1jlYkYVFlwW3wpcq9hftHS2EgPUzC5djaeSG6am4bAjKRS6bLVplcgM/w4d2xdZxik43mDRUHvHkooaD5I9LqLXe0EwBZoxeoUt2VDk14BjffPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993946; c=relaxed/simple;
	bh=QT3wnmwBKravwpBtjf1E3QkDfkeR+gAXke8tzegpcBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mGU/zCsJl1lOkemSk+LBes9PmYOTXBhC4g5x/9fGSi5Cd3B3YXNJPebtKOt+VAquOC7nj5PnkCA+keKCaUvYQe+E8Dcq+MTJxpdVwlsf5h4W3cL9Vqu3dhy/+7iF75ni55yxopRq6pzfhG2qQpEJlJvb7D4XVFWUeusmnaxvOAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=btDfxRYA; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="btDfxRYA"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-737f6e70678so1071864137.0
        for <nova-gpu@lists.linux.dev>; Thu, 02 Jul 2026 05:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993942; x=1783598742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xv536fNaoYEArBq1hqEwEiGIOw+jADuSEkc+GlzLZk=;
        b=btDfxRYAQOcjR2F0NKGyVZjTEPqF+qQe2l1/fM+HUDDiF64ZDK2mHpTMO0dcZa0IdB
         nyiUd7u8cs6dVtyKz36YPWLcgPg9z04wbXFAp73XAwGONkCygEIjesPXXNxsO6BxMKRI
         U7TIxYZzFmJsidYhn94CkKJeTgPqmFZrBDcU+KnubwAsmuuA/7K+P+o2Udd7o1mwor0p
         wgA8KtAmKX7w0LJNSzwsUx09O5FZ5+c6E/kmDZJ2/4qxo7sV4Aqd/RX7YNT/7jGG8lcb
         9pcQ/C0TzHYujtio1+v9cjNb32BIhcjIjI9A3mDGr3408jKaqwBL1sybJE4psxGZ2rRu
         ppaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993942; x=1783598742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Xv536fNaoYEArBq1hqEwEiGIOw+jADuSEkc+GlzLZk=;
        b=amys9/BZ+cjSbA3uyODqwowpONjLTfXnTxAe89XZxnPwDxlz02qQMdmF/RxlyoM6n3
         Sp++pZmkHqANVDsMUOgbUP0z43F07XrqGFm71Ujb55BuYin8zJgnfZN05ruSrxdqniuk
         0S1Jv38jkkY3U2lS/Dm3kxt0lA3exIg5IC3Jg/vW0qwmfLKvW+8QHsOxekQ5EYy4O/BO
         neaHRStopurWpQQ2ES+4NqKxaF2hbWf+SK4LexnR7pR2e7HPBNx69TWOcm7wnhor7Yl3
         5DjlG9A0IAW6+9f6moGgYHrwvUAm46rEEd6n3mhkE+EiPiRC9oXwewaSvrvgwthIqeiF
         NTGA==
X-Forwarded-Encrypted: i=1; AHgh+Rrmo0pTdsH3mKhOybpOq9LN8vmOGQcsj7J9dJC8bfEsMy/bh+faPteIVfEy9i+GeVdYDN6n6d05/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGRGVsrQAgswlkQARwpqePVwLJbQNuPGdX770j3XUaCv+GWD9M
	PDHnmZxcm7DO6fHTlfUeidaa7UB5SO2njcFMDp73E8trkwNWWeGcMN5j2e1neRPYiMI=
X-Gm-Gg: AfdE7ckxdXCfvtD+CiEPc6t6QX9KfvsEM6hl6PINeWxlKPi435jWCZB/TvsYytE0D7P
	jDqhL0kZ1Hp18O2YmvqOqDoQvvkfJUDxR9GjQrgf4Iv3zxLCaXckD1cdcFXpa/AkLWNhKNQ87x9
	3hAiQYbvSyRoAzo/qEfTofUdTGiafG+1R5YuGQNmYE/mzNwLG1EaUPJdoYoM4ByWgFH0/I5BupQ
	30MVhNQMAVv2O94hUO3OSEfASw1hoHc5T+4mQ7t2/6BsTPpFp6UsTUhv3G80KBQ2lhSsyPLkDy5
	Dulcxw4sxh+WJWjDcgCIs4PeuDEIAJ+mz+3xGN8llBh6QncNocN1YjSYt1OCKiMMjPp0D/vnyvg
	RUjqEoSYFrseZUXP3v6eK5PEqswuLfwROLNiM5fjoZ7l72qQyi5JfD6++ueA50oWRcPtCZO/i6Z
	tU4jz8YwtgjupUMMI=
X-Received: by 2002:a05:6102:441c:b0:729:1a8d:b2d9 with SMTP id ada2fe7eead31-73da9cf0b77mr2617416137.22.1782993941774;
        Thu, 02 Jul 2026 05:05:41 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:05:41 -0700 (PDT)
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
Subject: [PATCH v2 1/5] drm/nova: use `zerocopy` in firmware.rs
Date: Thu,  2 Jul 2026 09:03:20 -0300
Message-Id: <20260702120324.40388-2-niyudi.honda@gmail.com>
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

In firmware.rs, replace the following `transmute` traits with their
`zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Note that the module `elf` is untouched, as the bindings generated by
bindgen do not implement `FromBytes` for the structs.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware.rs                  | 10 +++-------
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  4 +++-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a94820a3b335..80ce0df244a8 100644
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
@@ -347,7 +346,7 @@ fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
 
 /// Header common to most firmware files.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BinHdr {
     /// Magic number, must be `0x10de`.
     bin_magic: u32,
@@ -363,9 +362,6 @@ struct BinHdr {
     data_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for BinHdr {}
-
 // A firmware blob starting with a `BinHdr`.
 struct BinFirmware<'a> {
     hdr: BinHdr,
@@ -381,7 +377,7 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
 
         fw.get(0..size_of::<BinHdr>())
             // Extract header.
-            .and_then(BinHdr::from_bytes_copy)
+            .and_then(|b| BinHdr::read_from_bytes(b).ok())
             // Validate header.
             .filter(|hdr| hdr.bin_magic == BIN_MAGIC)
             .map(|hdr| Self { hdr, fw })
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index d9fafd2eea5b..66b9f4d1b41c 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -25,6 +25,8 @@
     },
 };
 
+use zerocopy::FromBytes as _;
+
 use crate::{
     driver::Bar0,
     falcon::{
@@ -150,7 +152,7 @@ pub(crate) fn new(
         let hdr = fw
             .data()
             .get(0..size_of::<BinHdr>())
-            .and_then(BinHdr::from_bytes_copy)
+            .and_then(|b| BinHdr::read_from_bytes(b).ok())
             .ok_or(EINVAL)?;
 
         let desc = {
-- 
2.34.1

