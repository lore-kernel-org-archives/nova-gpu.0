Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018040;
	b=F+A+NM5iNU31Jjve8p57R8CwnsxV2QNynJti6Fam1pNJw+9+RibsDv2OgVSJJX8BbAxw
	 bC4xK7FEnpByUT9xa1R57UzZXQu8DEI2ye65uKxSvO8dZioJrFXrbRFnp6rRERY0PYGk5
	 AiJdIXBr+qISzlbm1pubjdt5sE41vMp8opG5G9zEbZ1Qf27ua7JZrzuL2hiCFCLE6MfoR
	 OK4cf1FPZy0xDiipjXN3hux5Fb/6bsSrLFig4rkR07wJO2KkeIBXj5fzw2Jn8Nuc2sltv
	 yboyuJGhymdfhjdtRx2oecpprcRcjMBeO6PF7AfpBLdKo/eef4Dtkfax1vwUvAmp0sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018040;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5VoGbSf2C7HTPR246+u5IEih5QCONxIm9Z0CKtvp4HM=;
	b=jqmgiR/XjzXoFrtRQyP4UY52aZM0pa2iBF6Hw0KlA9QDnbUJFSr7z2jW2FInPLUXhy9O
	 NShorcRW7Bn4A8SBkj7Tl57sEJxyklx+h6oXuSMXE2E25ocKKuMjwaWqhCVbVCdrkh8ZE
	 WmKZFeP4BZEKrcR6uhLBLu6LcFKVrh/0/BW1YuhvMQc9obt3c+OGIAXC59aIMs4xgdeXR
	 YBquoGDj2cSzZfL1iDbrFJPTAlX87VN/EzZO7g4e0jXWJX8XUgpCdSkbUCQsV972rzIr2
	 FYOZ/rrQ9egnCfwbH3W+XsWH8zcTIKmGf2AmB33OfznESSyp4qDmoCtklQHyLO1tjGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2AhsUWp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B46606A331;
	Sat,  7 Nov 2026 02:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2AhsUWp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FE01F008A1;
	Sat,  7 Nov 2026 02:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794018040;
	bh=5VoGbSf2C7HTPR246+u5IEih5QCONxIm9Z0CKtvp4HM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m2AhsUWpRM0xHjF9CkxdDhF/XKO0y1+4ezuERQ2SB2gFQL181sJk96pFng5Q6SnEC
	 6cLOyr/bt+CMwF+f513RGamDnZTgWtqlDEKFBcMt01S1l585Ps7V98kAciJd/LX7vw
	 AKfwPuPzw/dzO+tkH7Vlf74yv2F6GMZaAeIc0bAPdLt96XtHArz6dO7NgEtUcBsWHn
	 +S6HySksSO6AS4XoioOjl9Eu7p9y2r/BkdAeKBr+tOZRcWMBAvv/O5v17dsRDFZylH
	 DuB1/PKUhjIYa2zsrsnL95EsuANm78HYcETO90xqXPJU4nruQRhjprxhQJSUzmlw8S
	 J55s85+cdSbPA==
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
Subject: [PATCH v2 4/7] rust: fs: add iminor() helper
Date: Sat,  7 Nov 2026 03:03:22 +0100
Message-ID: <20261107021427.2105374-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107021427.2105374-1-dakr@kernel.org>
References: <20261107021427.2105374-1-dakr@kernel.org>
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
2.56.0

