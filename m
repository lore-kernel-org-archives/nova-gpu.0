Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF03D9DBB
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 04:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139389; cv=none; b=bWh6XY2sYzIV9c8daRzptSX3dMQRfjtE85SBg3IHcBoDLP3Rdg4TGDlYfB3lJVcCIGQJJUuN0dEoAVGs9gEq50LcAQh+eh/ZR86vZA/oJd+QQms+BJnGaH+g3WVR6g03BnjXJjTkKiyOJZwSPpoPlMddV3737Ps9cfMy62xbOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139389; c=relaxed/simple;
	bh=XiFSpop+KGxbUcWP8n6c2tXURjWzEe4pDG4YB8Ah2sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GccYR2GRYPmfOfFJj5E2DiP1nsQl/f3aGGdN6RHB0G1n2eEvIrUzvW4sG5xHWsu7mtXDQlK/mWg9N1dgaKxiE0+dgp5QqrQch5f/uakbtcJ8tPzlbbuPi4xMz/dEJR5I0cIMPwo5L5Dafu9LQy7cBim6mducMZoanzQ8CeiwGTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7EgoY4l; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7EgoY4l"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b35611so273308b3a.0
        for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 21:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139365; x=1790744165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1SOesHNHdnwoiL8FAjnK92erd43AfuOxzvjh4ET6B0=;
        b=V7EgoY4ljnvteJJ1+z9e4qayGc3zjJuoKBUDoBx4aoDrEV5HXgdL269DeY2yVC2pM7
         6dhrnKXv6nzc+6M6RXauG3ee/FGgmIF9ZKO+qPV3ArHM8z0hC8aOnOGb0rc35CfdQkW5
         8H6xHBYuIin59LS0TpTvAhvG4kub11J+08wldC1UL8bb3r1Tjj8tY9xI98bcKz5YHQON
         uoSQOQRrn4NwcUQiPln4Z2G2DQ/sTrTEb/OGVe2+BYStV/zqvkoJ45PDJM39oPQmk8mB
         2FxbD2Nn6wT8CTAf7exQPsiFd3vLadIIDF8c6a3MnTV7NhgY2Xg3YWmOVLLEt3HYVqFc
         tFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139365; x=1790744165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1SOesHNHdnwoiL8FAjnK92erd43AfuOxzvjh4ET6B0=;
        b=ObQF2dUuxXsdWVEl9pUNx3ZQNrQDZGuXzKK2gxcemuQEk0k5vwny0APCgkdTXFVgj/
         Pg5q7na7jTLOr4HWNnmvj/IFPxbvg4im4PdWgAFoHWWo4UtV9jUQvZIVs6e8K1qV2F2w
         kwpYUz1+7PpUh6kKkut0Q+sRsEn40oKSKyjfPhU44a9EgtgZ9gNYf7V1TV3v+Llq+Hc8
         iO6Q9c8edw6dqsgmlSZwScyX5x6U6DoacAOlbsOr9HCVaklY0TXolqTqv5ekdZMGlGLQ
         G6qsq+z8jbeZf3CkLhgEyaQxPwuP7Vz0l00AY3NBydUvLoVZtdb8vbSsnbpgDhLC8bOb
         JdiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+4cJLPmj5o8ZkcE+X4MSWvSHFHZ3zkt1mLiq2xsyy5yBgl9b/C9A1IEY/qH6iT/9BD0eVK2O4ow==@lists.linux.dev
X-Gm-Message-State: AFuF++moX0FasKqyp+fEhZLGFwNm3XxcNFl6g0bWJBLNO9AIcBiE4Dhq
	kuj2vnlZjj3PTZGImuJVXFx2QutW9YOr1tUFm47wD7JCcluNathYRZcC
X-Gm-Gg: AYBFou1zBEQ3hHwLvKhAMLronh0fh+B5hhuJ356FxoNwfeK2MHOcVqlV7Ny1j2tf7Go
	wsxFSB8eJSULSm7k8Fd3QFKzIKfPeEKMQFnTefYXy6XIRV23GU7UvwSJH9ExyZZ+OUAjGoUz/JM
	tWBeDwddNgpObQw3RRb6G4SIE0u+TvM8NJFvK2Ga4OTNxkrnobPgAB7yBrjb2ANVrlPLi0DVOng
	BPihCNxxHA3WVlB1KfwTfSCtizzif5vAS156Ka0xllAxKKVoW0A6S0S+UATi4ZR8OmKw7W2+ka7
	QLsv2ts/6QSWYEEPVHsUxmC9mGR58zd+To3beeoD0nsPzuJxYsAcLQ9GjhK4rQ6OyDsySrpq5ZL
	IsB51aIoQrLyczoT8FZrta6hJ9oCLNBaKFYQ3RHjZ8N+WLNqM45jJi+NBUHTfxmd2zwmvffn2Xw
	LdAoMhm1Mpv8MmWlONue+gtPkia12NjSgNpOpfNvi/hts//h/7xRsuq4YnopnJsc13QiwuCBNzF
	NrW
X-Received: by 2002:a05:6a00:430d:b0:874:706d:9631 with SMTP id d2e1a72fcca58-87d1c9b91b2mr1467960b3a.35.1790139363769;
        Tue, 22 Sep 2026 21:56:03 -0700 (PDT)
Received: from localhost ([95.190.82.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cec2d34sm664129b3a.14.2026.09.22.21.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:56:03 -0700 (PDT)
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
Subject: [PATCH v5 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Wed, 23 Sep 2026 11:55:48 +0700
Message-ID: <20260923045551.229259-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but the entries are
owned by the Gpu that probe() builds, and the buffers themselves are DMA
allocations that cannot outlive the device. They are therefore gone as
soon as the GPU is unbound, and in particular as soon as probe() fails -
which is the case todo.rst singled out, and the one where a GSP log is
worth having.

Patch 1 gives the module data a DebugfsData that owns the debugfs root,
replacing the static that held it. Patch 2 adds a gsp_keep_logs module
parameter: when it is set, whatever the GSP wrote is copied into that
same DebugfsData and exposed under a "retained" directory until the
module is unloaded. Patch 3 drops the now completed task from todo.rst.

Changes since v4:
 - no longer reset the pointer to the module data; debugfs_data() takes
   the bound device and returns a reference tied to it, rather than an
   Option<&'static> (Gary Guo)
 - set the pointer from the module initializer, through the binding
   pin-init makes for the initialized _debugfs field (Gary Guo). v4 said
   pin-init gives no access to a pinned field there, which was wrong
 - rebase onto current drm-rust-next
 - reword comments that no longer matched the code, and use the current
   Assisted-by format

Testing was done on top of drm-rust-next with the TLV firmware images
installed. On a GB203:

  - with gsp_keep_logs unset, no "retained" directory is created and the
    entries disappear on unbind, as before;
  - with gsp_keep_logs=1, retained/<BDF>/{loginit,logintr,logrm} hold
    the contents the live entries had, all 64 KiB of each readable;
  - binding the GPU again recreates the live entries without disturbing
    the copies, and unbinding it a second time replaces them, leaving
    exactly one set behind;
  - with a failure injected after the GSP has booted, probe() fails with
    -EINVAL, the driver stays unbound, and the logs of that attempt are
    still readable;
  - with a failure injected into the Registration instead, the module
    fails to load, leaves no debugfs directory behind, and the next load
    comes up with its directory intact;
  - the copies are released on module unload, and repeated load/unload
    cycles leave nothing behind.

The parameter does need a value: the Rust bool param ops do not set
KERNEL_PARAM_OPS_FL_NOARG, so a bare gsp_keep_logs is refused, where the
C bool would have taken it.

No warnings, oopses or refcount complaints in dmesg throughout. Each
patch builds on its own; built and checked with CLIPPY=1 and
rustfmtcheck. checkpatch --strict is clean apart from the MAINTAINERS
note for the new file, which is already covered by the existing
"F: drivers/gpu/nova-core/" pattern.

v4: https://lore.kernel.org/nova-gpu/20260913183734.134307-1-vladazaharova2018@gmail.com/
v3: https://lore.kernel.org/nova-gpu/20260912071842.622696-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++--------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 247 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     | 100 ++++++++--
 4 files changed, 347 insertions(+), 112 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: e1a9f41b896f0d57eb1165dd8a4c7446be6af638
-- 
2.55.0

