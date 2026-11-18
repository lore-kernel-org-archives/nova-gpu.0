Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019531;
	b=lHDNhc54jKxUEWa6L6fEawiCxTaNxvRpQusy96e2k4prP8pg7QL4Qe4GOKcmbvbFcOXi
	 G5++6Sq0vco1O4wF9jh3UHKOsjGbm8p5upIz4gw+oUjHtgN5NR497T/giUobzC8SeNWRk
	 a6Y0WWGd5dazpkxVpZ4cBhLc2LQYMF06PcwVo25L4IXLHcNwVJ6uHs9ABJXC1bgHhEmbA
	 PDMBQZsjGzV6aFWJA3Lijo5bdiHiUHZ2mpwWUhArKa1ZSpBVBx4v0ai6BKkE2dvkJmsEn
	 RoxVTgR973tCSlXPFXu+UJRr5ppDXPKFDHbsTZyxo48CxakjL5uL/vTX94jalQcA0gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019531;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nLkHGjzkpLWqDn5A0Bf7/KvxqlXzbGH5zYTHM3bADyI=;
	b=mhrEDDN5wfPy9S7o6u3srUQkL6PjhSy5udxNcJ36E8hb+P8D5ALxnFHfyWqKzwz8AI4f
	 V3fZ6e4i5ZRgTh71yu49dLv/ewNrFeo5RxUvo7LKF9FjYDW+HiWqUwDPZ+Hf8QegEsHUd
	 Dgx+cqUENAuYqQEHjPvb8PDyVjXmxZDk1ODXf0uvuvzPU3O3B3fSm+cf7dLHOUKrETJh9
	 Q/0Ovgmsy9Oo1V4rSpHTf3Q4N4q9Ylg4Ejr7p7YtqD6Ut9xZkFu8T+RQr/6Z+G5U58JyE
	 pK84aIl/4IlsIe9xPgZgWMagaYhBCgpFYE1vQd+a4JVCAv9yGQ1fBHaKs3MrRqt+ejA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oeWxroLD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A61606A32F;
	Wed, 18 Nov 2026 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oeWxroLD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2221C1F000C5;
	Wed, 18 Nov 2026 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019531;
	bh=nLkHGjzkpLWqDn5A0Bf7/KvxqlXzbGH5zYTHM3bADyI=;
	h=From:To:Cc:Subject:Date;
	b=oeWxroLDGx1J0ayXKqh4fcy5WrCR3T1eRpCOokeFfeIeRlZMCcRmDAxjmU/Db+Zc4
	 v77BJasECFdMV39KTtDaCF0q2g5GJPhNeT0ZHXgTqQetTonNH6C2tk6JP6k85jDyqK
	 qm5ogj2rMR7VfbhYqEgVDmh1FKJkHVwzxR4VREjFlkSsRIjr9glRp9yAnBVYMgNiBo
	 ZRleQpJnszbw7hkwWRPbm3Fnay4bbqmn9e8sHcP1LYlEa5dzX54lkKzkb+R0qEgvv2
	 QjeKBO4J42HFpNVWXD4qkBeVayzeadSjPDGE9sTtF7AA6a6AFhLQHc+GSeDqb5fk0n
	 HFA6kIB+g+DpA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	acourbot@nvidia.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	brauner@kernel.org,
	lyude@redhat.com,
	j@jananu.net,
	alvin.sun@linux.dev,
	deborah.brouwer@collabora.com,
	laura.nao@collabora.com,
	beata.michalska@arm.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] lifetime-parameterized DRM File private data
Date: Wed, 18 Nov 2026 17:29:41 +0100
Message-ID: <20261118163203.2483856-1-dakr@kernel.org>
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

DRM file private data is currently 'static, preventing drivers from
borrowing registration-scoped resources in their per-file state. This
series makes Driver::File lifetime-parameterized, so file data can borrow
from RegistrationData.

File data is guaranteed to be dropped before registration data, either
when the file is closed normally or when the device is unregistered,
whichever comes first. To enforce this during unbind, Registration::drop()
revokes all open file data and waits for its destruction before dropping
registration data.

fops.open is wrapped in a RegistrationGuard (drm_dev_enter/exit) so that
after drm_dev_unplug() all successfully opened files are accounted for.
GEM open/close callbacks are similarly gated to prevent access to stale
file data after unbind.

The series is based on drm-rust-next with [1] applied; a branch with the
patches is available in [2].

[1] https://lore.kernel.org/all/20261117001507.1611984-1-dakr@kernel.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=drm/file

Changes in v3:
- Move the DriverFile bound to Driver::File<'a>.
- Require Send + Sync for DriverFile.
- Use Atomic<u64> for open_count.
- Explain driver_priv synchronization in postclose_callback().

Changes in v2:
- Replace ForLt with Driver::File<'a>; use inner_with() for file-data access
  and allow returning borrowed fields.
- Use Opaque<bindings::drm_file> during teardown.
- Drop file data outside filelist_mutex; also clean up file data on
  registration failure.
- Reject cross-device GEM handles.
- Clarify safety documentation and add inline annotations.

Danilo Krummrich (7):
  rust: drm: rename Ioctl device context to Userspace
  rust: drm: gem: gate open/close callbacks with RegistrationGuard
  rust: drm: move file_operations from gem to device
  rust: fs: add iminor() helper
  rust: drm: wrap fops open with RegistrationGuard
  rust: drm: return impl PinInit from DriverFile::open()
  rust: drm: make Driver::File lifetime-parameterized

 drivers/gpu/drm/nova/driver.rs |   2 +-
 drivers/gpu/drm/nova/file.rs   |  16 +--
 drivers/gpu/drm/nova/gem.rs    |   8 +-
 drivers/gpu/drm/tyr/driver.rs  |   2 +-
 drivers/gpu/drm/tyr/file.rs    |  13 ++-
 rust/helpers/fs.c              |   5 +
 rust/kernel/drm/device.rs      | 136 ++++++++++++++++++++++----
 rust/kernel/drm/driver.rs      | 113 ++++++++++++++++++++--
 rust/kernel/drm/file.rs        | 172 ++++++++++++++++++++++++---------
 rust/kernel/drm/gem/mod.rs     |  80 +++++++++------
 rust/kernel/drm/gem/shmem.rs   |  11 ++-
 rust/kernel/drm/ioctl.rs       |  18 ++--
 rust/kernel/drm/mod.rs         |   2 +-
 13 files changed, 446 insertions(+), 132 deletions(-)


base-commit: 23eb2cfcf15209d149f407e462704c21b9ce9cc4
-- 
2.56.1

