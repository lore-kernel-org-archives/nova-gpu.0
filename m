Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774CB413230;
	Wed,  7 Oct 2026 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360452; cv=none; b=ImEhYGlfkAtbJpseSA7S6pvqx/5PNX/2PO8Cgk46bLMB60Wth7jh26AD/nfzRN/L80/tIGQBIfEwcX7NOC9sFRhnKHVmc3TQrzawbpzoeiSRNTuYmmWx+MsSEl9oYQQ62k3l2SlGBgbA/tZ4OqAuWyg3T+n17FUykiTF2PcgJVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360452; c=relaxed/simple;
	bh=Bemw368FDGIdywFg9idqBuBIQkyeP2E/D2Q1PzjEZSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBf6MFgJRZuY3R5Ca/knbnxJFOEQt6171hb7aXrwgoity7CvmjHZotzNYpHzgO57HkFJV0odLtBDlkyEhqlTtLq253Ep6dUkaEogk2VduwTHT7uu9H9fc3TcuRruLOJ9fltPobnKtm5cPF+0XFJG1WZmj1d04ShV50ZlCXm26iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHrB9CWb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHrB9CWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08C21F0089B;
	Wed,  7 Oct 2026 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791360448;
	bh=v/y3T7/e/MaOX8mZoAbby3DasOlpB0U8DdGRdhK4/GE=;
	h=From:To:Cc:Subject:Date;
	b=GHrB9CWb16Dac9KvY773Ok9m4S+vLWRkzORIt4qPGzTq7SKknnk6VsOrvmQcg85xk
	 GcjPZUzkYxT4mFHXqFp8QWNzjGn2bgFVSjvBzzPNUEKhbEgmwuZH/uZq5YNvdmpgw+
	 ZJ9ackZO28kDQZIM2qEFOuYF+nOxUfQOrukq0xyHOw+psKf0ZEpGOynFF3vqNJj1tj
	 vjOvZzXQJKGb1c9a2Jky2JE2EbmS9SdfDOq8h/0rnqI3PXe6B+3rnLMaM0eFN5s9go
	 qOupokHriqzeJYOzdcCOJ7k8h86PMqGMB/CtM5zqtmaH0CKrbwa8Z/V+fEQZM9qI2P
	 K2LGP8vt2hBUQ==
From: Thorsten Blum <blum@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	Timur Tabi <ttabi@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Tim Kovalenko <tim.kovalenko@proton.me>
Cc: Thorsten Blum <blum@kernel.org>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpu: nova-core: firmware: fwsec: use zeroed() to zero-pad buffers
Date: Wed,  7 Oct 2026 10:07:00 +0200
Message-ID: <20261007080708.124563-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; i=blum@kernel.org; h=from:subject; bh=Bemw368FDGIdywFg9idqBuBIQkyeP2E/D2Q1PzjEZSw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlH/65pONd2yGXhyyNln05e9zQ4UMKQIVT/esalHU/ip kn7c1drd5SyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEyrIZGVb37mPacoV3IU+k HOeq/TlL8zgaGpq3fK0NClQ7MO3r5F5Ghp3hryZpKZ/dxfoo6Parr0llCX8nrA07LbQs82L3p5p 2bk4A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use KVec::zeroed() to allocate the zero-padded microcode buffer and copy
the bootloader code into it. Also use KVVec::zeroed() to initialize the
firmware object's leading zero padding.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Add a // PANIC comment to copy_from_slice() (Danilo)
- v1: https://lore.kernel.org/r/20261006100442.80432-3-blum@kernel.org/
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index ec4d92317a93..1aa08ae8de78 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -137,10 +137,9 @@ pub(crate) fn new(
                 .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT }>())
                 .ok_or(EINVAL)?;
 
-            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
-            ucode.extend_from_slice(code, GFP_KERNEL)?;
-            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
-
+            let mut ucode = KVec::zeroed(aligned_code_size, GFP_KERNEL)?;
+            // PANIC: ucode is sliced to code.len(); code.len() <= aligned_code_size.
+            ucode[..code.len()].copy_from_slice(code);
             ucode
         };
 
@@ -162,8 +161,7 @@ pub(crate) fn new(
                     .ok_or(EOVERFLOW)?
             };
 
-            let mut firmware_obj = KVVec::new();
-            firmware_obj.extend_with(align_padding, 0u8, GFP_KERNEL)?;
+            let mut firmware_obj = KVVec::zeroed(align_padding, GFP_KERNEL)?;
             firmware_obj.extend_from_slice(firmware.ucode.0.as_slice(), GFP_KERNEL)?;
 
             (
