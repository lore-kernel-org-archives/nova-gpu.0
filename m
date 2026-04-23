Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4FD306B11;
	Thu, 23 Apr 2026 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948415; cv=none; b=CjfJIzrFqg/IKaf3Ln94rytVsePqU+ww+epP4XsBG9cUasKEll6y9SoxZoXd7w5YT1D8nIgvGegC+tR8YwKtG2nVSt/70i+1BBlrhZho6Tv7dS/01oxPxOpwKTTFwB5t1XEsCqEC3FuzmLpZpCAWzAkS5xt8/VZztJxkRLHhMxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948415; c=relaxed/simple;
	bh=Z1SRFOf8ubpizkQwR1RGL7K+h3/4bmk5BcIeruO4Q8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4ZMBWuHPyxCdBm85cTzRfF9dIGgYj74bWvyeE6ivulyQlBsqam+Za6R2GIDXsBGnIKxl70RFM03ODJszOvs2GisXNBCGfe5Dn9xJEsZkvLzhpM1GPiUby9cW8SouyjZ3FY81BxAQeaUdDh8lHFZMpWGPCmHyPz3Kh4J0PudafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8XGKi48; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8XGKi48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745F6C2BCAF;
	Thu, 23 Apr 2026 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776948415;
	bh=Z1SRFOf8ubpizkQwR1RGL7K+h3/4bmk5BcIeruO4Q8g=;
	h=From:To:Cc:Subject:Date:From;
	b=Q8XGKi48kss+LCHntNINl8LxIgrncU8OZrspY/J8V/RkUksKaabwOiB6V7sQ7Wk5u
	 Ez0wd3fyLGQatktl7KAsqbLdGe2ou9Xe9rc9JLkTmaxCA8dH5CTzuXmu4piQn72fFd
	 7a3i3ssf9+YhlA18+B/8uE0H23LwbYaywVo3FOPp9hdXv6bZnPKUXBqHh/by+d2DJU
	 NhCpI+2vDD+WSOGbq16AZRBXvkIdfG4LeptfGEETHzN2dIOiuLMGT8PRkblJm4MIsc
	 9d/etLp98QZbJsShggB6XOFdZjPqaxzSV3GCritK3tyZ76+0QRkTImBztyd3WE203w
	 GVzMwUHENbATQ==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	apopple@nvidia.com,
	ttabi@nvidia.com,
	zhiw@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	aliceryhl@google.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: nova: update mailing list
Date: Thu, 23 Apr 2026 14:46:35 +0200
Message-ID: <20260423124649.38793-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nouveau mailing list has some issues (e.g. with stripping Cc entries
from replies when using notmuch + b4 based workflows).

Besides that, having a separate mailing list for nova also helps to
better distinguish nova from nouveau and makes it easier to track
nova-specific discussions.

Replace the nouveau mailing list with the new nova-gpu@lists.linux.dev
mailing list for both nova-core and nova-drm, and remove the patchwork
entries, since those are bound to the nouveau mailing list and not used
by nova anyway.

Link: https://lore.kernel.org/all/bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9b7b6f9828e..f44955f177a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8207,10 +8207,9 @@ F:	include/uapi/drm/nouveau_drm.h
 CORE DRIVER FOR NVIDIA GPUS [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
 M:	Alexandre Courbot <acourbot@nvidia.com>
-L:	nouveau@lists.freedesktop.org
+L:	nova-gpu@lists.linux.dev
 S:	Supported
 W:	https://rust-for-linux.com/nova-gpu-driver
-Q:	https://patchwork.freedesktop.org/project/nouveau/
 B:	https://gitlab.freedesktop.org/drm/nova/-/issues
 C:	irc://irc.oftc.net/nouveau
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next
@@ -8219,10 +8218,9 @@ F:	drivers/gpu/nova-core/
 
 DRM DRIVER FOR NVIDIA GPUS [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
-L:	nouveau@lists.freedesktop.org
+L:	nova-gpu@lists.linux.dev
 S:	Supported
 W:	https://rust-for-linux.com/nova-gpu-driver
-Q:	https://patchwork.freedesktop.org/project/nouveau/
 B:	https://gitlab.freedesktop.org/drm/nova/-/issues
 C:	irc://irc.oftc.net/nouveau
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next

base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
-- 
2.54.0

