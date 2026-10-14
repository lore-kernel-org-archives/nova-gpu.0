Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970DE55C1D1
	for <nova-gpu@lists.linux.dev>; Wed, 14 Oct 2026 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992771; cv=none; b=nqguREG969eKPpAohWPHaKJ9dKTP9yL6oygA/e1isqYTe7eD38oN27+UMBlp+nWy42pUn6YwAGvJOwvnCdmbjbuKGhYcrmWu+jYVC8Mh0OLR3kceg58ostl+qvRdOYxxF7C2GZokvUnfM3f3jpj9NmeJ07d68fYuTSjUvBM25N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992771; c=relaxed/simple;
	bh=nWe/k9FLePuIunsVevsIKBcKBQYbwAkGez+IHcMgm+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASbzpfGfmj59wr2fuW/P7L8COJc68v6xj4cfxv7qQ9UM4wogJFb9cg73C9KT4dkTR9Jd1tsvN1u0VPjDq362jGq3TjudKaXvy1UaTsX8XOXyC6TaZXLdn8PoiDzBqI3Bct3QNu7svAQx8H0CtYhpHrwB0K5FZCQvfZoyvW9Z6ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gz2Qlm9B; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gz2Qlm9B"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2363184a12.0
        for <nova-gpu@lists.linux.dev>; Wed, 14 Oct 2026 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992767; x=1792597567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guVsG4hFn4zNEbHwQhhELW9kDSSxFBpoASzURJMZkH8=;
        b=Gz2Qlm9BrmqzjgmD4u8edRzUnFHR2ivgv3tTPVP0StU4Hd7BMCOyYxgkCSiLHeqoBj
         6KempcRj51i5EfIeuzTbvOriCBycXcoUg/uXCVuv6y0pXsFFS2VlXR+O7BKovIQ3XtWB
         iQ9k4DcjugHUjqlKP7GfHGKFc4S0c1w1WTRmQ//WyCB10oaGhqR5v0ZPxX7MwahZvi3R
         M1LU46X0dr4qegk1Cj2aHx4a5vgWqH0k6bbLGKafP77+C5/WnXvO/mmsUWWNKRD5ZMWp
         WPO1/G9FKTZCqdI5GezzHziYWcjtGZNXtFSX0/D/QurWZg4fyn0q98maltMQW9dm+Tc+
         ZS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992767; x=1792597567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guVsG4hFn4zNEbHwQhhELW9kDSSxFBpoASzURJMZkH8=;
        b=dVuCToLZf7rYB8bP0kQlKiduXAFwuwcljQMI8oJRGrpr1zepbmbPqk0jhLRCjGwvDE
         tpth/sLGZGLzre6HXtlz7IvZPdZBenmCavgi0TSUBfhjGPAOHPN9aLDWzUdfSwpflYYY
         jkiKqtu8lldC2jaRnk88FC9MrdRHmueKsAreH0Hy7hGB7SF9w0ZRMnkXarLgUZIZr0mc
         H3D51RApleEFA3XKiGnVQ7x2pqmNYJ8mkBX2JcpZnot4Y2eBa/jLYATh50Dj8OhKKmid
         Bpo8o0tPD3UoM28LkWn78+viVxFgT3/GuRgvM44/+hYYU8x2D9QXwzW0Hh7QL2SN8iIf
         rJQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy64Ztzm/B921aylYN1g18akCDjT3Qcw7wiXbvKjWsGGDC1NqkfNnpLbssNn/TXgLkXFbKUrX68ag==@lists.linux.dev
X-Gm-Message-State: AFq9FYL1+XMyOm7tGKq3Xda/qB7MTGvY2E/Df36IOF8EXSqTK3ZGAwlt
	lyeFzeuV1QyF9jIF1hQ4dhhuaxBd2oHTCw2IBmnXY6aJ3wxZ8yAvfJG2
X-Gm-Gg: AYBFou3mq45EPd0mGByToqRV+BqS3F84qEHSOUurKR1Ph5zv1VwbLpzGjx5AaOFYypJ
	UOGdF80LMY/IOvem0Qfddy4Fdb2vg3JM++5/kXnmtNnYguxq60kKhhFM+7pMq94kjdMGUsf5m6r
	aKhOWnvSTtQuX5K3sozl3ugmKXUPw7hBmo9naAkM5KofUn8Ih8DRcSDeEk/xk3eqZyE733GLmxu
	lV85q3NtbXEpuE7TjW07S5Y8SQewXhYPerARZMLpv4cQg1RLrSl6MCikFspQy93puYzg0fd5JGA
	PQm/E1c4OgKrJ3vSBClEIe632YV83+aLfh7sDhAI++u6mwsrZ4T9PKTwRAkfvPKWoo9ThdHVLOC
	n4HuZOE78mxEo0e/kPGR0C/qb6g3193Rvd53eKiUkXew7tq66zVo4i0otlW8P6kYtwknYKQyJ6r
	IbprrZKRB2/6HdhdW40oEzUQ9dVyfXKPb0bejKhgzG1whsFX1mT06Jdq6YUeaDZ5SHJ5nPiWXAw
	8/4
X-Received: by 2002:a05:6a20:a11f:b0:3e1:3734:63e0 with SMTP id adf61e73a8af0-3e16bec52eamr10308336637.41.1791992766832;
        Wed, 14 Oct 2026 08:46:06 -0700 (PDT)
Received: from localhost ([37.22.102.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm1300598b3a.56.2026.10.14.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:46:06 -0700 (PDT)
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
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v6 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Wed, 14 Oct 2026 22:45:51 +0700
Message-ID: <20261014154554.231015-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but they are DMA
allocations of the device, so they go away as soon as the GPU is unbound,
and in particular when probe() fails. That is the case todo.rst asks
about, and the one where a GSP log is most useful.

Patch 1 moves the debugfs root into the module data. Patch 2 adds a
gsp_keep_logs module parameter: when it is set, whatever the GSP wrote
is copied into module memory and kept under a "retained" directory until
the module is unloaded. Patch 3 drops the completed item from todo.rst.

v5 got no comments, so this version only carries one fix and a rebase.

Changes since v5:
 - keep the "put" pointer read before the barrier in the copy, rather
   than the one the copy reads again, which is not ordered against the
   rest of the data (reported by the Sashiko review bot)
 - rebase onto current drm-rust-next

Tested on a GB203 on top of drm-rust-next with the TLV firmware images:

  - without gsp_keep_logs nothing changes, and no "retained" directory
    is created;
  - with gsp_keep_logs=1, retained/<BDF>/{loginit,logintr,logrm} hold
    the full 64 KiB of each buffer after unbind;
  - binding again does not disturb the copies, and a second unbind
    replaces them, leaving one set;
  - with a failure injected after the GSP has booted, probe() fails with
    -EINVAL and the logs of that attempt are still readable;
  - with a failure injected into the driver registration, the module
    fails to load, leaves no debugfs directory behind, and the next load
    works;
  - repeated load/unload cycles leave nothing behind.

No warnings or oopses in dmesg. Each patch builds on its own, and the
series is clean with CLIPPY=1, rustfmtcheck and checkpatch --strict
(apart from the MAINTAINERS note for the new file, which is already
covered by "F: drivers/gpu/nova-core/").

v5: https://lore.kernel.org/nova-gpu/20260923045551.229259-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++--------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 255 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     | 101 ++++++++--
 4 files changed, 356 insertions(+), 112 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 5a1b7121a6c4db6c0239d3ac3fd1c2bb33a40025
-- 
2.56.0

