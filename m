Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9443812D1;
	Sun, 11 Oct 2026 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791716843; cv=none; b=sWkJhuxZgbHaITkCCdkVzIjO7Z3HjnDncujWuGSnlJVAoUIsqfP8HjZtFb6oFzBb+owB/wiGWR5omZm68YtyqPpJCGppkhpnzh+jMR/s8wbBi4JVftXFFJ0X/6TyuPeCkw0xPCily0w3s+JpyQLU96YdeboQusSiEMyoG/YxgKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791716843; c=relaxed/simple;
	bh=aPSPkxtdC1xtBnVcb5iFiGYij+6EacqW/pIoGJTH15I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgycJRVRLsZRExAVdCn92SN9DwM6RgnVcJ03h1akNUgxHXS1xpcFv9dMzoAAC2p0imwLo3hx2fQWmbXaEAIBYyMFQtiS2ZtOCqDj/0DpdCYDniZ5GxJpIRauVRyil99c3JSU/RcZ8KBBLrpPZmvBORchpf/NR2V4ZIgu3kQmhv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXfrgyYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXfrgyYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58FA1F0089B;
	Sun, 11 Oct 2026 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791716842;
	bh=Oik8iihpD7ypx2jJq/lf9p4T0lstK2shbSri1jc4hJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eXfrgyYs3nldRI9/PyJ7IZn6pt9uf3Zp0qyTodFAMB0+kXiNPpLKFPKwS7j8v4aiI
	 m6O9GzU8YoKUss9rfh4cplxrY3eCVDHhxV3G6xaBww5QRmGCV32ERu6FuMp/TVdIn4
	 pOexm76lagOSA5LNdaXRfmrLWow4c7ZX446DDQiuCjY10Na/6zQgjN/s8LgJHH+Yqt
	 NH6O0HzexQTDEgAaG/OnZHQ6g76Si4XU/jBIpL3q7QgTPBskyXeeTZldHOnMSKzTKD
	 eiiHiuYpzhszph+TLhj6EHpDnK+ZXOdu4rC1/+xw7XGEH+h7v1CNwYdkalRDcP0QaI
	 NVfjq2rq26E1A==
From: Danilo Krummrich <dakr@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	Timur Tabi <ttabi@nvidia.com>,
	Tim Kovalenko <tim.kovalenko@proton.me>,
	Eliot Courtney <ecourtney@nvidia.com>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpu: nova-core: firmware: fwsec: use KVVec::zeroed() to zero-pad buffer
Date: Sun, 11 Oct 2026 13:07:18 +0200
Message-ID: <20261011110718.724831-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007203035.162075-4-blum@kernel.org>
References: <20261007203035.162075-4-blum@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed,  7 Oct 2026 22:30:29 +0200, Thorsten Blum wrote:
> [PATCH v3] gpu: nova-core: firmware: fwsec: use KVVec::zeroed() to zero-pad buffer

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: firmware: fwsec: use KVVec::zeroed() to zero-pad buffer
      commit: 5a1b7121a6c4

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
