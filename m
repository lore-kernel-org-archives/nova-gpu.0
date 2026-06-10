Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7762941167D;
	Wed, 10 Jun 2026 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099879; cv=none; b=s5ziGMtMwJ7b/4tiXwEr8gbybTl7rKdAN4Z7qdpmgpaZo2WrIzWpTinffAZgFYasRphIrTM0Iqwg6iawIKTiyaXbK5zwK4+ROvZqT5UffspDw+jDO7be1Pf1M5XKYCDI58E1lEOHvx4VP9HFyhf/SIshx/oAgS3uLXiOUaadKSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099879; c=relaxed/simple;
	bh=QXeR7NOIUAgGDwgodfLqhRuHyTgfOEZb9qjyLITjj2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbrB0STNe0fXO/6YVWL1jYq5v9UN8zNWqnr7PV3LgCIr4QwUVrpiJxvLvE1hVGsWk5L/wEx4mpqU0ilOumSDGJ+rid6ZFv0d8PCdqLuzX+KZXvAUk+zhcyw9YiEnTuDW1xTzet1VROeYmbYhRjePFkG4+1VbIh3XURBF7LHxnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcGj8kGG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcGj8kGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C47E1F00893;
	Wed, 10 Jun 2026 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781099878;
	bh=HGRHyYwNvn4lA0Xw14jdK/t3SL3DhcwG0SMCUKKzHYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=gcGj8kGGaoZW0cb2H7hR5PvR5zrMsZrgY06XxR6FyMDiGvcyIjwMKNOys8POK025/
	 EwdRSa7s3QfAdYcLr75FPXiGhd+H04eAHJLY1yilq/IvDeG8SZ7qJhyMVtQUxoRbco
	 sPvcne0sAdQbM3ou7YPnWkFTudKQiQR2GzSiakD6mr0AWf8mGb5lxAtq4onNGk4ApW
	 HVw6f/qZIoCtxziHzyq6fLcmzBlLtPIl2qUOvJGtSu3BbcxKPAtfG83qq+Zvn9+DHe
	 W8qtOR8PLWtd44f9yCqMxSGUC5lLySofLntmHBDsRliqsYLiaimseFgxQoq+BxgmXk
	 ucemmg/GJKfqQ==
From: Gary Guo <gary@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 2/2] gpu: nova-core: use `c"literal"` instead of `c_str!()`
Date: Wed, 10 Jun 2026 14:57:15 +0100
Message-ID: <20260610135716.1013688-2-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610135716.1013688-1-gary@kernel.org>
References: <20260610135716.1013688-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

No functional changes intended.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/nova-core/nova_core.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 9f0199f7b38c..735b8e17c6b6 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -54,7 +54,7 @@ struct NovaCoreModule {
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
-        let dir = debugfs::Dir::new(kernel::c_str!("nova-core"));
+        let dir = debugfs::Dir::new(c"nova-core");
 
         // SAFETY: We are the only driver code running during init, so there
         // cannot be any concurrent access to `DEBUGFS_ROOT`.
-- 
2.54.0

