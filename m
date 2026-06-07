Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A621DA23
	for <nova-gpu@lists.linux.dev>; Sun,  7 Jun 2026 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780841448; cv=none; b=uQkGNwBdC/8ZM8PddbH/+E/D1GcTW5xEEPsOqKhcptZ/MVXsu3nsLRVgqfBTQgy7+RxjGi0iMNf1eY+/anzIyBbwPLw7jLZbehKuWVrcsztP3ILsJ5H1taiLXHq30JyCbO6NZJYGd9fpFmhboPif5HIXZc4J/D/BpK/3RXrtfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780841448; c=relaxed/simple;
	bh=ZTZYZAboHe/j0LLAMdUnKVlp9G2BZPH+fD3KbooJLMk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aPji0x40tbhKtAcSmDThXzuwWc9q3q0C2LLDdY8/elzMMdmE6OiDPOZcmz2keaH5Az3SEEFbOP01C6UQZOaqscwVWEKs87AkIdbFIZMWXaJfD/8KUD3oRBq2FxjQqQB97aoYcDUwH/5xFEo0pUKpRrqOmsRMr5NZUg48YJ/OptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=jMNxZZJ8; arc=none smtp.client-ip=79.135.106.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="jMNxZZJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail2; t=1780841436; x=1781100636;
	bh=mc1aXwPRhTXQPWkVJ8hArrkVguP6GNBxem9Kvh7S47s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jMNxZZJ8hAgsyF7tfgG9l7dZL/OiPa2MBEoa3wFOGEWBhMGJ3VIZXdXxbEv4DQFpW
	 69QRb2hjug9gqi+n7piemnq4n/T888Gqk746HLdaoRJp+rELWenpzU3pixz+3LzOIc
	 rfpKRaGHQkEyXboTUTXxlML8VvjbMp3C+fy58qeEQ1fKz9xGikaKDusrUMl5xEi4W5
	 Is95AJZa+2tTPVkgqO0jbdMWBoggqfMlspEDefH17ILLV6Y05KZBc1E4kTYRX7nV2O
	 3DaQ+ykdXZTXtpH0efZ32T86tFUPJsrpOH5nXwApMcWuqYdp4YVTbIQnpm+GwrvqJY
	 OZ8Hb+7EQEtfQ==
Date: Sun, 07 Jun 2026 14:10:31 +0000
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Cc: Antonin Malzieu Ridolfi <dev@nanonej.com>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v2] gpu: nova-core: gsp: Move gsp register definition into gsp module
Message-ID: <20260607140949.152575-1-dev@nanonej.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: c1bd045279544bff563024835e5344ac2b622d52
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------cec3ca5dd3a0d2685dc7873493a86b0ca20e61251caf7f4286c56d28b7bc4f44"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------cec3ca5dd3a0d2685dc7873493a86b0ca20e61251caf7f4286c56d28b7bc4f44
Content-Type: multipart/mixed;
 boundary=72b63b1e0f5d8280d91a0d3de0d4a5e642de8ded7ac7b4e95dc7d84557cc
From: Antonin Malzieu Ridolfi <dev@nanonej.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Antonin Malzieu Ridolfi <dev@nanonej.com>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v2] gpu: nova-core: gsp: Move gsp register definition into gsp module
Date: Sun,  7 Jun 2026 16:09:40 +0200
Message-ID: <20260607140949.152575-1-dev@nanonej.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0

--72b63b1e0f5d8280d91a0d3de0d4a5e642de8ded7ac7b4e95dc7d84557cc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the gsp register definitions grouped in nova root
register file to the gsp module which actually use them.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
 drivers/gpu/nova-core/gsp.rs      |  1 +
 drivers/gpu/nova-core/gsp/cmdq.rs |  3 ++-
 drivers/gpu/nova-core/gsp/regs.rs | 11 +++++++++++
 drivers/gpu/nova-core/regs.rs     |  8 --------
 4 files changed, 14 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/regs.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 69175ca3315c..385b4c09582b 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -22,6 +22,7 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod regs;
 mod sequencer;

 pub(crate) use fw::{
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 0bc5a
95a9cd7..495d07d65c39 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -51,10 +51,11 @@
         GSP_PAGE_SIZE, //
     },
     num,
-    regs,
     sbuffer::SBufferIter, //
 };

+use super::regs;
+
 /// Marker type representing the absence of a reply for a command. Commands using this as their
 /// reply type are sent using [`Cmdq::send_command_no_wait`].
 pub(crate) struct NoReply;
diff --git a/drivers/gpu/nova-core/gsp/regs.rs b/drivers/gpu/nova-core/gsp/regs.rs
new file mode 100644
index 000000000000..a76dea3c3ab0
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/regs.rs
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::io::register;
+
+// PGSP
+
+register! {
+    pub(super) NV_PGSP_QUEUE_HEAD(u32) @ 0x00110c00 {
+        31:0    address;
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0f49c1ab83ad..73339a0cff99 100644
--- a/drivers/gpu/nova-core/reg
s.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -227,14 +227,6 @@ pub(crate) fn is_wpr2_set(self) -> bool {
     }
 }

-// PGSP
-
-register! {
-    pub(crate) NV_PGSP_QUEUE_HEAD(u32) @ 0x00110c00 {
-        31:0    address;
-    }
-}
-
 // PGC6 register space.
 //
 // `GC6` is a GPU low-power state where VRAM is in self-refresh and the GPU is powered down (except
--
2.54.0


--72b63b1e0f5d8280d91a0d3de0d4a5e642de8ded7ac7b4e95dc7d84557cc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - dev@nanonej.com -
 0x8FBDF600.asc"; name="publickey - dev@nanonej.com - 0x8FBDF600.asc"
Content-Type: application/pgp-keys; filename="publickey - dev@nanonej.com -
 0x8FBDF600.asc"; name="publickey - dev@nanonej.com - 0x8FBDF600.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuOS4wCgp4ak1FWUVOcThSWUpLd1lCQkFIYVJ3
OEJBUWRBaE9ncm5ac3lDYUlXRXFUTmc2MzRGcldMS1l0N0lubEExVjBNCkkzS28zYUhOSVdSbGRr
QnVZVzV2Ym1WcUxtTnZiU0E4WkdWMlFHNWhibTl1WldvdVkyOXRQc0tQQkJBV0NnQWcKQlFKZ1Ey
cnhCZ3NKQndnREFnUVZDQW9DQkJZQ0FRQUNHUUVDR3dNQ0hnRUFJUWtRVXFiTkt5N3F3UEFXSVFT
UAp2ZllBeVl3RnV6S0J5ZEZTcHMwckx1ckE4Rnc5QVFEMWFENXBqS3llT3UybHpFb05CUC93VUZ1
K3g5UGFWYjBFCjNTaFJGY3V6ZWdFQTJVSEtOdkk0WERNM2NDL0UveVM5ZmdlS29ITmMySHFvOVBq
a2o5cjFlQXZPT0FSZ1EycngKRWdvckJnRUVBWmRWQVFVQkFRZEFPYW1xZmltdGliaE5LQ1d3QjFW
dzZVNVo4ajdWQ1V4TTFDeHBlc3k3WG1jRApBUWdId25nRUdCWUlBQWtGQW1CRGF2RUNHd3dBSVFr
UVVxYk5LeTdxd1BBV0lRU1B2ZllBeVl3RnV6S0J5ZEZTCnBzMHJMdXJBOEVMeEFRQ2xYRkFFR0lM
cGsvT010T2hVSS9SN2hKa3h2WnZGR1pLRTZ1L09XZ211N0FFQTRzVTUKOWdIS0t0a1JIcWtKMTlN
Rnk5Qmt1Ykw2ZUZQTjQyNTVTbFZDUEFrPQo9U1NJMwotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBC
TE9DSy0tLS0t
--72b63b1e0f5d8280d91a0d3de0d4a5e642de8ded7ac7b4e95dc7d84557cc--

--------cec3ca5dd3a0d2685dc7873493a86b0ca20e61251caf7f4286c56d28b7bc4f44
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmole9YJEFKmzSsu6sDwNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdyH9mspuLHYRkCZEtwtHebFiEEj732AMmMBbsy
gcnRUqbNKy7qwPAAADRhAQCUUxFAfyguUT6BtKlUgCmzcAJnB0cVfz0GGBwb
Zr+RXwD/dRrAUlO7x/dUVe9vfH6oGA/iRejYuU/doTwOh7PfoQs=
=bQyb
-----END PGP SIGNATURE-----


--------cec3ca5dd3a0d2685dc7873493a86b0ca20e61251caf7f4286c56d28b7bc4f44--

