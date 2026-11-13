Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556475;
	b=MmOGsvCB9V8OoK/WzGnBHQ91BjspRi33BNCGU7n4OASK9jUFptBLbZz23l3ac9yWrL9E
	 cP4kd3fsXESDo+98MNvkn7Kl42MEWD2+g3wEEYVOECE98509W5TNEtVVKK5DE41IjxrpQ
	 OTlBIFzUvx3pkD5haZQgTvXsfLq9uFoO03sSBLey15BS9sgsL2muzZsvSF8E9VZwyoygL
	 iVgIn5Q2e0W1R72ukkJ0jfFxG0AY/EJ1maOVwgRD2Nx03+eMrUfSXm7K2FWBDK9G6WClU
	 jJ+gwc0jYoTiPvVsFamaZBFArnQO3i3HonbOf72FG1t0rh1NHE8z0R5i8cNBbPfo8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/oSrBPXKrNYnAzFH4eNjIUEYe3r0QmvR+RTmTsBOz3A=;
	b=gOmTjF1Zo1DKrTZGGPkRDzmbJ/0qGlxyVOICLWqWxOPywNWIkWhka+rZMGooXj++wleg
	 bUN1xZnnzS6AgbFqu5VZ+eBccgT0IN3FSQqrG0pbtcMm3ldv9kpotEuEmfstl9B50gIIb
	 Z+XJcPKp01OAAPazDeKj6/gErU+CRqKL3FzYXldRIerKyMm8Ta5AvfGxBdjlBqPtEqfF2
	 oCqLEtK2McLsJh9L8aScn0+Lvy79pllM4glffLo/DH7cHGxxhb2JI2ekSlbx7uco0G+Z9
	 HaAB6tC2dU79MjMWLKnX26vpoNfhsJ5wYzrHzVmCHpnmJZ8WG/wv6uyG9LPRMm9odjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuXewDpA;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B0C606A323
	for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 07:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B0C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuXewDpA
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso995138a91.2
        for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 23:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556474; x=1795161274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/oSrBPXKrNYnAzFH4eNjIUEYe3r0QmvR+RTmTsBOz3A=;
        b=FuXewDpAcYOJjPqTTjvgV0/FmTfYF+VsrbwyJWKRoDUU0KmqA2B8PYBjSekPKMheJQ
         bzv2pMhnlmcDXQFDKUzkmrskRYQfD+hUzOA+5annMgPrpQpzbKtC93CvpN7rwMSAS3OB
         4Rh0M6nkENsjvUAa1YcvBiW6tz80+J3XzsU2jgjmQEK6ANUu9D7EuBooC+rnz2OJcfO8
         ltDtFV2NdtCOEccel0IEQhuIBVt3pMg9nmMjadc1rPAtkKrffg9lWZFc7/ySo6IB/cJ7
         Eld0G+Qi+Bv8K8ifim2VdF2yaTSLWfQb0CPODLgk5TIFpypkEEes7c8RVkAr7+jz0kXN
         RSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556474; x=1795161274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oSrBPXKrNYnAzFH4eNjIUEYe3r0QmvR+RTmTsBOz3A=;
        b=BJURP3wr0wzMZkFV5u1R9fLQoXilzTYpqD/xIjzrBbF5dMcZKpdmqF0/zYng5wnZ+d
         tm5zHOuC/pM6Icw/cImjwPeE9kFSLPuVEYQ1UoadH69rkZDKNjy3CsdEWywfvn6dZ0Av
         Bvx2DZd2iDOpydBhruIIHtBc8fAWZOr+kw/YhSKPhvPQw+LUj8nKrEGZh/mTyuNIWilG
         mwrbq6qBmDI+tzbjLgNGPs6c+Yx8JkG+Xu6csB6p//zjYN0yS8ulf42zqL5Yu/bMh5oe
         QZ3APBiaa+yz/4GDTpuEg02nWXXOmgQSNem4nPKjAaBugkdkr2nKLdXReBJtj2DumTEZ
         XeMQ==
X-Forwarded-Encrypted: i=1; AL+hErGEiEzWlOutMSW6Mu7B5L7bTj6RHuoiswsTefG7n22FEmVQwPxHU07ZL3XveJxX47Xpi5YixCacXA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Wb0iiFDeVqONQYEnYyKH3L96XJ57BuBH2TsjBkrUNnIlxcVLJ
	Thpwp9avZb3sgfz/p2Mu+1CDtTkAvNHnPxzKFOsaK0izLMSobRoxPNZo39YkU54QImJDzZsz
X-Gm-Gg: AYBFou1KlRUvZcs82g4RB8aLbcMQoaVXtb5pu8VNqjhJyEWpW+skzu++nIes0WwM+9L
	wQP1m6bS5xHCJMXZCs2a8DDU0KUvJE1UE1Qj2qvqgbfubkKr7kDdXy43kDA/S94bSYb77qUWDLK
	dhhDDoU8NgJwG21a/uMjpePniCwrPA5pTSGmFhzFLCS544vEe39sb2kpZClt26eVvtVldmNKMOG
	LBghRHF1Wjan8wTrTfbnG5Y83yci//8wM3F8mottHjTS083OGh2cQbXIv+Ao59KBsVui2/cRBj8
	IWm5Ae3G3GOMV+uxUqXgbxwzI/6u0N4/L9sx6T9SKTVXazqqGJxS17zATYOXUiw8wuGqQFOtJse
	09+Fn7xje0O0ODjSTBuniSqZXzNhzI3NNT6/TmLZNa/3iHaOkfOpeGg7YuulBOub4BD0DT/plT0
	i74uqnL48evgzG1T8w8idiLjlKuzoNgreOD5CCva/6Zd3RtjljpI+zyDfwhykmha5PFayJXz3wE
	KWJY0Am+6Dwy30R+RCuiv6L8q2G1mXSo2BsizGVOFwLhybDT/7e0wLNuxnaXjaJ+rnYn709tIv3
	ntySJt3ze1pb88o6T8s4t/DwpIV4j80VWnk=
X-Received: by 2002:a17:90b:2247:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3b1b0d4f314mr1396218a91.60.1794556474024;
        Thu, 12 Nov 2026 23:54:34 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm1024539a91.3.2026.11.12.23.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:54:33 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	joelagnelf@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ecourtney@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH] gpu: nova-core: mm: keep a page table page before installing its PDE
Date: Fri, 13 Nov 2026 14:54:22 +0700
Message-ID: <20261113075422.943779-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
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

install_mappings() writes the PDE of a new page table page before moving
the page into page_table_allocs. If push_within_capacity() then fails,
the page is dropped and its VRAM freed while the PDE still points at it.

Move the page into page_table_allocs first, so that a failure leaves no
PDE pointing at freed memory.

The problem was found by an LLM-assisted code review.

Fixes: 4e4182282d4e ("gpu: nova-core: mm: Add multi-page mapping API to VMM")
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
I could not reproduce the failure, as it needs push_within_capacity() to
fail. With the change, the MM self-tests still pass on a GB203.

 drivers/gpu/nova-core/mm/pagetable/map.rs | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/pagetable/map.rs b/drivers/gpu/nova-core/mm/pagetable/map.rs
index f7774b9cc972..e678197ec009 100644
--- a/drivers/gpu/nova-core/mm/pagetable/map.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/map.rs
@@ -209,8 +209,15 @@ pub(super) fn install_mappings(
                 let (install_addr, page) = node.to_key_value();
                 let page_vram =
                     VramAddress::from_raw(page.alloc.iter().next().ok_or(ENOMEM)?.offset());
+                let level = page.level;
 
-                if page.level == M::DUAL_PDE_LEVEL {
+                // Keep the page before pointing a PDE at it, so that a failure here cannot leave a
+                // PDE pointing at freed VRAM.
+                page_table_allocs
+                    .push_within_capacity(page.alloc)
+                    .map_err(|_| ENOMEM)?;
+
+                if level == M::DUAL_PDE_LEVEL {
                     let new_dpde = M::DualPde::new_small(Pfn::from(page_vram));
                     new_dpde.write(pramin, install_addr)?;
                 } else {
@@ -218,10 +225,6 @@ pub(super) fn install_mappings(
                     new_pde.write(pramin, install_addr)?;
                 }
 
-                page_table_allocs
-                    .push_within_capacity(page.alloc)
-                    .map_err(|_| ENOMEM)?;
-
                 cursor = next;
             }
 

base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

