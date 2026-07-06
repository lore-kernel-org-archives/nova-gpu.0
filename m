Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F23AD513
	for <nova-gpu@lists.linux.dev>; Mon,  6 Jul 2026 03:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783307929; cv=none; b=GhwI2DAfC3wSoTeEAKbukhwXoordW391bdUjKCtpSBuMF5xcx2aM5qa1g46fj2bc2rGa9pZB3Lo3pwJgR/J3OGgWIX1EfBnYJcRG9vOphagxIK/y/fbwlw5ebDZBJPz6UVvkOt/SPn/aDLjLKSk/aKoi0hY9tPNxP2M3iEDt18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783307929; c=relaxed/simple;
	bh=cGIRGOruGvN/0zeFBvQmzIRHlIvLy6A1z+BIKeGp4x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Itjecvosj57WB6gxuQZNP8FG0Ag2ljbJ20/wwbGX2JohZRivvv4IR0u9SD0bbtnmsW/Zcf/h91/f7MKqYRjJQ9b+ATTIbPZMwnKF7fZxEeoYJywI4R6V0b3VdArHt+HqDFFic5EZyDW+HaXpZJRahbO6nvj8+7GDRimMbgiLDc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=LcbQVVpM; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="LcbQVVpM"
Received: from [192.168.1.96] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gtqM93J47z2x9Q;
	Mon, 06 Jul 2026 03:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1783307925;
	bh=B3B1ZBSiukg0cMNgoNS2eof+MlYbjCtpIJAOc+pBl8M=;
	h=From:Date:Subject:To:Cc:From;
	b=LcbQVVpMYGB26QAd+IuweCilov4QMyDKN4Qd1AwUF/tl3XMi2r5JnQOVDUoeWSKou
	 w6ctqYhXH6yoH/ywSbVqwB52iml5QZtwVkwlKA43gYY3nomTgxJjMq3wrR/3TauSGF
	 lMjcNGXr0lk75YJgPw6JlA5OjrBO6FyNsTPv8Yx3AnAv2KdAzL9/Vw69pacys/oP7i
	 kalr9hgfipscO6SD3J28xncQAhEkvkhpjbTVhazHmovFRbzrSjZ+aQ73ESSJRj+D0A
	 XYmh5ZSIdS+UmE1q/4TxGLj0YEz1y97L3NvA9gkUffMt/c3iIIcMi9nHxl4IENL52k
	 jeVaOissNXzyA==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 05 Jul 2026 20:18:44 -0700
Subject: [PATCH] drm: nova-drm: use vertical import style
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-vert-imp-v1-1-c7b24e290763@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBBA0V+RWZukpB7xK2JR7WAkHpkiEvHvi
 uVZ3HuBJ2HyUEUXCB3seZkDkjgCO5i5J2QXDKlKc1WoDJ1MeJBsyNOKZaddYnRO2lkIySrU8fn
 t6ua339uR7PY+4L4fG9zEw3AAAAA=
X-Change-ID: 20260705-drm-vert-imp-8f4d1a46e4dc
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev

Convert `use` imports to vertical layout for better readability and
maintainability.

Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
vertical import style") and found a few more locations that could
benefit from this cleanup. No functional changes.

Separating out patches per-subsystem as per the review feedback in [0].

Tested via:

    $ make LLVM=1 rustfmtcheck || echo "fail"
    $

[0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
---
 drivers/gpu/drm/nova/file.rs | 10 ++++++++--
 drivers/gpu/drm/nova/gem.rs  | 11 +++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index a3b7bd36792c..547da5caa58d 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -1,10 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::driver::{NovaDevice, NovaDriver};
+use crate::driver::{
+    NovaDevice,
+    NovaDriver, //
+};
 use crate::gem::NovaObject;
 use kernel::{
     alloc::flags::*,
-    drm::{self, gem::BaseObject},
+    drm::{
+        self,
+        gem::BaseObject, //
+    },
     pci,
     prelude::*,
     uapi,
diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 9d8ff7de2c0f..8d8980425737 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -2,14 +2,21 @@
 
 use kernel::{
     drm,
-    drm::{gem, gem::BaseObject, DeviceContext},
+    drm::{
+        gem,
+        gem::BaseObject,
+        DeviceContext, //
+    },
     page,
     prelude::*,
     sync::aref::ARef,
 };
 
 use crate::{
-    driver::{NovaDevice, NovaDriver},
+    driver::{
+        NovaDevice,
+        NovaDriver, //
+    },
     file::File,
 };
 

---
base-commit: 78900738d981c97aad929e33620340d0d9bcfc82
change-id: 20260705-drm-vert-imp-8f4d1a46e4dc

Best regards,
--  
Guru Das Srinagesh <linux@gurudas.dev>

