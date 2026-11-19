Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109292;
	b=Ktdt1DAH6/01YDFdvKI5pJqOc+OtioZtCBxYV7PE2xiHn95Al5x5H8XijcWrwy1o8RpG
	 Mq4tdA+LkB5cpbsI/0SaicuL0hs8WbtJcsiNUgDKOX6ES3HdiQIsfzjU5WDNYRM9++/Gc
	 5MUlLUKCeeG/0ZJoJeu3vf8kd+nuabgFH4nAXkWYazQbQiWhgR+7pw2UfSYMF+WAECX+9
	 YYbI3wK3M6Dvzjj4TJyuAyAgR/WOWek7N7cWSj4KhJqChDT0f7HOVAbZYdSQxc3xKM4YB
	 HZItqPyThTZIT4F39eo+hvhOV5aJ+wkJFT0yHUohS3G4F7Qi49YnBia43U7Svzwmo4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109292;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=MBitJYL2/UcM46VwgXCfRsDu1jd7w3VQLlGcia31y9Y=;
	b=Rdc+xJeNUScVeLA39oZU3GDrBK5OnAy+SZfBC6gHoUfsY6lKv/HW+ndeGKQUHN0WvEqv
	 I3ylYfCzcRyeVvpdyRyu5IARhkGqk+Y8UKb9dYfBuqPWJluCZlcFwd+Ln4gTdmSlwvI8f
	 9RnZV5qwwfLe0ZfiC03qEYF4I6wLAVBxl9WuxbZPWGSJ6YeRLP4sHlCoPmUE1sj15bS6T
	 NsHhU3HGOEJTPPPcx+HS3NPEitAEy7f1cVBypI4TtqATD348YefutNgVYmNDpLii9FDvw
	 vX2GtEWKQaxQ3UMo6iuf7NTGu+Jz0hzMvXq9ejZXfXkljthVt7fDgUwrKDXsxnUF5FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8iu34cB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC7A606A320;
	Thu, 19 Nov 2026 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8iu34cB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1761F000C5;
	Thu, 19 Nov 2026 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109292;
	bh=MBitJYL2/UcM46VwgXCfRsDu1jd7w3VQLlGcia31y9Y=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=g8iu34cBbiseCsOHSffAmyr3qpzB/uHPmPHo58aYmg764mPuvzTUwIwUobNPFVkxw
	 1iroSANozUsXJybkR6WGHaYiD0wLduXLXLbPKpfpErZCb5r6jX49umF6K+3gqko52A
	 WLOLTR0A7SNEIAwJVocWWFAWq0t+59MBRachTe219OYADRf0kF12/bnGzY6JRsZpRZ
	 6MbOj4HFxyaEE86OxlGyMRz2iWmb1vO4Jg5jJ2he6Z/QxzxM75+YdnqtrtAevUG3KI
	 gxadmmIRjA5mRuLAI+F908piEtCN0qLQkKOGKh+MT7M8X8cSSjB6IR9eMV6imI+Q82
	 bpJBp/Mm48fWg==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 18:28:07 +0100
Message-Id: <DMZD4TXCZSRX.HN0ETV0FWFIY@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <daniel.almeida@collabora.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <acourbot@nvidia.com>,
 <work@onurozkan.dev>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
References: <20261118181245.2583303-1-dakr@kernel.org>
 <20261119111746.3049044-1-aliceryhl@google.com>
 <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net>
 <CAH5fLghc63zD9c1F437pQiX+ohgSkYQe4nt3xP4gSTsqAVLzBA@mail.gmail.com>
In-Reply-To: <CAH5fLghc63zD9c1F437pQiX+ohgSkYQe4nt3xP4gSTsqAVLzBA@mail.gmail.com>

On Thu Nov 19, 2026 at 12:49 PM CET, Alice Ryhl wrote:
> Good idea

Indeed, what do you think about this?

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 774db3acb15a..8c48dcfdecec 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -158,7 +158,11 @@ const fn compute_features() -> u32 {
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
         unload: None,
-        release: None,
+        release: {
+            // The DRM core frees the device without running a Rust destru=
ctor.
+            const_assert!(!mem::needs_drop::<Device<T, Normal>>());
+            None
+        },
         master_set: None,
         master_drop: None,
         debugfs_init: None,
