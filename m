Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631397;
	b=1c59RyIucY1DfZGIezKfloDMRsoFy4aAnZaYDovv4a7ERotsi6B7YJGiRBE5vhXYZIkp
	 QNbobUjtrV+sfOqGQqBerC22w6wgE2vveVBZxn6LMiba1pSkp8GILNoo2LvxCspHJOvID
	 djbwMkKG98g22ENAjXaJAgT+OJtdyRc+qu2OE+M0GdXFgkSLJl5n4DerIfjGM0N/TFTAi
	 FuV4qw+F55Dk2JydNDWNNwfUZKb85JR5Om/xDN3iuTOjiifGjmxQVNQrEjqMQBBsamCqr
	 2sC32YnQUijmAj45bg5y4of3GJ3RMkchIYpXVN8TErIeL+rFOBqbCcNPKdY7C2h/xsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
	b=Bs2jfx3jJv6I2waai+cEYHKXnnqvO1xRR/gDG88el2ktghwdyCLR7JFq4VbMhvyYP/Ew
	 yJB/YB/Fm1VNzhhVRsdomxqtix2k8j97MPAyHl9GcGY9kg1VQLuKZffeyqsDGHAGkrZB8
	 70Sv8zmDRcJOXvoGFF2RjF8eVcz946LicP7WkD/8v0lx4MS88eBHFrGhAcg+fYUYydvG+
	 yqwSIwLxjDCcVnMzhoM+UyZUjih8wAaXs4cRB22A2a8ipPT5W/mmoVmMXYpQWqdab6j9Y
	 CVxOm7Ltla377/a7v4tS2YyPRnO2T12J7PDEkXm9EM5wNn8R68gOfl3rkqF0mhEoOoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmV2cfVD;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885C606A32E
	for <nova-gpu@lists.linux.dev>; Sat, 14 Nov 2026 04:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A885C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmV2cfVD
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso662101a12.3
        for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 20:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631396; x=1795236196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
        b=mmV2cfVDY4jdXi+rEsH3vMZVGdMTjU8IyIxuxVKw57Oi9khFfw4Te19JgUsjolnZte
         gvnuxaqQdNU0fsezDhF4cb1GljjybLyEAqwbtlJxbPaT0NAHwVFZSs0ip5hAI427yTVZ
         rCk7SIsGxOC/FbKYGC//1S2j04yPSLCM6lxJc/mIqskuemEG7J6KfpyvvoCeiym5ZEti
         FciHIPP9QdcLHwjJaeSjC2+K3hxpMeYvLGPA3IZih4FgyCHtfifpePTXFT7kWiDQIuQv
         mDcTsnChkSg/5+vIxRLKmLpE1kYXcdHdizJTuypRYkdvwYXAOJtIP1C/52HTuC9IMnT7
         5O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631396; x=1795236196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
        b=tx9FD7fxlwgQcvcgWaItbP5uMsJF5v0Ljs3ldYUd4RiuRjedjsf8OuKEzm4jht+WQx
         7Vzm66g+qDxzpLc310oeXmPzI62UXSKlZEqeAeUZMuBvpgYVlxMSmO2s9Is4LMvqTdwz
         iYlirp/Rs6aNzvsoka3YxDAT55cvKVGzfv4ErY9/kb2/Z006wt205iGtzeUiok/y8zWZ
         R5JVzevZ5XVJKURu6Tfi7P3mrop6NshNs+L2ZerOM3ClksHI8sHlW9k6c8UMDBUXFf3H
         mVyP7gEo5FHm9IYRwzJiS6jc7Nua7lx3gC51USEWq0Lzy1yD5K+gxh2MVLwixU9uXs4M
         PPcA==
X-Forwarded-Encrypted: i=1; AL+hErF6+JyorV8GrOYZH3cb22dVEeNZtkFwLPESeaHZrU7lyuKYxYcKI7ZOozE8JpUN2rOEDz7LOusBsQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+kX7eD3kF0dJLSiJe0bBLfNou0tLSu//yNAvq48Chbnd+q+V35
	C+jUBpKgIPLmM+mdEU2ps4cOXwE//WCbHE36WXDmCbqdNHy0P0kELCzM
X-Gm-Gg: AYBFou15OaSRPD51/TVoG9+YcN6V2O7Aw+2yddTn7jLWQhl9OJXqXE0S/BSqkQthBeh
	vBVezYByineB61Nk/nEpAvEx/+Iqi+LK2DPEBBVrSBiYFSPCSFZr4+SVyGr81aGRtE6Vfoq6EPD
	Enzx2ev/VqF5MlYsjYncoYdnXHwHlyDM9+vNQ7HL+W1XQg5nME0ETMPaOOzc9ilsXek5stOjI3J
	Wad2XxWz4luKwRyRndWa/SDSJv2RkqFCPhdFzp2Nm2f4jg6LSHKvDw04TSuvv1EF8BxJdfykhc1
	+5Rrrvi3RcgHdYnp7/u3D7ULWcCRSvlWs9eVHTvKVXHvEI2LLw0EnAE+uTkTSZxojBCqHTrYVq6
	KL0GEEO2RGPdw86toN2RzeVPc0xGNGSu0DNnt3B18aYI6xyW7ySPuxBhH4LhvGHGdCUl3virILV
	DRvVtNCezIz2CYsFPy0dGnvOJysPQnaKovqzcZPGG7ISqGi6Lx/flJxKdB27r6D0Ux2W1WnhWgN
	L05JoENSNOkvKamP6KqsedPwsFSuP4grCt277YkuOvaPDzF1DzNcuZlbosYl3xAnS+ocScNAx6E
	diCvktuqFmyaA/Z8CxaWB96E+R5zDXkXzts=
X-Received: by 2002:a17:90b:528c:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b1b0a4e3bbmr4061630a91.40.1794631395879;
        Fri, 13 Nov 2026 20:43:15 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:15 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v8 0/4] gpu: nova-core: retain the GSP-RM log buffers
Date: Sat, 14 Nov 2026 11:43:00 +0700
Message-ID: <20261114044304.245684-1-vladazaharova2018@gmail.com>
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

The GSP-RM log buffers are exposed through debugfs, but they go away
when the GPU is unbound, including when probe() fails, which is when
they are most useful.

Patch 1 moves the debugfs root into the module data, which also fixes
the root being leaked when the driver registration fails. Patch 2 moves
the log buffer code into its own file. Patch 3 adds a gsp_keep_logs
module parameter that keeps a copy of the buffers after unbind. Patch 4
drops the completed item from todo.rst.

Changes since v7:
 - patch 3: check only gsp_keep_logs, not CONFIG_DEBUG_FS, drop the
   reserve() before replacing the copies, add RetainedLogs::push() and
   mark retained_logs() #[inline] (Danilo)
 - collect Alexandre's Reviewed-by for patches 1 and 2

The code and the commit messages were drafted with an LLM coding
assistant and reviewed by me. Each patch builds on its own, and the
series was tested again on a GB203: the copies are kept after unbind
and after a failed probe, replaced by the live buffers on the next
bind, and nothing is kept without gsp_keep_logs.

v7: https://lore.kernel.org/nova-gpu/20261113075317.934264-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (4):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: move the log buffers into their own file
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/debugfs.rs       |  45 ++++++
 drivers/gpu/nova-core/gsp.rs           | 100 +++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 205 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  68 +++++---
 5 files changed, 313 insertions(+), 117 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

