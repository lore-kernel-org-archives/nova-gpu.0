Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CF3BA246;
	Mon, 27 Jul 2026 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167514; cv=none; b=S3saMVI6Si0TGKlSrs/D3+Lw7wyBSsNf1NfmmIq9IpbINx6lfJK9tBxtDr1ad13yEe51NuWAbJBki7wQzSomhMcPaQjkVNRrmPSNl7NBD50ZdLNd2vT/5ZRCdqPj5msnWEylsvePYxBbJkE7ffNSGVTkjnshKv4O15L0dit/YFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167514; c=relaxed/simple;
	bh=AqkQNbeanM9zW6wuUJlQf2mT318ZwQ2Ism0wOYOAqHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBj8JNgcdc+katj+WrX/0gArqguMHzj1vn8D7O7LXFVjYItPn9OGLzz+0Bg1yjlk8CHWLDH4CALm5J2SrhK7TKbSMxJZLsf2DuWUaaQDzYQ+vDO68zAn0P4yABHvqCLnDnxxrjsMPO23T60D0AzllCbMCDs0QSdMnz188BHFC3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=srOU7yij; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="srOU7yij"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F21A9C2BCFB;
	Mon, 27 Jul 2026 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785167514;
	bh=AqkQNbeanM9zW6wuUJlQf2mT318ZwQ2Ism0wOYOAqHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=srOU7yijRw1zgh+R/Xr0SWRnQWOqXFngj1bgkDhI+aPcUQ8vU4jhWYk+iRxMWpVqE
	 gUfZg5Nzk4j3j4OCLrpArEbh14tTpr/JpzGNs7Wq63oOgliFDhX+QF8ga2v/D7P4Ef
	 sa6rdWLN2jetbr7qfEU29Ddbkbby+BFA8PWoNd7lywrhw2EawhDhIAMNREZjokxVWo
	 HRsl/GOvNwfbwSBMoX44UjmZLASayYhpWk+yXRXyLlYvJrCSTSzVRF82fuHfv4AOru
	 JXmU5XbFAwx/uEok2lKC1yQjfYxix2X8GIndK3ogSzJKgz+jaexMatPCuuoWuYuBq9
	 NHCLtwwLMxP4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93A1C54F4C;
	Mon, 27 Jul 2026 15:51:53 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Date: Mon, 27 Jul 2026 17:51:53 +0200
Subject: [PATCH v2 3/3] gpu: nova-core: Move one PBUS register definition
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-nova-core-regs-split-v2-3-21b5e6e32ea5@nanonej.com>
References: <20260727-nova-core-regs-split-v2-0-21b5e6e32ea5@nanonej.com>
In-Reply-To: <20260727-nova-core-regs-split-v2-0-21b5e6e32ea5@nanonej.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, daniel.almeida@collabora.com, 
 Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=qOJasvBGolfcKNveGr8i56M3y3jIZjt5WfhPmfMSDp0=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqZ36YwzbmECPY9PMLjR9ZtL3x+H1Rel0p7M1f+
 hVKzfaOxXCJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCamd+mAAKCRBmh/EjChUV
 /U2JD/9K8X8H8FrpLrJ1s9dCv4pbm87c3s+nuhStRKklPaViSsBfxZZwI1pYlUb85Wrzd2EJzTS
 Lkg0xkb6FfirKFJ6NnEToWn1QMqHE1mkM90C1yNbR/+iZ//LuU0OGbIi1IQp3svRJSceL+otbLe
 IgCPO21xs+1ubKozOyVgf0h9qBtev1n530DpIBn/OdV8GOQwHTPeC0xAg96Zqi+Vs0Z8VyY3g2Z
 jGmjLU/E8EYoB5ECTKm8JzYAByOQMXC3LjwlyE0AdYLBcXxEh9SnzpM4NZwIk8OJZVOev0RnYHo
 JB2fUQbA55LlFpUTxIHqLj9MpqlURH7UgBiWZjRFfsoaNbXOYcNTPLrN2zqJzQoelHJJy3riigx
 X8fitta0iCJi2TSUKr4m9sLc1kBzzwrOHZd9Se1gTb0wXSLa6RvTUek7C2ygDK63PBymcWg/QsH
 7ckAFNzmxIFqNiLHBB6dTp1ctpLGL6/4jNYEl56bEMVPy2NZrX4HIpYmMhLoJIY0N1OBEqlTFx2
 SbAytO/rJlNT5fMewiF75CY6VIep4BrWR/9RAp2xWWEZ+36RMoSfm5Mw6walh5IJA9y7Xu+gmza
 3YkJ/Svcf9a98UnhhZnJ+DZLb1ym7R7dKoajRaquWBZSUotUk2TLvDpB5nf+dWmL4TQPihAwGdn
 E5eToZHJQ2WqxOQ==
X-Developer-Key: i=dev@nanonej.com; a=openpgp;
 fpr=83B64FB07C91212F5285227D6687F1230A1515FD
X-Endpoint-Received: by B4 Relay for dev@nanonej.com/default with
 auth_id=825
X-Original-From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Reply-To: dev@nanonej.com

From: Antonin Malzieu Ridolfi <dev@nanonej.com>

Move NV_PBUS_SW_SCRATCH_0E_FRTS_ERR register definition into gsp
module and update registers visibility.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
 drivers/gpu/nova-core/gsp/hal/tu102.rs |  2 +-
 drivers/gpu/nova-core/gsp/regs.rs      | 11 +++++++++++
 drivers/gpu/nova-core/regs.rs          |  5 -----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index 03861add8e20..03133f723faf 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -40,12 +40,12 @@
             GspHal,
             UnloadBundle, //
         },
+        regs,
         sequencer::GspSequencer,
         Gsp,
         GspBootContext,
         GspFwWprMeta, //
     },
-    regs,
     vbios::Vbios, //
 };
 
diff --git a/drivers/gpu/nova-core/gsp/regs.rs b/drivers/gpu/nova-core/gsp/regs.rs
index a76dea3c3ab0..9a48aa87e7fb 100644
--- a/drivers/gpu/nova-core/gsp/regs.rs
+++ b/drivers/gpu/nova-core/gsp/regs.rs
@@ -2,6 +2,8 @@
 
 use kernel::io::register;
 
+use crate::regs::NV_PBUS_SW_SCRATCH;
+
 // PGSP
 
 register! {
@@ -9,3 +11,12 @@
         31:0    address;
     }
 }
+
+// PBUS
+
+register! {
+    /// Scratch register 0xe used as FRTS firmware error code.
+    pub(super) NV_PBUS_SW_SCRATCH_0E_FRTS_ERR(u32) => NV_PBUS_SW_SCRATCH[0xe] {
+        31:16   frts_err_code;
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index d58dc6dd0f04..caeef4d85874 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -109,11 +109,6 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 
 register! {
     pub(crate) NV_PBUS_SW_SCRATCH(u32)[64] @ 0x00001400 {}
-
-    /// Scratch register 0xe used as FRTS firmware error code.
-    pub(crate) NV_PBUS_SW_SCRATCH_0E_FRTS_ERR(u32) => NV_PBUS_SW_SCRATCH[0xe] {
-        31:16   frts_err_code;
-    }
 }
 
 // PGC6 register space.

-- 
2.55.0


