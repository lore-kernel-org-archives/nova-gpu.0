Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999371;
	b=uzohIA4hvY7cfzrPkDoGCLxCiBozhzjFZXhZA40Ll6/mFqPAyfVa0uCtx8QpK5oY+yy+
	 dWJUpfyeMGWazQbvj+O8baUnSL5RxHIR7CFFm8Mm4lPgf+nUlFFq/4mjgH86FLpnlASMO
	 mVZsLFHka/f+n6l4K+3hZicz/0BYbLw9NHdeYYzdPc/LPm8wn2A9hUtxuHdSFXHN8tR09
	 BeymBj0zolNfwppnrKK3al2ps5GeS3eVgxtQa/1E4Za8xtIz1KqPlSq/+yVBsg80WLHh6
	 WF62VLOuXwvVm0I2n3ytdSp/3mFyTbVgM7DTHHSEA9XoeYfA4ztwybwPiXBJS/O1jhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IN879SLlnbKDx+IQRdl4OB8xJqPQf4M3p3iCVyXzytc=;
	b=MWI0cVW1tRF+/z2DGZCS57R2DlikInYybUTqHttWxT6CTvikAiMfKsP2MlsSx3091T31
	 kEKnRKzdRGVcvRObqieWuwQ6IcjYpZR4fbwyImvy+F0/aTsTqGjL3JAIAGD9J9qOyzovh
	 nvQOfEL3pejwEYywCeCBm+a7Lat0lu6cH2TZSJRXMABQrTIBnCq57ahPWiCc/1iB/yInA
	 FL1F8uBsCxCIdEycses8o5CfUPY7DHnkD4eg4auQXKnp6P6XDMLlZfPgJ1Oc1cvBJ5l6p
	 03jynYaX3nrpp7AaxNn5DMuKBXGCN5l7HzGfNyvUMXePNtovmq7HZyw3LptHmugtNtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FnpfbmNR;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC4606A33A
	for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 10:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FC4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FnpfbmNR
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1249537eec.0
        for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 02:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999369; x=1795604169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IN879SLlnbKDx+IQRdl4OB8xJqPQf4M3p3iCVyXzytc=;
        b=FnpfbmNRmZevBqhJWOcJzt6Y4H9TpnvdYhv0wnSlf2tL2bFdbrqW7cSKY01WsBLhY2
         uVaUzh13DuNyHbSr3J3rv6MGdjxNb1SqjCfNH6tGOogD0/Gtv94RyQ1riF8kmq+Jwyag
         afNZ8QPS0/6TDp6MhDAukdmIgTsgwQ8PryXB0MAv2Rsu4dy7omfKv/UahMkbfyH/tp11
         mszhFiAho0O0HQphMTEGM3ZsSpWEa66nLOvZzTlS5Naup3cfsFqE4WBeJt7oNolOsVhC
         xih5JZrVMJwfBeEVLIi40Un6Fm4DyjEypp1VdLKl0Sc8kNBP/KLqV8lu5vpX6zdwUjhZ
         7NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999369; x=1795604169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IN879SLlnbKDx+IQRdl4OB8xJqPQf4M3p3iCVyXzytc=;
        b=yymTils6AguL5K8HBiqS2ZUlTR+FcjiDoDZUEPSCd3mNnmHZNJM+1VQpPEjuWURyYP
         h9HcSBtA4kaUO4cv5+KztsfDO1TZZfkF/17CSEBjZnu3d/fenz1e2Fsfh2W8SJmCZ8vy
         TZK/E9oaAi+NXPLzBvTCQ4RV11CQYx/YWE4F96FB0+hdVZjBYRwU/S+HhJmMDuh6UxW+
         n33Jt6WJAKf4zOJxDkTlnhaZt7CLYhj9NxR9Ibwg1CWxTGuQS2lafqzuj2JlnQOBeMEB
         hFWzpBR7F0wDF5J3a5B650X3pDgogCa71XiJ4oxUigpU6j+L78JHymWMmEivJkrpmXzI
         Xwsw==
X-Gm-Message-State: APuU4Z8iHQdM/LeJqi2gMw7EdeTAlqdOJa/vYv5+OJXqUusdI2s8VOpO
	KmjTBnDh7+y+pn+7dwe/M8WLd3LYcR2S/JpHYL5jXLiPZ1Dt1u2iySi6
X-Gm-Gg: AZFdTZcSiivlzIzrdIAfGRl+/cdlUlHTBYBLpXGpeW5aUFB8CiEVaW6kFp4SAPHCSxd
	QTC7uwRm+h6fwiWvA7da+HUMH1hTykgmbLAkLq5ixnm6JtOWaYPa4vq8AXeqAkwN7iGsrz/BDNE
	Z2sSVzC86hWYjxBCfUAYVUsqct+GqEiSL/8bRgmWM7GVlJJLvU7HGugvRpUDiPfMPRgJEAAdlin
	c3t/5w7SOqJJkCExDDZ+pVcZ5MfHxa3rT9+l0RTlSWQSO2/FkAGvj2X0a/mRmiurQzg5hsCKVO5
	y/CleKZT2kbOfFpVKcTQeY9J+KlQbswFlprMpctxCisW36mCtKStx3u4ObMrizPbjFhscBDPY/V
	pZFzCcWBorktcQErg68uKCg4AAqViOAstTKQsOXmzz/HJYfRMMQVk+w08PSjLDN1aiD3G7nE+1h
	03pFhGHh2yFNcEXAQi7o8YoAe00xOyy4jYXnTKtA0TrLvFKuQkanDkzw5Iw4VlcR5ECchGtX8xh
	CdYZMANIGRixmgQX8vLkoq2FpLX0Mx332pRwbZV0pY5Ugdl7lzGmLehJT6XiQtHkDAAPm5Sf+nE
	6Mf4tC5E5vA12UPPcskkPKV1JFehdy28lNHWrhYtgYUdFsYpVyF+znRWUYzr6Jw=
X-Received: by 2002:a05:7300:ff43:b0:369:5583:bf4c with SMTP id 5a478bee46e88-382820de610mr1965626eec.28.1794999368563;
        Wed, 18 Nov 2026 02:56:08 -0800 (PST)
Received: from deepak-80tv ([2405:201:a40c:e0d8:ae82:1cfd:7bfd:2676])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6def9e2sm7186657eec.13.2026.11.18.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:56:08 -0800 (PST)
From: Deepak Pandey <deepak.os.system@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	Deepak Pandey <deepak.os.system@gmail.com>
Subject: [PATCH] gpu: nova-core: falcon: make pfalcon field private
Date: Wed, 18 Nov 2026 16:25:57 +0530
Message-ID: <20261118105557.140069-1-deepak.os.system@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, `Falcon::pfalcon` is marked as `pub(crate)` with a `TODO: make
private` comment. The only use of `pfalcon` outside of the `falcon`
module hierarchy is in `fwsec::bootloader`, which updates the FBIF
transaction configuration register (`NV_PFALCON_FBIF_TRANSCFG`) during
firmware DMA setup.

Introduce a dedicated helper method `Falcon::set_fbif_transcfg()` to
encapsulate configuring FBIF transaction parameters for a DMA context,
use it in `Falcon::dma_load()` and `fwsec::bootloader`, and make `pfalcon`
private. In addition, clean up unused register and I/O imports in
`bootloader.rs`.

Signed-off-by: Deepak Pandey <deepak.os.system@gmail.com>
---
 drivers/gpu/nova-core/falcon.rs               | 27 ++++++++++++++-----
 .../nova-core/firmware/fwsec/bootloader.rs    | 18 ++++---------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 9015de965a53..507f638e8936 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -364,8 +364,7 @@ pub(crate) struct Falcon<'a, E: FalconEngine> {
     hal: KBox<dyn FalconHal<E>>,
     dev: &'a device::Device<device::Bound>,
     bar: Bar0<'a>,
-    // TODO: make private
-    pub(crate) pfalcon: Mmio<'a, PFalconRegisters>,
+    pfalcon: Mmio<'a, PFalconRegisters>,
     pfalcon2: Mmio<'a, PFalcon2Registers>,
 }
 
@@ -395,6 +394,24 @@ pub(crate) fn dma_reset(&self) {
             .write_reg(regs::NV_PFALCON_FALCON_DMACTL::zeroed());
     }
 
+    /// Configures FBIF transaction parameters for a DMA context.
+    pub(crate) fn set_fbif_transcfg(
+        &self,
+        ctx_dma: usize,
+        target: FalconFbifTarget,
+        mem_type: FalconFbifMemType,
+    ) -> Result {
+        self.pfalcon.update(
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(ctx_dma).ok_or(EINVAL)?,
+            |v| {
+                v.with_target(target)
+                    .with_mem_type(mem_type)
+            },
+        );
+
+        Ok(())
+    }
+
     /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
     pub(crate) fn reset(&self) -> Result {
         self.hal.reset_eng(self)?;
@@ -614,11 +631,7 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
         };
 
         self.dma_reset();
-        self.pfalcon
-            .update(regs::NV_PFALCON_FBIF_TRANSCFG::at(0), |v| {
-                v.with_target(FalconFbifTarget::CoherentSysmem)
-                    .with_mem_type(FalconFbifMemType::Physical)
-            });
+        self.set_fbif_transcfg(0, FalconFbifTarget::CoherentSysmem, FalconFbifMemType::Physical)?;
 
         self.dma_wr(&dma_obj, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
         self.dma_wr(&dma_obj, FalconMem::Dmem, fw.dmem_load_params())?;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index a87878fe2aec..db1cb4498acd 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -12,10 +12,6 @@
         Device, //
     },
     dma::Coherent,
-    io::{
-        register::Array,
-        Io, //
-    },
     prelude::*,
     ptr::{
         Alignable,
@@ -48,7 +44,6 @@
     },
     gpu::Chipset,
     num::FromSafeCast, //
-    regs,
 };
 
 /// Structure used by the boot-loader to load the rest of the code.
@@ -247,14 +242,11 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
 
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
-        falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma))
-                .ok_or(EINVAL)?,
-            |v| {
-                v.with_target(FalconFbifTarget::CoherentSysmem)
-                    .with_mem_type(FalconFbifMemType::Physical)
-            },
-        );
+        falcon.set_fbif_transcfg(
+            usize::from_safe_cast(self.dmem_desc.ctx_dma),
+            FalconFbifTarget::CoherentSysmem,
+            FalconFbifMemType::Physical,
+        )?;
 
         let (mbox0, _) = falcon
             .boot(Some(0), None)
-- 
2.56.1

