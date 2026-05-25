Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747226D4E5;
	Mon, 25 May 2026 22:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779749933; cv=none; b=urDorHY0X4pbW/aBpCXS7fS1zRnWsM2hHdl8CbmGKKBPQhEFS+WY79ZVZ62Npby32vKNRFNvj9BdU9LvfjX1tEoZL11XkAS2HLW/7XLxLvLErzcoZShLPrPUzzQUKLeYZr8+nHGHSr00GAY0LvavbdTBzXWlkHxB1/mHgl8GBxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779749933; c=relaxed/simple;
	bh=eskQ1xKrxiu59OkuwESSzQLUUITKYTrN/XUZ8oM8yG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eyxFVkfOL2Ixy0g2ulHItA3epq/CyNtLr9eQSMYbR6VhM3daYGLQJy8CyWj8nJAVy9dyHN6hK0bLgj+5ZtODCYIX3Qiks6vgH/uiXlZkDvYwHdtFGSjNHmIEYOTMSK8pI9pnfX3mTUPorCRvwzPGIkYkh+Jgo9pKrF7i/y9PbNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2drL2l0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2drL2l0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F941F000E9;
	Mon, 25 May 2026 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779749931;
	bh=Uwkgzu2N4xenCnW9gJInwt4SxGu6xMEQMyOyZKqOvjg=;
	h=From:To:Cc:Subject:Date;
	b=P2drL2l0XThkVIE9tM0hASBWBJB+SlEGH4x0F5ymqriT+yLyhYObHIMj5NT2MIEGI
	 bE83LHngRUFOvM5cZrYckyFeqkTZov96LI3ZTAgruCvmbr2NvzLVPqbI7uVghlrip0
	 A9nEAx4TcWdeGavvbKU54ZEcI9iO5BTQIvbw0ZjtCEx62RfCSMXBN5TX37bcnLn4j8
	 i4Pi5O4piyLk4Xy1D9vrpBqYEywT6TCXZK8B7NBWGlzDzMSbsDdCOpVTf35alXFeRk
	 IIxrbj+XCBxgYnkQC4CE8YMzYwbe/NZuesqRiphFiN4Ji7fwf0SG7FKX8BP+ZNIUAL
	 VgesDYFxMZzVw==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	ttabi@nvidia.com,
	joelagnelf@nvidia.com,
	gary@garyguo.net
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/5] gpu: nova: adopt driver lifetime infrastructure
Date: Tue, 26 May 2026 00:58:28 +0200
Message-ID: <20260525225838.276108-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adopt the driver core lifetime infrastructure for nova.

Use the lifetime-bound pci::Bar directly in NovaCore, eliminating the
Arc<Devres<Bar0>> indirection. This lets SysmemFlush borrow the Bar and
implement Drop for automatic cleanup.

Replace ARef<Device> with plain borrows in SysmemFlush and the GSP sequencer,
where the structs are already lifetime-parameterized.

Separate the driver type from the driver data to allow the private data
to be lifetime-parameterized via the Data GAT.

This patch series is based on [1] and drm-rust-next.

[1] https://lore.kernel.org/driver-core/20260525202921.124698-1-dakr@kernel.org/

Danilo Krummrich (5):
  gpu: nova-core: use lifetime for Bar
  gpu: nova-core: unregister sysmem flush page from Drop
  gpu: nova-core: replace ARef<Device> with &'bound Device in
    SysmemFlush
  gpu: nova-core: gsp: replace ARef<Device> with &'a Device in sequencer
  gpu: nova: separate driver type from driver data

 drivers/gpu/drm/nova/driver.rs         | 12 ++++----
 drivers/gpu/nova-core/driver.rs        | 32 +++++++++-------------
 drivers/gpu/nova-core/fb.rs            | 31 ++++++++++-----------
 drivers/gpu/nova-core/gpu.rs           | 38 ++++++++------------------
 drivers/gpu/nova-core/gsp/boot.rs      |  2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs | 11 ++++----
 6 files changed, 52 insertions(+), 74 deletions(-)

-- 
2.54.0

