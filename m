Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA53B8120;
	Fri, 14 Aug 2026 23:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786748991; cv=none; b=AfUNPoegX7NR4qN2U/PWjJFqUmdx9MxKAwtfdttcSLyljzapdTTXttstXpgg7TUuH69V+h/Y9Hsyd18RUMl0e0je79B1IfUSUugSJ63L6Yb3s16+BJF2O3W9DB4xHSRB9nhmGUq2RZ2tebZVpZRSf30ygKAnA7cfZfb3N6bSulg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786748991; c=relaxed/simple;
	bh=jmJlsOUR+tvIzSDyik2faVUup1QzcYWgSEaT6kMFMzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmYO/Tz1hsvcJOohiOzGhbxYZ9ympvW1kHbwymvP/l7Sy9RWMWGTAVrh3AME7FsvSI7z6uC4UqcbSeBSMvQt88/KCzVV5L35uv2LY3ITfbWg2n5JdZbiN7T/YANXx0mspwjSJU/JLQwBmdSHl6GzDPPUbEy4pByZjXULv6YaAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klIwKAVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klIwKAVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6781F00A3A;
	Fri, 14 Aug 2026 23:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786748990;
	bh=duuk6GqeoZYD9b1T5EoO3ZVOSGx2xP5WwTkfsxIM2Mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=klIwKAVcrqKEMzr6LEehcpxVD9MEoUPr+7yL8WGqi+/7zfwY0kgFdJYvmHvV/O10m
	 vu2CgWIZSJdVXB8RN/HLDJt4wRidQQsTV6v5Jg17WlqLe4Qwbq3vGrY+ZLO1HT0YAi
	 4MDStLbCXA/7Dgt8zBXWZzB16IbD72CVM7BqVVYrQnG23l5w43GgCPy3D2H4b0JGjN
	 4fnCUIpkNtgE6oII7q799o1KjEm/TdfvqtTx7uWsN8cgyMrpA+Iy5E1z70H34Sbq2x
	 6WzEMQm+L8V+CxmiuvlHseeaMv8CwiAR+Ezye0Gqwwvuuraj179cmtfQr5g51DfSie
	 eZhExL+zBC2qA==
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
Subject: [PATCH 4/7] rust: fs: add iminor() helper
Date: Sat, 15 Aug 2026 01:09:02 +0200
Message-ID: <20260814230923.1292966-5-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814230923.1292966-1-dakr@kernel.org>
References: <20260814230923.1292966-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Rust helper for iminor(), which extracts the minor number from a
struct inode. This is a static inline function in the C headers, so
bindgen does not generate a binding for it.

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
2.55.0

