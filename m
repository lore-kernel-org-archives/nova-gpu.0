Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E3636214C;
	Wed, 10 Jun 2026 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781118551; cv=none; b=dUHjdSCb7v6PLMQNzJkrxgQmqwQwhhn6xijdIvXno8lCaZQmDyKkY4FVLkXmjxLsbximg/MJgX3LGMhGTFHmj7qxkn3YTVRd+8fj3lPm3dilBhEQtSUvWG2N+FSf1Rx5t/p3iasXDpLDmXtqvghCUeCkw6WlAdlcbzq2v6FUKvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781118551; c=relaxed/simple;
	bh=6ol5ELg/ugswhtm62elVqio85Qt/sey+1PZF71rvIfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jWkRPi/1WrGWzreqZZEv4VBPqbOgxuYrIX6CbCR5FkzueZZK3MceY/rM8D91lXYmkwIoZUqEfOTmAJKb/8h/PkgRwGrwx5LrsBmGki2+pWu6VaVvU6m1UQKrO0ww4i+TK3mT/yPX0wHHoWEzdctLvOlH6F0Lujto9bT3cPowH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZGtlUi8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZGtlUi8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC371F00893;
	Wed, 10 Jun 2026 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781118545;
	bh=HtAPuYXNsOgrgpLVDAT45ANshg0FE4v6rtaR6L86Euc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hZGtlUi8+XcjYz9AFTiNgjdqO7trcW3sEoWDhpUw36dWDpZWL6yBgGgnvv0Z+Im8l
	 0iYizRRqTK1hULNGPaICOyAl8NycCcsFh6gjGVT/L0dxMMlSc5fmzcblfR8vMXCNl9
	 6SOt1fUFYSS7YHMf4QGpvOJEZ0jtdyFbjkFwHOY2acVi3qp4oKqHEaw0woRp7ICRk4
	 HhEV18m4K/CQmPUg094cdnaBCa8wg8F5S0Y4HY0IW11tca8a4mSymU2ObR8gnpL+I5
	 wYl90U3TExWnMdiOlPp0C6pxQXrWTJ/TC3OB0p58niO3TTWTYVWfPSEDia+VfEtn8Z
	 0kG/N3C55IIEw==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpu: nova-core: remove imports available from prelude
Date: Wed, 10 Jun 2026 21:08:57 +0200
Message-ID: <20260610190857.65190-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610135716.1013688-1-gary@kernel.org>
References: <20260610135716.1013688-1-gary@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 10 Jun 2026 14:57:14 +0100, Gary Guo wrote:
> [PATCH 1/2] gpu: nova-core: remove imports available from prelude

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/2] gpu: nova-core: remove imports available from prelude
      commit: e453072df254
[2/2] gpu: nova-core: use `c"literal"` instead of `c_str!()`
      commit: 550dc7536644

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
