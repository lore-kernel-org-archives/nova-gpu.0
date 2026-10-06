Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158C022425B;
	Tue,  6 Oct 2026 06:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269704; cv=none; b=WIeeTcjS+VjYl0stJ7y/ZEbP+CyvyGXt7yK0snzUuViPnL2HBpEp4TQigIwcj30UFpXBVCE5OdG9RHYzac1UE1IMAtOkg3083PtxKlEtnKsAxRDPgYRdpeV+56lmKp+YASf/BqfjGr1vniCSmGHb0lt9pN3ukFQdaNrDCYu+Nhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269704; c=relaxed/simple;
	bh=Qn23wxiXez928e4XtpLbgNBHH4EiwBuPKrXVHQ82dos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRWvlF86uA9783BZQAZy1Z+AMX0p+QDW00yOn9PtvYP/2RmZxrXpRRa0zB8CmkNLeqQME7aTgU37ksaZqlcUmSADKjhZ/PLRDqAiwaJCE1ys9NsPsyVp38HPCDpzVNNhVDfFd6uC6vnzxFPOT2R0K1NuSwiRZDoxjfznAJwkmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFTE6okV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFTE6okV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26891F00893;
	Tue,  6 Oct 2026 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791269702;
	bh=kWfhtTsuBDzUJb00n8FTUxSmpeehi2Dw7Nxj3gMMr6Y=;
	h=From:To:Cc:Subject:Date;
	b=FFTE6okVVv2MKCisB77eJtQ8FbDuW2b1gka+r95Tks+CN10DiFUA0E02zOP+RE4Gz
	 3dam7DUKthjxqVSVCd4YvvV+yMw94fQb1ORwjft1WTpSxbKODV98en2PbhiQFjiVK7
	 DDTQw/rHk1XUNz60ofG1B83J/vvGz8dfRfr5MWWnYMbG8bX+2b6FJl2I+TrHTU9MUp
	 ZypkBfEwY/YtRbdxX2XU+vIztzImtbh2Mv9rVxvSiK5Emvh+v8smGduqa4PW1gBEBZ
	 rXB33n8hyTgK6wCv5fucEmpRqgFb4kHbN12CWdZ1rk89iRzTnhOINsdEqIlQbntwKg
	 ix4jvTZWQ/ijw==
From: Thorsten Blum <blum@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	Tim Kovalenko <tim.kovalenko@proton.me>
Cc: Thorsten Blum <blum@kernel.org>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: nova-core: fsp: use KVec::zeroed() in recv_msg()
Date: Tue,  6 Oct 2026 08:54:35 +0200
Message-ID: <20261006065437.58408-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=blum@kernel.org; h=from:subject; bh=Qn23wxiXez928e4XtpLbgNBHH4EiwBuPKrXVHQ82dos=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlHZuuea3j87Xqqu52FvOLURTP9b8cbvrm56qrM0trnT ru/aP/40lHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATqX3CyPBO/NuLx1l58/Sm LFzCyxTIeuP+/39r1mZ6v3FfJbViJm8pw//09lff9+gk1dZWHtrnYK16capU61fV9unanCKpDsw T+XgA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use KVec::zeroed() to create the message buffer in recv_msg() instead of
creating an empty vector and resizing it.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 0437180b8829..4190f4f8e8c9 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -172,9 +172,7 @@ pub(crate) fn recv_msg(&mut self) -> Result<KVec<u8>> {
             return Err(EMSGSIZE);
         }
 
-        let mut buffer = KVec::<u8>::new();
-        buffer.resize(msg_size, 0, GFP_KERNEL)?;
-
+        let mut buffer = KVec::<u8>::zeroed(msg_size, GFP_KERNEL)?;
         self.read_emem(&mut buffer)?;
 
         // Reset message queue pointers after reading.
