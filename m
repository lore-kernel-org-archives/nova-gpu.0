Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C210C410D24;
	Wed, 10 Jun 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099874; cv=none; b=ZlaM/Y1bZo0hNpZiqwquxXj33NV7KRCZavlTlFTFcK5fYuWKLV5F9IRx8ejUKrN8TzXXZLXK/4zOpTP2qqEHXQjz5NzFfKBrexmToo5FTu1WXCTrEQRaPcG04dvq0BsqPuJuNlCQ060YdAsZYBn4buvHuV04i0TJGbjunbWuts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099874; c=relaxed/simple;
	bh=c9Kvq3BG3vHoZXRkXIvCTMqZ7NylntavOKKZeIaWa50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtprQFYOAOWvEYxEl9zS0x20Y5H5NJS7yTO98zQO03l3Ux25pul3iA+0x20CqhYZY1Jf9kEUFJoPo/r7pdxkISeDD+W4+VWz4XVmuCO9Ogr60N4lj7PBtiGoy7B1GdjLMfnfJGQSt/b54WH/RrmwNwxmK9JhSvyDo/VQQ3abyL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgnZ9P7y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgnZ9P7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32F61F00893;
	Wed, 10 Jun 2026 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781099870;
	bh=TeizJECtqJ8z2fxDQWQ6uFGtYjvnQLbN04L3f5mZygY=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=LgnZ9P7ywGIlS6U1InWIk2u9V0MjpqMAkZRaLtdVVeYj7eNYSgbsmBnV+4JgWalNf
	 lUrvG5nbugn9qhvu9SmD8iHEY7gQeCkZrSPjASXiC76KK6nNZOleqpjNm0rcxIY9DR
	 3Ro5H6uIiDK7ujHVpy88/KEQ8IfnnZFk3K3yoLDK6HTrcxiI6XMZQwXOnrP+4WnCB5
	 rnZ2zGrM4MlWBARpbVVFnR1t6Feq8gkYbByjLlN0Z/SqGIKGX/1ctif2RxnH4CmUSl
	 uOPUNXAc9Na0b9bqj8njtl9AoO1CR8P3ehO8ljXgKDF0Ko0gCUXYnjsmQGykcvtvbJ
	 BA6rv7Hj17Fjw==
From: Gary Guo <gary@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Gary Guo <gary@garyguo.net>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpu: nova-core: remove imports available from prelude
Date: Wed, 10 Jun 2026 14:57:14 +0100
Message-ID: <20260610135716.1013688-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
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
 drivers/gpu/nova-core/firmware.rs                  | 4 +---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 366d3b76360e..f74e0f16c65c 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -467,11 +467,9 @@ pub(crate) const fn create(
 /// that scheme before nova-core becomes stable, which means this module will eventually be
 /// removed.
 mod elf {
-    use core::mem::size_of;
-
     use kernel::{
         bindings,
-        str::CStr,
+        prelude::*,
         transmute::FromBytes, //
     };
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 039920dc340b..ac1558a83b83 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -7,7 +7,6 @@
 //! be loaded using PIO.
 
 use kernel::{
-    alloc::KVec,
     device::{
         self,
         Device, //

base-commit: 58f0f62778faf667bdaf1fa7db59e89847213646
-- 
2.54.0

