Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1151286D4D;
	Wed,  2 Sep 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343594; cv=none; b=hVT0zV2FZdVKrhPY5JiLmC8GfI9cwMOXvIFTC6SXX+79qR+8iG0GPl+1qehHkMg+1nmHBhQwWr4w5+Ka6MPhhJQomIgXqFKE4SfVI9uGtd8IfQ1xqH2QKhy+277TBe6tqs1rBlGsefU5nkkd8mwDkbJQ+waxZbW5M4w+BIc7dzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343594; c=relaxed/simple;
	bh=zfw/vKEi3Tzb+UmBdVBd332T/Bkfd0dEXho6+QDWCDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxqWRIG0USruq9Q7kqUSAU2Df32w6+8FDIZ0k2fm0yfK+q530hGmesxtU2ZyNNUopBj7NNUm9kNCYkYzSbXf8fd4umd5Xq8+DCfoValxgp75ebKBowfntgMEuAsU1P6z4B8+zbcvbMKSDFpVTDqe3+hkpH4GoMVYOXxkutFETfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBSVFzGX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBSVFzGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0E51F000E9;
	Wed,  2 Sep 2026 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788343592;
	bh=ufLAySM7AAtOX70lZUDTqhAg0NA70sDLC1WuvXPgccw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OBSVFzGXlIgc+mvttW5VInpnc6S1Ck7qUdjgdhQDSjH69DtIDuDAuC3bXBSF0EIN/
	 vWLtRO3kmt1tZu4kS6CW3C5NzmbM1KyGN6YU2WgswnQJ4omSlPNDr58qCo01xyAXxl
	 2+T1iT33AFv/6z4gtbDnTrprn7+8MF3h5RQ0CwWkWr4VKZYoNKOwtmSm2WghGYBRJw
	 sD10BBcoc/1eDjP7uXysNjpIJNlTsweyrp2Ig9g5tvS/GyMZBoMokdWZ3EqV3Fhz2l
	 +cww+rf4ebEC0S+fifrS/TCdraZJCrR9fiW+NLkjcR2GfAr2nMrgKUie9HNt9wnWap
	 NWqPDzp0zXRYQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] gpu: nova: fix incorrect GSP barrier usage
Date: Wed,  2 Sep 2026 12:06:23 +0200
Message-ID: <20260902100623.15225-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-rust-barrier-v4-0-94427f445310@garyguo.net>
References: <20260901-rust-barrier-v4-0-94427f445310@garyguo.net>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 01 Sep 2026 21:59:31 +0100, Gary Guo wrote:
> [PATCH v4 0/2] gpu: nova: fix incorrect GSP barrier usage

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/2] gpu: nova-core: fix barrier usage in CPU->GSP messaging path
      commit: 9e270c4fd863
[2/2] gpu: nova-core: fix barrier usage in GSP->CPU messaging path
      commit: 6cb331644c44

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
