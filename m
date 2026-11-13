Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556412;
	b=Lga5Xjk7Td/Rt97+Myaafzqu/1a3r1CvpLnvvcMLd7F7GC2tfbA40pIg657/hvMrxwrg
	 A02E3Bp1vJj6jLSSoGtNnuphBbwClZ+r/01Ifk8FpXK8FlHmZmND+kedpDOJegbJKSR4L
	 eezFLGMFgwWqfcqgBgXPygJdLlryh36k3GjNm4T3BmgvNdKh72i/e9z8kkr11bHrfQHGx
	 PWTTv5YJS3XDHKGv5Ox0n3FI2skodHPth69lBvypLwKpUcA/B5LG+tZza+p/FVMlWYsrD
	 qc9E3haO8v3XxG1rC6kretRyvgqUjE87S3z2Nnfq2CKB41LP4o5sGdljyEL5ugssUMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
	b=1CaFnw7DR2RPuHmsQZD+MyMTpk7CGNiJveGd/65Y6/IinJ2GNHi2uzpFFr+8lREnB+7K
	 wPPExzoPn3uPlpkpBU1E8guHS7KKduutAOkWyVajRJWjKGj3+9zy237XbsgctGG8O2edD
	 +s0CPJ0OjBDstnhtP09XecKBboclVHyVO07RDb93zzVEbCC2G0TPJ4CiGtW6FQjVXu5eK
	 6P3IYqxGbqGu7fVx+ntRG/IIpgg2KOgrGRSKRHcr6AcbZPJtk1y3isFTW8MF+A0KdLwur
	 qWWB8GS20ntGNhk03J77hQOA7AK11Rl6nZDV1QauG808k6OILMobKzRPq5a6Ln0Pscg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhMyIzh2;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D6606A327
	for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA2D6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhMyIzh2
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso279645a91.1
        for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556410; x=1795161210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
        b=JhMyIzh2euIK+wcoz5QOYyy+aRfcoRxD8TLvMWOzHrFQnDIJZzD4I8vRcuytQA1sQi
         m/OBSxq+ozN7+qVWqUlxTdo4DT/0aoG++KUvZKxXFYxxH1e9VsjAendhA0xDHr1q0mcg
         mElpgVoJdHWJIUAwh917sVObhbM2d2XMXgdAaMonF+1kK94vbsH5iSHbWcGuIe7qx4GT
         b4lm63XG1DI0dZ87hItTj1y5XlbsuA1KGv+FsvKUTE5C9ZWoFKB5yVAc8rVxFrOpLXbd
         AZjnKwvHg2ZPmp00CU4OKdM4Ftn0Cn2HBXkdLJCd334x88ctb9FA4OIfptMbVDcB73pB
         HqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556410; x=1795161210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
        b=r3K7XUQhbNycN3F+vtBwl9YJufsnnfZZ4gWFOE490QS/yBgm4Q8nkf/NaHzepLhCrb
         K5YiYGNomh+gvOV+2N01G8IuQBaDb0cMZ1gWXOI7DlCQEx/uvIFLw+6ESb+ohJ/iqJEL
         8J6ZwT8+Afsmb4fYAHdjt0TLsHdO+w01GfrqAsv3KKIktC1Ug869/RqwT7F1daXQyTeF
         frpthS7rDzKNTAJMO1XshCH25el+QWieI5/Q2e+qoVDGJpWIQfYPvGeEK1pMCvm6tSba
         ShE7CKWsoZuaMtwAXrkTmikoeJGuZ4GFBmAXUpmu8HJ20NqjV+nW82a5LzE3cAZlFPZa
         eb6w==
X-Forwarded-Encrypted: i=1; AL+hErFeKIxi8mYyaHUDv8VHYZ51en1te8XYSU/EjSz6OUyLRu71TtcdoCBsrYaM8ZcH8Oapuk5Z3ia4AA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/BE1zvaTfUD9UAv43ZyHzl5oB+6xFOkSKkTd8oW0CZyLFSSav6
	R3aaV2HEJ9fv/uuh+a6vTNnUH4Hrajn6tNW8pTNAEGIYNyCW+AKSpfxx
X-Gm-Gg: AYBFou39VOusMxg6I00DuwXqgUX+wKNjyMZlzuQRfZqkKpkj4CjzJqOqMmeK+oPOMGZ
	gVt+SLrjsvA0UtQxFknuOCnRjXe9lb609GaZkNOGwjamzpR9c5l7yz3JlXWNn4qmbvzDyy25V1e
	c3t+pd3CWtND+UNDwK2ap1rq5Uk8eoCvA1osjNy7VHBN9buPGRa5VQDRj6DBU1s7/72rrJu8Ev5
	ez4mIbiHAhAv9p3sCjRUo/l8uFNckXanlVwBZ+2W2uMd1Ym+lmK9Un8kByp6fypn88BCm7acL2e
	Q+SXk7nW+eP7L64CFMfMaRcVAzqqWEAHlIVvPFJD/cEudAmPS7q+I27yfH4YI/qkpJpRyKgiNr9
	fkUuHuMP3hTxvWzMbnlE9P9keUUPeP6AgG0QiF+lkzj00yxmorRjji+tocYAczzdoSqunIdECGn
	qGdv9dUVFpb4NMTUgQ1HcTR7JneBEHkZz4vr6k77B+cykqDQIq4yydW23hcOcy2cpuSD9eWDTFT
	/kIaiEapRPrZSa9AwH9r0tuh3HVzTM47GwHovx41QO8sg5B+gSK7V55rdYuFQF4U0+P3TNLFMU7
	yuZ0f0TJ7lSpyRoNF4wkLXkXVF/z9mFfotU=
X-Received: by 2002:a17:90b:2e83:b0:3b0:a4d1:6d7a with SMTP id 98e67ed59e1d1-3b1b0a1f08cmr1423738a91.31.1794556410033;
        Thu, 12 Nov 2026 23:53:30 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:29 -0800 (PST)
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
Subject: [PATCH v7 0/4] gpu: nova-core: retain the GSP-RM log buffers
Date: Fri, 13 Nov 2026 14:53:13 +0700
Message-ID: <20261113075317.934264-1-vladazaharova2018@gmail.com>
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

Changes since v6:
 - drop the "retained/" directory: the copies are exposed in the same
   files as the live buffers, and are dropped when the GPU is bound
   again (Danilo, John)
 - split the code move out of the retain patch (Alexandre)
 - move DebugfsData into debugfs.rs, make the accessor
   NovaCoreModule::debugfs_data(), reword the comments around
   DEBUGFS_DATA as invariants, add a Fixes: tag (Alexandre, Danilo)
 - shorten the commit messages and comments (Alexandre)
 - rebase onto current drm-rust-next

The code and the commit messages were drafted with an LLM coding
assistant and reviewed by me. Each patch builds on its own, and the
series was tested on a GB203:

  - without gsp_keep_logs nothing changes;
  - with gsp_keep_logs=1, <BDF>/{loginit,logintr,logrm} keep the full
    64 KiB of each buffer after unbind, show the live buffers again
    after the next bind, and a second unbind replaces the copies;
  - with a failure injected after the GSP has booted, probe() fails
    with -EINVAL and the logs of that attempt are still readable;
  - with a failure injected into the driver registration, the module
    fails to load and leaves no debugfs directory behind;
  - 40 load/bind/unbind/unload cycles use no more memory with
    gsp_keep_logs=1 than without it.

v6: https://lore.kernel.org/nova-gpu/20261014154554.231015-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (4):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: move the log buffers into their own file
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/debugfs.rs       |  44 ++++++
 drivers/gpu/nova-core/gsp.rs           | 100 +++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 204 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  68 ++++++---
 5 files changed, 311 insertions(+), 117 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

