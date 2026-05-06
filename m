Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660D145B3F;
	Wed,  6 May 2026 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110401; cv=none; b=Y1K9qyGycHEOkFKaxiyJtS1yhpU92eL6aL3KUCG7GlktVehlc55nIbR9z/OJIcZ11N/BhAjsJsyS/4fT1sn87bPrXNU0hRz3ERmeWP1p72iGnPm/RlsJils//Ate48Vf0Wo5oQdqH6L1hzXdP/W5fAUYh3GwPHRTG8BEs9iuPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110401; c=relaxed/simple;
	bh=glSgko/3lRAUAdpS5Vo5lsW3Gcp/ZQ8rSY8RK15A8E0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=TM+Jdyu4KNFNzofNBejPkaF5Aswt7kYml+SE9rUw5QghmRTx3MNWClNlr+Mozf2weZ2JV518F704QyVAIs7HwaTZHQeGsQP1fRe+HIA3r/UQGErOjRqufOIsg/gn1o3X/TFpkypHZ43B/D/658H7YI5vrNRFXKZc0MLDyJYvZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0ZdA8oc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0ZdA8oc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A29C2BCB0;
	Wed,  6 May 2026 23:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778110401;
	bh=glSgko/3lRAUAdpS5Vo5lsW3Gcp/ZQ8rSY8RK15A8E0=;
	h=Date:Subject:Cc:To:From:From;
	b=s0ZdA8oc/SPhN/sedJwH0DfYKAWXNtLEkHlrwcP88DQyYOxtbLW+Dy7rleMaGgJCr
	 aHY1CCEHM/g1mzs4izcDfvG58w/QC36uWs39HXuj+3E11xAfm1WBurQh+ZOVjNRLom
	 1ICWedKqmF8g8YDGWUPLT0BTREzu/yzAULU58M5IlByOb7vYZxQQwwhwV1/yUvbF7D
	 cjxhr+9f/i40q5u1pO1sIWgxypBFqWqVoAs/UxR44KD8zip534iJH7QPFR7e/tyOyS
	 5nTljbbPkRxnD/WB7R8Ff3FXYDqhpqpHBA+FK526q+boGe/BS0NaOO3OJWkGkHrtis
	 rvVoRA70Xm4vg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 01:33:17 +0200
Message-Id: <DIBZJ40ZC4J3.Y1DLA7JTS2PC@kernel.org>
Subject: [GIT PULL] DRM Rust fixes for v7.1-rc3
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Dave and Sima,

Please pull these DRM Rust fixes.

Not all of them have been in linux-next -- linux-next keeps merging branche=
s
from the drm-rust tree, but without fetching the remote; I reported this in=
 [1].

No conflicts expected.

- Danilo

[1] https://lore.kernel.org/linux-next/DIBZCHAXRBPZ.2AM1ZBR61RA9Z@kernel.or=
g/

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-fixes-20=
26-05-07

for you to fetch changes up to 0a69ac25bd596d50823d530d0a2004336668c0df:

  rust: drm: fix unsound initialization in drm::Device::new (2026-05-03 14:=
04:57 +0200)

----------------------------------------------------------------
DRM Rust fixes for v7.1-rc3

- Fix unsound initialization in drm::Device::new(); if pinned
  initialization of drm::Device::Data fails, make sure
  drm::Device::release() isn't called, so we don't run the data's
  destructor

- Fix missing GEM state cleanup in the init failure case; call
  drm_gem_private_object_fini() if drm_gem_object_init() fails

- Fix wrong ARef import in the DRM shmem GEM helper abstraction

- Replace the nouveau mailing list with the new nova-gpu mailing list
  for both nova-core and nova-drm, and remove unused patchwork entries

----------------------------------------------------------------
Danilo Krummrich (1):
      MAINTAINERS: nova: update mailing list

Eliot Courtney (2):
      rust: drm: gem: clean up GEM state in init failure case
      rust: drm: fix unsound initialization in drm::Device::new

Mukesh Kumar Chaurasiya (IBM) (1):
      rust/drm: import ARef from sync crate

 MAINTAINERS                  |  6 ++----
 rust/kernel/drm/device.rs    | 22 ++++++++++++++++------
 rust/kernel/drm/gem/mod.rs   | 13 +++++++++++--
 rust/kernel/drm/gem/shmem.rs |  6 ++----
 4 files changed, 31 insertions(+), 16 deletions(-)
