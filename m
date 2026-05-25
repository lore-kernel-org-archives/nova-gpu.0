Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D517B26D4E5;
	Mon, 25 May 2026 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779749948; cv=none; b=uFqh6WKxfmGmZ9HrmBahHgjXBKP4NMNBOqWuwC8EuXaJfPQuOug08p1x2+4JxaHDNvNmjLV2jGgGWit1PzStlJqNo5rbeUJDNMz4gb7u3YEdv5IU5czKjmhLyLykpUHOfVuwmzxzo2QGF6TgY2ClI/RByWThiZzniaMPHcE08sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779749948; c=relaxed/simple;
	bh=5Q2H9oTMGxcEIEUYvpNpdo4a31vyJVUroWXVr8xaDRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hETQz7LiAB+oAoDjk7LJde+Whuk1okhseGJKLwHpAaOkJSmODOwDbRRVr8DQsTB12C0CPvtjKbV76G/hBUrlPmQX59+qxwPA26cimrMmH6Rpfm3E3XHmcnC6GoKlxY65TZraO3nlSmg6UASWHlFsdwfxie2fg+xcHBk3BVIWeiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1Pjd28n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1Pjd28n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8981F00A3A;
	Mon, 25 May 2026 22:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779749947;
	bh=XNOA11o3XVKPjE8hzFVrc4KJGxqos6GX3K9OdJH/JfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n1Pjd28nN1kAD2QhDt9geotEnooMgSRuMrQKhsAqwI+ijSFd54tWYVzW2Epltbh8J
	 itGl1PIuCx3zfCe/RmdeDYCtCoYWYB8OJrMKo9Y6+OeX616y2ogSjDQThsIeI+Vruz
	 hBNQhfB6u2qOVczqn8IzIL/A0WEbbjEMaB6s8z55Th85/e/J7/iyK0PK2OGcfx5d0i
	 9a2IOwiIyEGqGPvjh4jit5qg1GT6VR1KQSk8Zy7fC1eaBTutRR5QQ6x2vSlaR6xIA4
	 RPVr3f8nnhYBG7DwPgv8pagzkEQLv6hSacI06ciNeBuzK2TKFvvQaeAaJxiAHjRvPz
	 o9xtCm9jC1/pw==
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
Subject: [PATCH 5/5] gpu: nova: separate driver type from driver data
Date: Tue, 26 May 2026 00:58:33 +0200
Message-ID: <20260525225838.276108-6-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525225838.276108-1-dakr@kernel.org>
References: <20260525225838.276108-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split NovaDriver into a unit struct for trait implementations and a
separate Nova struct for the private driver data.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/driver.rs | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index e4765bc5b3ec..4289df7de01c 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -15,9 +15,11 @@
 use crate::file::File;
 use crate::gem::NovaObject;
 
-pub(crate) struct NovaDriver {
+pub(crate) struct NovaDriver;
+
+pub(crate) struct Nova {
     #[expect(unused)]
-    drm: ARef<drm::Device<Self>>,
+    drm: ARef<drm::Device<NovaDriver>>,
 }
 
 /// Convienence type alias for the DRM device type for this driver
@@ -51,19 +53,19 @@ pub(crate) struct NovaData {
 
 impl auxiliary::Driver for NovaDriver {
     type IdInfo = ();
-    type Data<'bound> = Self;
+    type Data<'bound> = Nova;
     const ID_TABLE: auxiliary::IdTable<Self::IdInfo> = &AUX_TABLE;
 
     fn probe<'bound>(
         adev: &'bound auxiliary::Device<Core<'_>>,
         _info: &'bound Self::IdInfo,
-    ) -> impl PinInit<Self, Error> + 'bound {
+    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
         let drm = drm::Device::<Self>::new(adev.as_ref(), data)?;
         drm::Registration::new_foreign_owned(&drm, adev.as_ref(), 0)?;
 
-        Ok(Self { drm })
+        Ok(Nova { drm })
     }
 }
 
-- 
2.54.0

