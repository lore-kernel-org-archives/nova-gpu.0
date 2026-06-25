Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038CC23E325
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414384; cv=none; b=thTYvmEf/QzN99KfcYZSdgZ9WsEqiosV88Mr1/quFfUZqfio9ZdK88Pc7fal/YEWsEijlhP3nuuZUyKlFGdTfvpzozOkpoPrdSVP58qxh0kZOFwS1G9zGFj5d5kYcNgPmq1THrrFBNgI1XLZsOc9QuxFN5Doh5Mne0+r0LY84jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414384; c=relaxed/simple;
	bh=NyodPeAoXJkshO63ZieYwDDpKeKcY/c8I+oDV4TLxr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IHcn/hxAfkhU8krzSs8nu/MMXVu8lAVi41vSYztHxHRZzUDZW7H713GBvjsH7Ix2t0qyzvmuYy9qanR09vcxvqa4cwGK60C121PQQd2vk0nv3cftbEKbeuyMtdVps/LuvoRLDQbIuJ3OyUL0Vj+zgQuR/nE4zXBO2H25ksxFrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=yDCeLSTR; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="yDCeLSTR"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-139a71baa35so658354c88.0
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 12:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782414382; x=1783019182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzC7fmG1jZ13lVBNr652TT3bsOKLyvGJ+KuwuiC1EcU=;
        b=yDCeLSTRzYRWWJgsKPjMfmZtwpi90wCrsCVd+FX/6kBwIaZQoyx6S3JOL8BaMyMzMh
         SpsFBMx9FUPsxcyk68cqsaSlLKZ4+GjEJHlp4C8aEbybxkXyUtwQNUVp/PGj9wtyNeei
         kiNjpIgO6FqEH6dEskXgjxuEmQFgc/He06FHnCUYCFEy6KgCPabG9sBdIwTlTW+iA1Zp
         p776TnUAC9JVLsbFddjbBl8GLSdtDgjZuZ6otvd90zljWBChSVUjDxgq9i5M4w12cr/y
         zzn9sC3Ey3+NRHuxSP8o3qud6ys0NzXrk6lyWoGhOUckXmUZH880RvVgZkvo4pqWHAo9
         T2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414382; x=1783019182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzC7fmG1jZ13lVBNr652TT3bsOKLyvGJ+KuwuiC1EcU=;
        b=YrdGlp0cONtJznlwvDcGvoZUqN6hkd5E6fujA56026GtNK4L1gFOv41rjq13TxNt7/
         JBqho/CquRSPUZmiqdaXH1jKDkE9qDVgBvAaVMX792SQKWjTEqt927mBnuttCr4vtQiz
         EoNHbpXGXKuGib52zhElAOS+Rfd0Wad6qu7kMNJnvBnvqw6+RoxrfC/zyeyv9FNy06PD
         ECRcqO30zcx5D3uw9j/HtE4ldGdVfNFSAFiZwIav4MRtoM8hd6tANStcJStCy2/M8OMh
         dIEQnc53cqIhY3hmxH270YzpZG5tHeMPA+cmxfqAkbhuc3yVznzX5GoQ34yzVBlxk0pU
         YxRw==
X-Forwarded-Encrypted: i=1; AFNElJ/wbB5Eu0FE5Smuaxyh+NfQHppOgxl3ovAT8gFPlLc2ij5Y2Dq/+Lzic+XKlD/vTIgKyWw5i5k10g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh661YmUkaKu4fOeoQNxewQorqwecuDgUjikggUpUyLhoZf7he
	0U3ea2AfzycRC3GXkmpmVYeTZsw0xR95jmVbBOqjkVUB1tuQHEMjHYzIWMONmrvMX38=
X-Gm-Gg: AfdE7ckXaMfpv/pHAmXyUeLgdBJSFKVMRex2z+YAc6pShkaOKmvrN6Zq2/05nKEZALi
	3ZyXTOvG8TtXYZJS/NvwQ5I/Wt+JE97RtjwTWrNxAllPI/WBqGBEkaX9ENrveh5rBpvSfH/ozoB
	qcwQ1RJbVP5/v/qD99MfSeYGZxThXIUI6J/JxByqXSNHER4weA1TzwpeQgN30pzwmaBwLOFhf13
	x/gMOuw1+0sY5BFCFuK8lJkovuIDw+Rt6AfCcbbY7FHvzIz3a8w/sS1iyYdMGMVjTg05Wn3Qqfn
	O8UVdyC9k/tIxCgNjI+q77pSB72vHOW44VTL9OMEYlpEM55qQ2rilj5MT+JIdtIMzSyW5ik0+Nu
	VjAy/+V9+iYo2uqvIWnOKC597ScIeJGUuacIGCDpIMO+auriqzvlbpaCPYuKMrnxTHjS6LDY2g/
	0VHIgWB2NoilIUYKY=
X-Received: by 2002:a05:7022:2226:b0:139:90ab:36bc with SMTP id a92af1059eb24-139dbb05d2cmr3690379c88.38.1782414382014;
        Thu, 25 Jun 2026 12:06:22 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm10742999c88.6.2026.06.25.12.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:06:21 -0700 (PDT)
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
Subject: [PATCH 5/7] drm/nova: use `zerocopy` in bootloader.rs
Date: Thu, 25 Jun 2026 16:05:51 -0300
Message-Id: <20260625190553.7245-6-niyudi.honda@usp.br>
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

In firmware/fwsec/bootloader.rs, replace the following `transmute`
traits with their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`
- `transmute::AsBytes` -> `zerocopy::IntoBytes`
- add `zerocopy::Immutable` where necessary

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 .../gpu/nova-core/firmware/fwsec/bootloader.rs   | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 13af1c381df1..6f1c8daad7d3 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -23,14 +23,8 @@
         Alignment, //
     },
     sizes,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
 };
 
-use zerocopy::FromBytes as _;
-
 use crate::{
     driver::Bar0,
     falcon::{
@@ -61,7 +55,7 @@
 ///
 /// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BootloaderDesc {
     /// Starting tag of bootloader.
     start_tag: u32,
@@ -77,15 +71,13 @@ struct BootloaderDesc {
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
@@ -124,8 +116,6 @@ struct BootloaderDmemDescV2 {
     /// Arguments to be passed to the target firmware being loaded.
     argv: u32,
 }
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
 
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
@@ -164,7 +154,7 @@ pub(crate) fn new(
 
             fw.data()
                 .get(desc_offset..)
-                .and_then(BootloaderDesc::from_bytes_copy_prefix)
+                .and_then(|b| BootloaderDesc::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0
         };
-- 
2.34.1

