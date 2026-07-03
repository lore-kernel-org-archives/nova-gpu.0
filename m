Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424763264EF;
	Fri,  3 Jul 2026 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783114167; cv=none; b=kQKi4cvkt5bdCgPbpDrU/5qMjuIhh2O/dPqt2+hZPbglBRfUUCvRqOo+98MDMW8iBzRxMigCTJmVf7p9mtkrwc/MsQL/PPHfBV6re2tOC35Rr92BZdAyb1uCba5/Zcrh5GNAjqEinzAZbJWYD5eDWcHLccEWQ4zrX0MuYXEmMNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783114167; c=relaxed/simple;
	bh=nkYN1pwm2vqJlFDxtWEqEJUZT9vz0xqc9EYiXh4ulDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nNlwl8+c4HJW46cs/wpdK7cQZbbLSCzh0ZX5lF+fwt1OLYlP+i0Q9SFmfFODZ5q/HwS2/5YrHK4HnFeJQxoAg6HR53H3kI3iNFygKWSa8rR5nKZZNktzpcH/R5cszpwSfk4P2S6fHDuA/XvEOuOsBYH5ksjvQ/Wh/hLCTVzTCdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaBF/qet; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaBF/qet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29CE1F000E9;
	Fri,  3 Jul 2026 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783114165;
	bh=eeGmPiCUrx3tRv7prGmGNvbbmUHuuabvRiwfxaKx/PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YaBF/qet379T/gqDqz+jcfD91Vru683MyiAxtDa1on3YG8KHN6I0bMDCL11mLLOiq
	 fy1+rYToW/CrHThvSkkdlu5Fu92fKvhBlkjrHKz2m7Ab03Cd0N6E9OLrYGpVln3Vss
	 TGJ68ZYfvyWTwWz+LpOP9pDkVZgzqz86q7zlrYqpoME4wKUhWq8EnjeVfAt6hiuCLB
	 b+gy2KiaFIitzXUKomEs2WC2oHb3HAWr1374ypGZJp+qfLemUp+v75mQlkR4FOG2L4
	 B29UM8IHpyrohp9VBhJ+D5LhgL4H278tjVNLTy0xMO0HEnlOQNNZpAtftoag2/ZlrB
	 Jd5KWc+Udgcmg==
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] gpu: nova: fix rust-analyzer generation
Date: Fri,  3 Jul 2026 23:29:18 +0200
Message-ID: <20260703212918.1200823-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701-nova-rust-analyzer-v1-1-5209f486f10d@nvidia.com>
References: <20260701-nova-rust-analyzer-v1-1-5209f486f10d@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 01 Jul 2026 15:40:51 +0900, Alexandre Courbot wrote:
> [PATCH] gpu: nova: fix rust-analyzer generation

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova: fix rust-analyzer generation
      commit: 78900738d981

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
