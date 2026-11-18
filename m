Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019552;
	b=46zXTOUIjwWvDSxqAsaQVFmyXDcJaNYA3FVKp732AbwI6jyF5HwirsNkYdHCsTfsBCG7
	 swbPQV6TbGf36lLbm/BSufrudpiv90MTyX1FtjCCzTwhEyKDTqMAlGuepLE7Cel1z0+X4
	 U+ghYDIGaj5IXHbJ6QpJnfLDz0MzmIzhHybggfu+2IgUY+hQ/fFfRj4Wn3Ygbkz8BFVy9
	 +NvJuFlAN6SElO6HdgdIGxYCk+MUnxlZQUiBcayk4BsTBD2UaNkBpIDfPPazn0wllGQqj
	 0al31MgrJOMkCI0dW9C58wkn64nQnwZesx5YAL8WYrS3RYHYXFMHuAxRSpNT1Fm0iSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019552;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jsFRaKTpseLdw35R+S4C20jdTfDiax1ohIgt3pWo0XM=;
	b=zfFELOPbd4kgpBE1ESyh5JBuDKuzRz36EVOeZ2LGrRkYPY9lTGJhLyF2+ZV0KdNctdyU
	 //pIxGuFFVduRdSJiLzJ4FtB6S4/ZLZrymPh2N/2jD7v4XEb9lZzxjtB8dd/1CU6w3XUM
	 zVmvewZj8/6Fjql6uHy4/Z+kY0RWioJavhYcacsCZ/NNqMMTj/K+c9Ch4Pg6DhZw8lilV
	 eVOBx+AG07/A2PqJqc0XkUapmylbljxFVPInb9fvMEMsVcWg6pdjc6L0fQPhpyRg+4AeJ
	 cfs8NzxHYnkE9gXvLgJ6y6CvXTAsKdHw4do32N+u+GhIKGfAi642l/RIwaB4+Z/tgwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fePfAb5m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701E6606A32F;
	Wed, 18 Nov 2026 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fePfAb5m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0571F000C6;
	Wed, 18 Nov 2026 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019552;
	bh=jsFRaKTpseLdw35R+S4C20jdTfDiax1ohIgt3pWo0XM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fePfAb5mNj84YDnRL6GHEgaa7pYeJrgPQMW+BRi5p7uFuJop/6jb3ExaD7QauT07O
	 bYdzi/oAfnE/Pkd8z1DaqAaNlZmQRpmf1qU0uB3LOfcm3mpiYxprndDbgCiMMwj/gI
	 5MaqqdZ4VrjY/3PvBI+T3hMgPTr6Rc3K4wA6Z6q7VRXwW9if+Y8gQ8Q6hTqDIDwtN7
	 a4tiN0JxSmmPJ7Gle+dhyEWvdbXpHoxgiWNufg/tXtvYplV1G+9NlHgF3LL25t1lQk
	 Oy5+IyVcb0eCfgcJAaH4Q114Nay/6Zf93f+Zxxl3YuQaG8hpX68ivnCAElfbcMyTDm
	 jK/gx3u+by+Iw==
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
Subject: [PATCH v3 4/7] rust: fs: add iminor() helper
Date: Wed, 18 Nov 2026 17:29:45 +0100
Message-ID: <20261118163203.2483856-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118163203.2483856-1-dakr@kernel.org>
References: <20261118163203.2483856-1-dakr@kernel.org>
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

Add a Rust helper for iminor(), which extracts the minor number from a
struct inode. This is a static inline function in the C headers, so
bindgen does not generate a binding for it.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/helpers/fs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/helpers/fs.c b/rust/helpers/fs.c
index 789d60fb8908..d6f9782db178 100644
--- a/rust/helpers/fs.c
+++ b/rust/helpers/fs.c
@@ -10,3 +10,8 @@ __rust_helper struct file *rust_helper_get_file(struct file *f)
 {
 	return get_file(f);
 }
+
+__rust_helper unsigned int rust_helper_iminor(const struct inode *inode)
+{
+	return iminor(inode);
+}
-- 
2.56.1

