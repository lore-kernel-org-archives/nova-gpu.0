Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445144;
	b=4PjEmKDEoDnjfT0cP5mHmhvHqjSOxsy5GRSb40dT5Bj1Yx2fx4Rs2RskHi6T98iUbt2G
	 U2mSp/NEE4tmJuvOg6ZaLOif6bPyAPEdTYv0rT9Z8qneloXvgGB43sp+yKUeWT65rRZJ/
	 29wq1TXNROr8gFwqWb3zGvSiKGtPKL2bYIzu9f7qcUzJfj22TfMYST3gapTGXFdiAs/fh
	 PNpfMnmNFfkMjxXsWKfjZkX4h9ENP0nNy3SY2uQOD+FL7VcenEOvNK/XU7i3NY2Gvey0R
	 MC2rPJ+WuwideyIQXFcB2dqb8hmMsGWMFvpVOXiM4ufXzdc5au49yw7Lc6DivfBYxaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445144;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LnbL2Qy4aOtp99Oxyh8NxAazgtHYMt/GuKPuI+ulARE=;
	b=UNc2PreWAVZISrrrdFOvkZ3DwmsEpbec2xt1/+O1h8LtpXW2tPuCwrIJ4yENKMfIwev4
	 Nawnj/WvzzxTJjGs4/Q3H8sYKV9TrQgLAxSLpiUMxrUZ0ZsvlsugqUdhMFSzTtfiCkUQj
	 5lPZ8D9RFXVnWnw7n1Zzg0H9YJ+wyG+fzezEnWbk+f7UKq5W7GtmD7hZbkWAJFD30y7Gk
	 2yrMuR/kcDBgZySb0PkAk07Q4wNn1NQG9YbPXLfkq8rlWFCaW4PV+EHblSbXYFJQcarq6
	 kDszJ0FKe4h7BNsPHbQcfImRJ74mbLlrtT16uTYSMNKkUhW8GR1XOdSNn5mWRZARMSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXlg67En;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B0606A319;
	Mon, 19 Oct 2026 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXlg67En
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25A31F000C4;
	Mon, 19 Oct 2026 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445143;
	bh=LnbL2Qy4aOtp99Oxyh8NxAazgtHYMt/GuKPuI+ulARE=;
	h=From:To:Cc:Subject:Date;
	b=YXlg67En4U/K0gG8XNtO7lBQWJVRq5q01WXDMR5sKCyD8C9Gi8ZRCod9p0mTX4ZBN
	 r7Gs1l14DSrAmdjJPSalA1Z7yU7XqOKV5nRkBFLKLG1dgmZAWObNEqWnSNv+RgxJ6F
	 dZVThNK3jOal62IgpMExh/3NgVjt4hIuePKPmfy8MYuCNUvOzjmspLSNybafK51sRQ
	 XLQGjXfI1gWyn0VPMgGgvbyDyexxDLMDIJKimUVPm1M74pROTnSzYrms6WphSWyt4C
	 wSQUCQtZ97vatXN9XkaQA5SnvYY5uUXjeRS5vdx5tngmXSzk2Uey93WzZkGbX29EEv
	 2mAp5s9ZtempA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	ecourtney@nvidia.com,
	lyude@redhat.com,
	kherbst@redhat.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/3] drm/nova: make unstable uAPI use explicit
Date: Mon, 19 Oct 2026 23:24:44 +0200
Message-ID: <20261019212535.88390-1-dakr@kernel.org>
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

Nova and its uAPI are under active upstream development. We want to develop
these interfaces upstream while making clear that they are not yet stable and
may change incompatibly.

This series makes that status more explicit and requires users to acknowledge it
before enabling the driver, tainting the kernel when they do.

Introduce a minimal Rust abstraction for kernel tainting in order to support
this.

As individual interfaces stabilize, they should move from nova_drm_unstable.h to
the stable nova_drm.h header. Once all interfaces have moved and all
stakeholders agree that the uAPI is stable, the acknowledgment requirement and
kernel tainting can be removed.

(Compile-tested only, as I'm currently travelling.)

Danilo Krummrich (3):
  drm/nova: mark the uAPI header as unstable
  rust: add kernel taint abstraction
  drm/nova: require explicit opt-in to unstable uAPI

 drivers/gpu/drm/nova/Kconfig             |  11 +-
 drivers/gpu/drm/nova/nova.rs             |  55 +++++-
 drivers/gpu/drm/nova/nova_drm_unstable.h | 212 +++++++++++++++++++++++
 include/uapi/drm/nova_drm.h              | 204 +---------------------
 rust/bindings/bindings_helper.h          |   1 +
 rust/kernel/lib.rs                       |   1 +
 rust/kernel/panic.rs                     |  50 ++++++
 rust/uapi/uapi_helper.h                  |   2 +
 8 files changed, 332 insertions(+), 204 deletions(-)
 create mode 100644 drivers/gpu/drm/nova/nova_drm_unstable.h
 create mode 100644 rust/kernel/panic.rs


base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
-- 
2.56.0

