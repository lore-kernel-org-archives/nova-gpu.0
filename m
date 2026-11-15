Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782566;
	b=Hqn0ce6i46LRVEnvC8myR+xm3plq5RvMUcppNUmog8P4g1nyXLiItAQQOi3KrRQCFa45
	 9U4wKcqwxbfRbzThbzGQG8bWIPCB3WoqoEMvkKx0/pa5G6DFxoNzw1OckSaj309rlNKj+
	 WI5iD03TjtR8RysHSjy+/d09akNfR/l9B13VjE1xt1qaomVxZkAbcWmPIK+agHIJEuARw
	 eRXt5jpWblmfmEVASQ6RTl2AeU+klrPSsQ7iLSYekOs6MWUV4V9aLEdvd9V7q67IC9TYg
	 DYlxa40V185Fzn3Cs5QcPrxm//dvvEgnqEgDvaSmV38dwlviIQ9FovU0JmpnDQjczDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782566;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HWNQezm7qiydS+vQaHkitAC+iC5yiaIdb2/keFM0doQ=;
	b=PxhltjyUW0CHVU/o0TbMmnt3iAa9jVdzC+AQOoyXFBnC3AjoRzm+Q3VwipDyuYTqrLeX
	 xaV3B1C7L4R/6z0jsIJm7rniDaSrnUMh/hkdPg2v9Pm1jj/uEZsQ8Pe/dunaAvuaQlWQ1
	 aKvGBlnGmErJ+4cXgeiJZydSP4uOobwtkWNGIJlg0DoubrAIt6VS85pEzWTYRXp6eQmO2
	 VUSVa9ens5/NseVOGGguIeqEghcwsHroUhyUDs0kVyijhD+5R2vk8mp2Xkoo78XiqQPVG
	 PjXfYiN2SYh6N2Q/IIlBph2eiyxAasvBerrmojKa1cIw/Q3lUUpVQUCTEEYqC2jqp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fmn3QQly;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80940606A331;
	Sun, 15 Nov 2026 22:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fmn3QQly
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54EC1F000C5;
	Sun, 15 Nov 2026 22:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782566;
	bh=HWNQezm7qiydS+vQaHkitAC+iC5yiaIdb2/keFM0doQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fmn3QQly2We+17+W+XKakioLjkdgvsXQRlDaJvcOcwk8L7mSvWegmKsy67KEEokAE
	 ybsSrc7qxZIW+zA4ZW5C5AgnP77anhlfu5GjxL1YxE0bRT/A0jSmzD9tWtr8RRZ0y7
	 FYL3R3OSc4ZPcGhgIlaBuKXQx5X3i9mIXQ8phtNDcKjsLokVEDKcffm+q/3xmhL7kO
	 YZzpggbPILKPGszDZdwSXSmkrR9knRzv45ZO/PbJvRc++f9I4zd3Db9xhMyY1NmmL3
	 UDwuayA9vyi+qQwKvHZwyFD1I5qVqCqrcyQFkWefoIRjIzWFsjP/JybVfFbXceCTEW
	 nsC+hA5u8kFIQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Vladislav Zaharov <vladazaharova2018@gmail.com>
Cc: dakr@kernel.org,
	jhubbard@nvidia.com,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 0/4] gpu: nova-core: retain the GSP-RM log buffers
Date: Sun, 15 Nov 2026 23:42:36 +0100
Message-ID: <20261115224236.65017-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114044304.245684-1-vladazaharova2018@gmail.com>
References: <20261114044304.245684-1-vladazaharova2018@gmail.com>
X-Patch-Reply: applied
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 14 Nov 2026 11:43:00 +0700, Vladislav Zaharov wrote:
> [PATCH v8 0/4] gpu: nova-core: retain the GSP-RM log buffers

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/4] gpu: nova-core: move the debugfs root into the module data
      commit: b9a34b6ac2f7
[2/4] gpu: nova-core: gsp: move the log buffers into their own file
      commit: 35d780c3c9c7
[3/4] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
      commit: 27b10da20729

      [ s/scope()/into_debugfs_scope()/; drop unnecessary explicit Infallible
        from into_debugfs_scope()'s return type. - Danilo ]

[4/4] Documentation: nova: remove completed GSP log buffer task
      commit: 8045d0e7d208

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
